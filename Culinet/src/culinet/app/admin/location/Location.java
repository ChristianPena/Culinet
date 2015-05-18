package culinet.app.admin.location;

import java.sql.ResultSet;

import culinet.app.connection.Connection;

public class Location extends Connection{
	
	private int idLocation;
	private String nameLocation;
	private String dirLocation;
	private String razonSocial;
	private String rutLocation;
	private String giroLocation;
	private String casaMatriz;
	
	public Location(){
		super.openConnection();
		ResultSet rs = null;
		try{
			String sql = "SELECT * FROM LOCATIONS;";
			rs = executeSelect(sql);
			while(rs.next()){
				setIdLocation(rs.getInt(1));
				setNameLocation(rs.getString(2));
				setDirLocation(rs.getString(3));
				setRazonSocial(rs.getString(4));
				setRutLocation(rs.getString(5));
				setGiroLocation(rs.getString(6));
				setCasaMatriz(rs.getString(7));
			}
			rs.close();
			super.closeConnection();
			
		}catch(Exception e){
			System.out.println(e.getClass() + ": " + e.getMessage());
		}
	}
	
	public void updateLocation(int idLocation, String nameLocation, String dirLocation, 
			String razonSocial, String rutLocation, String giroLocation, String casaMatriz){
		
		super.openConnection();
		boolean result = false;
		try{
			String sql = "UPDATE LOCATIONS " + 
							"SET LOCATION_NAME = '" + nameLocation + "', " +
								"LOCATION_DIR  = '" + dirLocation  + "', " +
								"RAZON_SOCIAL  = '" + razonSocial  + "', " +
								"RUT           = '" + rutLocation  + "', " +
								"GIRO		   = '" + giroLocation + "', " +
								"CASA_MATRIZ   = '" + casaMatriz   + "' "  +
							"WHERE ID_LOCATION = "  + idLocation   + ";";
			result = executeQuery(sql);
			if(result == true){
				System.out.println("Table LOCATIONS updated successfully!");
			}else{
				System.out.println("Table LOCATIONS not update! :(");
			}
			
		}catch(Exception e){
			System.out.println(e.getClass() + ": " + e.getMessage());
		}
		
	}
	
	public Table[] getTables(){
		
		Table[] tables = null;
		
		super.openConnection();
		ResultSet rs = null;
		
		try{
			String sql = "SELECT A.ID_FLOOR, A.NAME_FLOOR, B.ID_TABLE, B.NAME_TABLE " +
				       	   "FROM FLOORS AS A, TABLES AS B "    +
				           "WHERE A.ID_FLOOR    = B.ID_FLOOR " +
				             "AND A.ID_LOCATION = " + getIdLocation() + "; ";
			
			rs = executeSelect(sql);
			
			int cant = 0;
			
			if(rs.last()){
				cant = rs.getRow();
				rs.beforeFirst();
			}
			
			tables = new Table[cant];
			int i = 0;
			
			while(rs.next()){
				
				tables[i] = new Table();
				tables[i].setIdFloor(rs.getInt(1));
				tables[i].setNameFloor(rs.getString(2));
				tables[i].setIdTable(rs.getInt(3));
				tables[i].setNameTable(rs.getString(4));
				i++;
				
			}
			
		}catch(Exception e){
			System.out.println(e.getClass() + ": " + e.getMessage());
			
		}		
		
		return tables;
	}

	public int getIdLocation() {
		return idLocation;
	}

	public void setIdLocation(int idLocation) {
		this.idLocation = idLocation;
	}

	public String getNameLocation() {
		return nameLocation;
	}

	public void setNameLocation(String nameLocation) {
		this.nameLocation = nameLocation;
	}

	public String getDirLocation() {
		return dirLocation;
	}

	public void setDirLocation(String dirLocation) {
		this.dirLocation = dirLocation;
	}

	public String getRazonSocial() {
		return razonSocial;
	}

	public void setRazonSocial(String razonSocial) {
		this.razonSocial = razonSocial;
	}

	public String getRutLocation() {
		return rutLocation;
	}

	public void setRutLocation(String rutLocation) {
		this.rutLocation = rutLocation;
	}

	public String getGiroLocation() {
		return giroLocation;
	}

	public void setGiroLocation(String giroLocation) {
		this.giroLocation = giroLocation;
	}

	public String getCasaMatriz() {
		return casaMatriz;
	}

	public void setCasaMatriz(String casaMatriz) {
		this.casaMatriz = casaMatriz;
	}

}
