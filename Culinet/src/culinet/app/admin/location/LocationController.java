package culinet.app.admin.location;

import java.net.URL;
import java.util.ResourceBundle;

import org.controlsfx.glyphfont.FontAwesome;
import org.controlsfx.glyphfont.GlyphFont;
import org.controlsfx.glyphfont.GlyphFontRegistry;

import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.NodeOrientation;
import javafx.scene.control.Button;
import javafx.scene.control.ContextMenu;
import javafx.scene.control.MenuItem;
import javafx.scene.control.TextField;
import javafx.scene.control.TreeCell;
import javafx.scene.control.TreeItem;
import javafx.scene.control.TreeView;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.paint.Color;
import javafx.util.Callback;

public class LocationController implements Initializable{
	
	private Location location = null;
	@FXML Button actionSave;
	@FXML TextField inputNameLocation;
	@FXML TextField inputDirection;
	@FXML TextField inputRazonSocial;
	@FXML TextField inputRut;
	@FXML TextField inputGiro;
	@FXML TextField inputCasaMatriz;
	
	@FXML Button actionSaveTable;
	@FXML TreeView<String> treeFloorsTables;

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		
		GlyphFont fontAwesome = GlyphFontRegistry.font("FontAwesome");
		actionSave.setGraphic(fontAwesome
				.create(FontAwesome.Glyph.FLOPPY_ALT)
				.size(18)
				.color(Color.web("#000")));
		actionSave.setNodeOrientation(NodeOrientation.LEFT_TO_RIGHT);
		
		actionSaveTable.setGraphic(fontAwesome
				.create(FontAwesome.Glyph.FLOPPY_ALT)
				.size(18)
				.color(Color.web("#000")));
		actionSaveTable.setNodeOrientation(NodeOrientation.LEFT_TO_RIGHT);
		
		setLocation();			
		
		if(getLocation() != null){
			
			inputNameLocation.setText(getLocation().getNameLocation());			
			inputDirection.setText(getLocation().getDirLocation());
			inputRazonSocial.setText(getLocation().getRazonSocial());
			inputRut.setText(getLocation().getRutLocation());
			inputGiro.setText(getLocation().getGiroLocation());
			inputCasaMatriz.setText(getLocation().getCasaMatriz());
			
		}
		
