package culinet.app.sales.pos;

import java.net.URL;
import java.util.ResourceBundle;

import culinet.app.admin.location.Location;
import culinet.app.admin.location.Table;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Tab;
import javafx.scene.control.TabPane;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

public class POSController implements Initializable{
	
	private Location location;
	
	@FXML TabPane tabPaneFloors;
	

	@Override
	public void initialize(URL url, ResourceBundle resources) {
		location = new Location();
		initTabFloors();
		
	}
	
	@SuppressWarnings("unchecked")
	public void initTabFloors(){
		
		Table[] tables = getLocation().getTables();
		
		int idFloor = 0;
		
		for (int i = 0; i < tables.length; i++) {
			
			if(tables[i].getIdFloor() != idFloor){
				idFloor = tables[i].getIdFloor();
				
				Tab tab = new Tab();
				tab.setText(tables[i].getNameFloor());
				
				ObservableList<Table> obsTables = FXCollections.observableArrayList();
				
				for (int j = 0; j < tables.length; j++) {
					
					if(tables[i].getIdFloor() == tables[j].getIdFloor()){
						
						obsTables.add(tables[j]);
						
					}
					
				}
				
				TableView<Table> viewTables = new TableView<Table>();
				
				TableColumn<Table, String> table   = new TableColumn<Table, String>("Mesa");
				table.setCellValueFactory(
					new PropertyValueFactory<Table,String>("nameTable"));
				
				
				TableColumn<Table, String> preview = new TableColumn<Table, String>("Consumo");
				TableColumn<Table, String> pedido  = new TableColumn<Table, String>("Pedido");
				TableColumn<Table, String> status  = new TableColumn<Table, String>("Estado");
				
				viewTables.setItems(obsTables);
				
				viewTables.getColumns().addAll(table,preview,pedido,status);
				
				tab.setContent(viewTables);
				
				tabPaneFloors.getTabs().add(tab);
				
			}
			
		}
		
		
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

}
