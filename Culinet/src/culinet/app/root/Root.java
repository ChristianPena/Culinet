package culinet.app.root;

import java.awt.Dimension;
import java.awt.Toolkit;

import org.controlsfx.glyphfont.FontAwesome;
import org.controlsfx.glyphfont.GlyphFont;
import org.controlsfx.glyphfont.GlyphFontRegistry;

import culinet.app.application.Application;
import culinet.app.session.Session;
import culinet.app.user.User;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.Separator;
import javafx.scene.control.ToolBar;
import javafx.scene.control.TreeItem;
import javafx.scene.control.TreeView;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Priority;
import javafx.scene.layout.VBox;

public class Root extends BorderPane{
	
	private Application app = null;
	private Application apps[] = null;
	
	private HBox topPane = null;
	private TreeView<String> leftPane = null;
	private Node centerPane = null;
	private ToolBar bottomPane = null;
	
	private ToolBar toolbar = null;
	private ToolBar titlebar = null;
	
	private Label titleText = null;
	
	private User user = null;
	private Session session = null;
	
	private Node nodeMessage = null; 
	
	private EventHandler<KeyEvent> keyEvents= null;
	
	public Root(Session session, User user){
		
		setSession(session);
		setUser(user);
		
		setApp(1);
		setApps();
		
		setTopPane();
		setLeftPane();
		setCenterPane(getApp());
		setBottomPane();
		
		setTop(getTopPane());
		setLeft(getLeftPane());
		setCenter(getCenterPane());
		setBottom(getBottomPane());
		
		setKeyEvents();		
		setEventHandler(KeyEvent.ANY, getKeyEvents());
		
	}

	public void setSession(Session session) {
		this.session = session;	
	}

	public Application getApp() {
		return app;
	}
	
	public void setApp(Application app){
		this.app = app;
	}

	public void setApp(int idApp) {		
		Application app = new Application();
		app.setApplication(idApp);				
		this.app = app;
	}

	public TreeView<String> getLeftPane() {
		return leftPane;
	}

	public void setLeftPane() {
		GlyphFont fontAwesome = GlyphFontRegistry.font("FontAwesome");
		
		final TreeView<String> leftPane = new TreeView<String>();

		TreeItem<String> rootItem = new TreeItem<String>("Aplicaciones");
		rootItem.setExpanded(true);
		
		int cat = 0;

		for(int i = 0; i < getApps().length; i++){
			
			if(getApps()[i].getIdCategory() != cat){
				
				cat = getApps()[i].getIdCategory();
				
				TreeItem<String> category = new TreeItem<String>(
						getApps()[i].getCatDescription(),
						fontAwesome.create(getApps()[i].getCatIcon()));
				category.setExpanded(true);
				
				for(int j = 0; j < getApps().length; j++){
					
					if(getApps()[i].getIdCategory() == getApps()[j].getIdCategory()){
						
						TreeItem<String> item = new TreeItem<String> (getApps()[j].getAppTitle());
			            category.getChildren().add(item);
						
					}					
				}				
	            rootItem.getChildren().add(category);							
			}            

        }        

		leftPane.setRoot(rootItem);

		leftPane.setOnMouseClicked(new EventHandler<MouseEvent>() {
			@Override
			public void handle(MouseEvent mouseEvent){
				if(mouseEvent.getClickCount() == 2){
					TreeItem<String> item = leftPane.getSelectionModel().getSelectedItem();
					for(int i = 0; i < getApps().length; i++){
						if(item.getValue().equals(getApps()[i].getAppTitle())){
							setApp(getApps()[i]);														
						}
					}
					setCenterPane(app);
				}				
			}
		});
		
		this.leftPane = leftPane;
	}

	public HBox getTopPane() {
		return topPane;
	}

	public void setTopPane() {
		
		HBox topPane = new HBox();
		topPane.getStyleClass().add("top-pane");
		
		VBox topRight = new VBox();		
		Image logo = new Image("/culinet/app/util/logo/logo.png");		
		ImageView logoView = new ImageView(logo);
		logoView.setFitHeight(95.0);
		logoView.setFitWidth(232.9);
		logoView.getStyleClass().add("logo-mainscreen");
		
		setToolbar();
		setTitlebar(getApp().getAppTitle());
		
		topRight.getChildren().addAll(getToolbar(),getTitlebar());		
		
		HBox.setHgrow(topRight, Priority.ALWAYS);
		topPane.getChildren().addAll(topRight,logoView);
		
		this.topPane = topPane;
	}

	public Node getCenterPane() {
		return centerPane;
	}
	
	public void setCenterPane(Application app) {		
				
		Node centerPane = null;				
				
		try{
			this.setCenter(null);
            if(app.getLeftPane() == null){
            	this.setLeft(null);
            }else{
            	this.setLeft(getLeftPane());
            }
			
			FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource(app.getAppSource()));				
            centerPane = (Node) fxmlLoader.load();
            setTitleText(app.getAppTitle());            
            this.setCenter(centerPane);            
			
		}catch(Exception e){
			System.out.println(e.getClass() + ": " + e.getMessage());
			
		}		
		
