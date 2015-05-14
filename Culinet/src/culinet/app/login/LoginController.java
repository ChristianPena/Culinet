package culinet.app.login;

import java.awt.Dimension;
import java.awt.Toolkit;
import java.net.URL;
import java.util.ResourceBundle;

import org.controlsfx.control.textfield.CustomPasswordField;
import org.controlsfx.control.textfield.CustomTextField;
import org.controlsfx.glyphfont.FontAwesome;
import org.controlsfx.glyphfont.GlyphFont;
import org.controlsfx.glyphfont.GlyphFontRegistry;

import culinet.app.root.Root;
import culinet.app.session.Session;
import culinet.app.user.User;
import javafx.event.ActionEvent;
import javafx.event.Event;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.geometry.NodeOrientation;
import javafx.scene.Node;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.paint.Color;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class LoginController implements Initializable{
	
	@FXML ImageView logoView;
	@FXML CustomTextField inputName;
	@FXML CustomPasswordField inputPassword;
	@FXML Button actionAccess;
	@FXML Button actionCancel;
	@FXML Label message;
	
	private Event event;
	private String username; 
	private String password;
	

	@Override
	public void initialize(URL location, ResourceBundle resources) {		
		
		GlyphFont fontAwesome = GlyphFontRegistry.font("FontAwesome");	
		
		setLogo();
		
		Node iconUser = fontAwesome.create(FontAwesome.Glyph.USER);
		Node iconPass = fontAwesome.create(FontAwesome.Glyph.LOCK);
		
		iconUser.getStyleClass().add("login-icon-input");
		iconPass.getStyleClass().add("login-icon-input");
		
		inputName.setRight(iconUser);
		
		inputPassword.setRight(iconPass);
		
		actionAccess.setGraphic(fontAwesome
						.create(FontAwesome.Glyph.SIGN_IN)
						.size(18)
						.color(Color.web("#FFF")));
		actionAccess.setNodeOrientation(NodeOrientation.RIGHT_TO_LEFT);
		
		actionCancel.setGraphic(fontAwesome
						.create(FontAwesome.Glyph.TIMES)
						.size(18)
						.color(Color.web("#4E4E4E")));
		actionCancel.setNodeOrientation(NodeOrientation.RIGHT_TO_LEFT);
		
		
		inputName.setText("CH_PENA");
		inputPassword.setText("Inicio.01");
	}
	
	@FXML
	public void handleActionAccess(ActionEvent ev){
		setEvent(ev);
		validateLogin();		
	}
	
	@FXML
	public void handleActionCancel(){		
		System.exit(0);		
	}
	
	public void setLogo(){
		Image img = new Image("/culinet/app/util/logo/logo.png");
		logoView.setImage(img);
	}
	
	public void setMessage(String message){
		this.message.setText(message);
	}
	
	public void callHomeScreen(){
		
		Stage curStage = (Stage) ((Node) getEvent().getSource()).getScene().getWindow();		
				
		Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
		double width = screenSize.getWidth();
		double height = screenSize.getHeight();
		
		User user = new User(getUsername());
		
		Session session = new Session();
		session.setUsername(getUsername());
		session.createSession();
		
		Root root = new Root(session,user);
		root.setUser(user);
		
		Scene scene = new Scene(root);
		scene.getStylesheets()
				.add(this.getClass().getResource("/culinet/app/util/css/culinetStyle.css")
				.toExternalForm());
		
		Stage stage = new Stage();		
		stage.setTitle("CULINET: Pantalla Principal");
		stage.setMaximized(true);
		stage.setFullScreen(true);
		stage.setMinHeight(height-50);
		stage.setMinWidth(width);
		stage.setMaxHeight(Double.MAX_VALUE);
		stage.setMaxWidth(width);
		stage.setX(0);
		stage.setY(0);	
		stage.setResizable(false);		
		stage.initStyle(StageStyle.UNDECORATED);
		stage.setScene(scene);
		stage.show();		
		curStage.hide();
		
	}
	
	public void validateLogin(){	
		
		setUsername(inputName.getText());
		setPassword(inputPassword.getText());
		
		if((!getUsername().equals("")) && (!getPassword().equals(""))){
			this.message.getStyleClass().remove("login-message-error");
			User user = new User();
			int result = user.logIn(getUsername(), getPassword());
			switch(result){
			
			case 0: System.out.println("Access granted");
					callHomeScreen();
					break;
			
			case 1: System.out.println("User lock");
					this.message.getStyleClass().add("login-message-error");
					setMessage("User lock");
					break;
						
			case 2: System.out.println("Temp Password");
					setMessage("Temp Password");
					callHomeScreen();
					break;
					
			case 3: System.out.println("Password Expirated");
					this.message.getStyleClass().add("login-message-error");
					setMessage("Password Expirated");
					break;
						
			case 4: System.out.println("User not found");
					this.message.getStyleClass().add("login-message-error");
					setMessage("User not found");
					break;
				
			case 5: System.out.println("Password incorrect");
					this.message.getStyleClass().add("login-message-error");
					setMessage("Password incorrect");
					break;
			
		}
			
		}else{
			
			this.message.getStyleClass().add("login-message-error");
			
			if((getUsername().equals("")) && (getPassword().equals(""))){
				setMessage("Complete los campos obligatorios");
			}else{				
				if(getUsername().equals("")){
					setMessage("Nombre de usuario es obligatorio");
				}else if(getPassword().equals("")){
					setMessage("Clave de acceso es obligatoria");
				}
			}
		}
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}
	
	public String getUsername(){
		return username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	private String getPassword(){
		return password;
	}
	
	private void setPassword(String password){
		this.password = password;
	}

}
