package culinet.app.admin.product;

import java.sql.ResultSet;

import culinet.app.connection.Connection;

public class Product extends Connection{
	
	private int idProduct;
	private String nameProduct;
	private int typeProduct;
	private int idCategory;
	
	public Product(){
		
	}
	
	public void getProduct(int idProduct){
		
		super.openConnection();
		ResultSet rs = null;
		String sql = "SELECT * FROM PRODUCTS WHERE ID_PRODUCT = "+ idProduct + " ;" ;
		try{
			rs = executeSelect(sql);
			while(rs.next()){
				setIdProduct(rs.getInt(1));
				setNameProduct(rs.getString(2));
				setTypeProduct(rs.getInt(3));
				setIdCategory(rs.getInt(4));
			}
			rs.close();
			super.closeConnection();
			
		}catch(Exception e){
			System.out.println(e.getClass() + ": " + e.getMessage());
			
		}		
	}
	
	public void addProduct(String nameProduct, int typeProduct, int idCategory){
		
		super.openConnection();
		String sql = "INSERT INTO PRODUCTS (NAME_PRODUCT, PRODUCT_TYPE, ID_CATEGORY) "+
						"VALUES ('" + nameProduct + "', " + typeProduct +"," + idCategory + ");";
		try{			
			if(executeQuery(sql) == true){
				System.out.println("Table PRODUCTS updated successfully!");
			}else{
				System.out.println("An error ocurred! =(");
			}
			
		}catch(Exception e){
			System.out.println(e.getClass() + ": " + e.getMessage());
			
		}
		
	}

	public int getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(int idProduct) {
		this.idProduct = idProduct;
	}

	public String getNameProduct() {
		return nameProduct;
	}

	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}

	public int getTypeProduct() {
		return typeProduct;
	}

	public void setTypeProduct(int typeProduct) {
		this.typeProduct = typeProduct;
	}

	public int getIdCategory() {
		return idCategory;
	}

	public void setIdCategory(int idCategory) {
		this.idCategory = idCategory;
	}

}