		this.centerPane = centerPane;
	}

	public ToolBar getBottomPane() {
		return bottomPane;
	}

	public void setBottomPane() {
		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		double width = screenSize.getWidth();
		
		ToolBar bottomPane = new ToolBar();
		bottomPane.getStyleClass().add("statusbar");
		
		Label labelMessage  = new Label("");
		Label labelUsername = new Label(getUser().getUserName());
		Label labelServer   = new Label("Server " + getSession().getServername());
		Label labelHostName = new Label("Host "   + getSession().getHostname());
		
		bottomPane.getItems()
					.addAll(labelMessage, new Separator(), labelUsername, new Separator(), 
							labelServer, new Separator(), labelHostName);
		
		labelUsername.setMinWidth(100);
		labelServer.setMinWidth(100);
		labelHostName.setMinWidth(100);
		labelUsername.setMaxWidth(100);
		labelServer.setMaxWidth(100);
		labelHostName.setMaxWidth(100);
		
		labelMessage.setMinWidth(width - 350);
		labelMessage.setMaxWidth(width - 350);
		
		
		this.bottomPane = bottomPane;
	}

	public ToolBar getToolbar() {		
		return toolbar;
	}

	public void setToolbar() {
		ToolBar toolbar = new ToolBar();		
	    toolbar.getStyleClass().add("toolbar");
	    
	    GlyphFont fontAwesome = GlyphFontRegistry.font("FontAwesome");
	    Double size = 26.0;
	    
	    Node iconBack   = fontAwesome.create(FontAwesome.Glyph.ARROW_LEFT).size(size);
	    Node iconExit   = fontAwesome.create(FontAwesome.Glyph.LEVEL_UP).size(size);
		Node iconCancel = fontAwesome.create(FontAwesome.Glyph.TIMES).size(size);
		Node iconSave   = fontAwesome.create(FontAwesome.Glyph.FLOPPY_ALT).size(size);
		Node iconSearch = fontAwesome.create(FontAwesome.Glyph.SEARCH).size(size);
		Node iconPrint  = fontAwesome.create(FontAwesome.Glyph.PRINT).size(size);
		Node iconInfo   = fontAwesome.create(FontAwesome.Glyph.INFO).size(size);
		Node iconLogout = fontAwesome.create(FontAwesome.Glyph.SIGN_OUT).size(size);
		
		iconBack.getStyleClass().addAll("toolbar-icon");
		iconExit.getStyleClass().addAll("toolbar-icon");
		iconCancel.getStyleClass().addAll("toolbar-icon");
		iconSave.getStyleClass().addAll("toolbar-icon");
		iconSearch.getStyleClass().addAll("toolbar-icon");
		iconPrint.getStyleClass().addAll("toolbar-icon");
		iconInfo.getStyleClass().addAll("toolbar-icon");
		iconLogout.getStyleClass().addAll("toolbar-icon");
	    
		Button btnBack   = new Button("",iconBack);		
		Button btnExit   = new Button("",iconExit);
		Button btnCancel = new Button("",iconCancel);
		Button btnSave   = new Button("",iconSave);
		Button btnSearch = new Button("",iconSearch);
		Button btnPrint  = new Button("",iconPrint);
		Button btnInfo   = new Button("",iconInfo);
		Button btnLogout = new Button("",iconLogout);

		btnBack.getStyleClass().addAll("toolbar-btn-back");
		btnExit.getStyleClass().addAll("toolbar-btn-exit");
		btnCancel.getStyleClass().addAll("toolbar-btn-cancel");
		btnSave.getStyleClass().addAll("toolbar-btn-save");
		btnSearch.getStyleClass().addAll("toolbar-btn-search");
		btnPrint.getStyleClass().addAll("toolbar-btn-print");
		btnInfo.getStyleClass().addAll("toolbar-btn-info");
		btnLogout.getStyleClass().addAll("toolbar-btn-logout");
		
		toolbar.getItems().addAll(
							btnSave,
							new Separator(), 
							btnBack,
							btnExit,
							btnCancel, 
							new Separator(),
							btnSearch,
							btnPrint,
							btnInfo,
							new Separator(),
							btnLogout,
							new Separator());
		
		btnLogout.setOnAction(new EventHandler<ActionEvent>() {
			@Override
			public void handle(ActionEvent ev){
				getSession().closeSession();
				System.out.println("Session closed!");
				System.exit(0);
			}
		});
		
		btnExit.setOnAction(new EventHandler<ActionEvent>() {
			
			@Override
			public void handle(ActionEvent event) {
				setApp(1);
				setCenterPane(getApp());
				
			}
		});
		
		this.toolbar = toolbar;
	}

	public ToolBar getTitlebar() {
		return titlebar;
	}

	public void setTitlebar(String title) {
		ToolBar titlebar = new ToolBar();
		titlebar.getStyleClass().add("top-titlebar");
		
		titleText = new Label(title);
		setTitleText(title);
		
		titleText.getStyleClass().add("titleText");
		titlebar.getItems().add(titleText);
		
		this.titlebar = titlebar;
	}
	
	public Label getTitleText(){
		return titleText;
	}
	
	public void setTitleText(String titleText){
		this.titleText.setText(titleText);;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Session getSession() {
		return session;
	}

	public void setSession() {
		Session session = new Session();
		this.session = session;
	}

	public Application[] getApps() {
		return apps;
	}

	public void setApps() {
		Application apps[] = app.getApplications(user.getIdProfile()); 
		this.apps = apps;
	}

	public EventHandler<KeyEvent> getKeyEvents() {
		return keyEvents;
	}

	public void setKeyEvents() {
		EventHandler<KeyEvent> keyEvents = new EventHandler<KeyEvent>() {
			
			@Override
			public void handle(KeyEvent event) {
				
								
				
			}
		};
		
		this.keyEvents = keyEvents;
	}

	public Node getNodeMessage() {
		return nodeMessage;
	}

	public void setNodeMessage(Node nodeMessage) {
		this.nodeMessage = nodeMessage;
	}

}
