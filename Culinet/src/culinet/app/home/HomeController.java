package culinet.app.home;

import java.net.URL;
import java.util.ResourceBundle;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.web.WebEngine;
import javafx.scene.web.WebView;

public class HomeController implements Initializable{
	
	@FXML WebView webView;

	@Override
	public void initialize(URL location, ResourceBundle resources) {		

		WebEngine webEngine =  webView.getEngine();
		webEngine.load("http://localhost/culinet/index.html");	
		
	}

}