		setTableTree();
		
	}
	
	@FXML
	public void actionSave(ActionEvent event){	
		
		boolean checkContinue = true;
		
		if(inputNameLocation.getText().equals("")){
			checkContinue = false;
			inputNameLocation.getStyleClass().add("text-field-request");
		}else{
			inputNameLocation.getStyleClass().remove("text-field-request");
		}
		
		if(inputDirection.getText().equals("")){
			checkContinue = false;
			inputDirection.getStyleClass().add("text-field-request");
		}else{
			inputDirection.getStyleClass().remove("text-field-request");
		}
		
		if(inputRazonSocial.getText().equals("")){
			checkContinue = false;
			inputRazonSocial.getStyleClass().add("text-field-request");			
		}else{
			inputRazonSocial.getStyleClass().remove("text-field-request");
		}
		
		if(inputRut.getText().equals("")){
			checkContinue = false;
			inputRut.getStyleClass().add("text-field-request");
		}else{
			inputRut.getStyleClass().remove("text-field-request");
		}
		
		if(inputGiro.getText().equals("")){
			checkContinue = false;
			inputGiro.getStyleClass().add("text-field-request");
		}else{
			inputGiro.getStyleClass().remove("text-field-request");
		}
		
		if(inputCasaMatriz.getText().equals("")){
			checkContinue = false;
			inputCasaMatriz.getStyleClass().add("text-field-request");
		}else{
			inputCasaMatriz.getStyleClass().remove("text-field-request");
		}			
		
		if(checkContinue == true){
			getLocation().updateLocation(1, inputNameLocation.getText(), inputDirection.getText(), 
					inputRazonSocial.getText(), inputRut.getText(), inputGiro.getText(),inputCasaMatriz.getText());			
		}		
		
	}
	
	@FXML 
	public void saveTable(ActionEvent event){
		
	}
	
	public void setTableTree(){
		
		Table[] tables = getLocation().getTables();
		
		final TreeItem<String> root = new TreeItem<String>("Pisos y Mesas");
		root.setExpanded(true);
		
		int idFloor = 0;
		
		for (int i = 0; i < tables.length; i++) {
			
			if(tables[i].getIdFloor() != idFloor){
				idFloor = tables[i].getIdFloor();
				
				TreeItem<String> floor = new TreeItem<String>(tables[i].getNameFloor());
				
				
				for (int j = 0; j < tables.length; j++) {
					
					if(tables[i].getIdFloor() == tables[j].getIdFloor()){
						
						TreeItem<String> table = new TreeItem<String>(tables[j].getNameTable());
						floor.getChildren().add(table);
						
					}					
					
				}
				
				root.getChildren().add(floor);
				
			}
			
		}
		
		treeFloorsTables.setEditable(true);
		treeFloorsTables.setCellFactory(new Callback<TreeView<String>,TreeCell<String>>(){
            @Override
            public TreeCell<String> call(TreeView<String> p) {
            	return new TextFieldTreeCellImpl();
            }
        });
		
		treeFloorsTables.setRoot(root);
		
	}
	
	 private final class TextFieldTreeCellImpl extends TreeCell<String> {
		 
	        private TextField textField;
	        private ContextMenu addMenu = new ContextMenu();
	 
	        
			public TextFieldTreeCellImpl() {
	        	MenuItem addMenuItem = new MenuItem("Agregar...");
	        	MenuItem remMenuItem = new MenuItem("Eliminar...");
	            addMenu.getItems().addAll(addMenuItem,remMenuItem);
	            
	            addMenuItem.setOnAction(new EventHandler<ActionEvent> () {
	            	
	            	@Override
	                public void handle(ActionEvent event) {
	                    TreeItem<String> newReg = 
	                        new TreeItem<String>("Nuevo Registro");
	                            getTreeItem().getChildren().add(newReg);
	                }
	            });
	            
	            remMenuItem.setOnAction(new EventHandler<ActionEvent>() {

					@Override
					public void handle(ActionEvent event) {
						
						
					}
	            	
				});
	        }
	 
	        @Override
	        public void startEdit() {
	            super.startEdit();
	 
	            if (textField == null) {
	                createTextField();
	            }
	            setText(null);
	            setGraphic(textField);
	            textField.selectAll();
	        }
	 
	        @Override
	        public void cancelEdit() {
	            super.cancelEdit();
	            setText((String) getItem());
	            setGraphic(getTreeItem().getGraphic());
	        }
	 
	        @Override
	        public void updateItem(String item, boolean empty) {
	            super.updateItem(item, empty);
	 
	            if (empty) {
	                setText(null);
	                setGraphic(null);
	            } else {
	                if (isEditing()) {
	                    if (textField != null) {
	                        textField.setText(getString());
	                    }
	                    setText(null);
	                    setGraphic(textField);
	                } else {
	                    setText(getString());
	                    setGraphic(getTreeItem().getGraphic());
	                    
	                    if (
	                            !getTreeItem().isLeaf()&&getTreeItem().getParent()!= null
	                        ){
	                            setContextMenu(addMenu);
	                        }
	                    
	                }
	            }
	        }
	 
	        private void createTextField() {
	            textField = new TextField(getString());
	            textField.setOnKeyReleased(new EventHandler<KeyEvent>() {
	 
	                @Override
	                public void handle(KeyEvent t) {
	                    if (t.getCode() == KeyCode.ENTER) {
	                        commitEdit(textField.getText());
	                    } else if (t.getCode() == KeyCode.ESCAPE) {
	                        cancelEdit();
	                    }
	                }
	            });
	        }
	 
	        private String getString() {
	            return getItem() == null ? "" : getItem().toString();
	        }
	    }

	public Location getLocation() {
		return location;
	}

	public void setLocation() {
		Location location = new Location();
		this.location = location;
	}

}
