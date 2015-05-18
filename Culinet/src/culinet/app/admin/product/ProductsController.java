package culinet.app.admin.product;

import java.net.URL;
import java.util.ResourceBundle;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;

public class ProductsController implements Initializable{
	
	@FXML ImageView imgProducto;
	
	private Product producto;

	@Override
	public void initialize(URL location, ResourceBundle resources) {
		setImageProduct();
	}
	
	public void setImageProduct(){
		Image img = null;
		
		if(getProducto() == null){			
			img = new Image("/culinet/app/util/img/food.png");			
		}else{
			
		}
		
		imgProducto.setImage(img);
	}

	public Product getProducto() {
		return producto;
	}

	public void setProducto(Product producto) {
		this.producto = producto;
	}

}
