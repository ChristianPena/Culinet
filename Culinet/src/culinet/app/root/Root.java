package culinet.app.root;

import org.controlsfx.glyphfont.FontAwesome;
import org.controlsfx.glyphfont.GlyphFont;
import org.controlsfx.glyphfont.GlyphFontRegistry;

import culinet.app.application.Application;
import culinet.app.session.Session;
import culinet.app.user.User;
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
		final TreeView<String> leftPane = new TreeView<String>();

		TreeItem<String> rootItem = new TreeItem<String>("Aplicaciones");
		rootItem.setExpanded(true);

		for(int i = 0; i < getApps().length; i++){
            TreeItem<String> item = new TreeItem<String> (getApps()[i].getAppTitle());
            rootItem.getChildren().add(item);

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
		logoView.setFitHeight(85.0);
		logoView.setFitWidth(208.4);
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
		ToolBar bottomPane = new ToolBar();
		bottomPane.getStyleClass().add("statusbar");
		
		this.bottomPane = bottomPane;
	}

	public ToolBar getToolbar() {		
		return toolbar;
	}

	public void setToolbar() {
		ToolBar toolbar = new ToolBar();		
	    toolbar.getStyleClass().add("toolbar");
	    
	    GlyphFont fontAwesome = GlyphFontRegistry.font("FontAwesome");	 
	    
	    Node iconBack   = fontAwesome.create(FontAwesome.Glyph.CHEVRON_CIRCLE_LEFT).size(30);
	    Node iconExit   = fontAwesome.create(FontAwesome.Glyph.CHEVRON_CIRCLE_UP).size(30);
		Node iconCancel = fontAwesome.create(FontAwesome.Glyph.TIMES_CIRCLE).size(30);
		Node iconSave   = fontAwesome.create(FontAwesome.Glyph.FLOPPY_ALT).size(30);
		Node iconSearch = fontAwesome.create(FontAwesome.Glyph.SEARCH).size(30);
		Node iconPrint  = fontAwesome.create(FontAwesome.Glyph.PRINT).size(30);
		Node iconInfo   = fontAwesome.create(FontAwesome.Glyph.INFO_CIRCLE).size(30);
		Node iconLogout = fontAwesome.create(FontAwesome.Glyph.SIGN_OUT).size(30);
		
		iconBack.getStyleClass().addAll("toolbar-icon","toolbar-icon-back");
		iconExit.getStyleClass().addAll("toolbar-icon","toolbar-icon-exit");
		iconCancel.getStyleClass().addAll("toolbar-icon","toolbar-icon-cancel");
		iconSave.getStyleClass().addAll("toolbar-icon","toolbar-icon-save");
		iconSearch.getStyleClass().addAll("toolbar-icon","toolbar-icon-search");
		iconPrint.getStyleClass().addAll("toolbar-icon","toolbar-icon-print");
		iconInfo.getStyleClass().addAll("toolbar-icon","toolbar-icon-info");
		iconLogout.getStyleClass().addAll("toolbar-icon","toolbar-icon-logout");
	    
		Button btnBack   = new Button("Atrás",iconBack);		
		Button btnExit   = new Button("Finalizar",iconExit);
		Button btnCancel = new Button("Cancelar",iconCancel);
		Button btnSave   = new Button("Grabar",iconSave);
		Button btnSearch = new Button("Buscar",iconSearch);
		Button btnPrint  = new Button("Imprimir",iconPrint);
		Button btnInfo   = new Button("Información",iconInfo);
		Button btnLogout = new Button("Salir",iconLogout);		
		
		toolbar.getItems()
			.addAll(btnSave,new Separator(), btnBack,btnExit,btnCancel, new Separator(),
					btnSearch, btnPrint,btnInfo,new Separator(),btnLogout, new Separator());
		
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

}
