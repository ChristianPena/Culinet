package culinet.app.main;

import java.io.IOException;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class Culinet extends Application{
	
	@Override
	public void start(Stage stage) throws IOException{
		
		Parent root = FXMLLoader.load(getClass().getResource("/culinet/app/login/Login.fxml"));
		
		Scene scene = new Scene(root);
		
		stage.setTitle("CULINET: Ingreso al sistema");
		scene.getStylesheets()
			 .add(this.getClass().getResource("/culinet/app/util/css/culinetStyle.css")
			 .toExternalForm());
		stage.setScene(scene);
		stage.initStyle(StageStyle.UNDECORATED);
		stage.setMinHeight(320);
		stage.setMinWidth(600);
		stage.setMaxHeight(320);
		stage.setMaxWidth(600);
		stage.setResizable(false);
		stage.show();
		
	}
	
	public static void main(String[]args){
		launch(args);
		
	}

}
