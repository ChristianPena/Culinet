package culinet.app.admin.location;

public class Table {
	
	private int idFloor;
	private String nameFloor;
	private int idTable;
	private String nameTable;	
	
	public Table(){
		
	}
	
	public Table(String nameFloor){
		this.nameFloor = nameFloor;		
	}

	public int getIdFloor() {
		return idFloor;
	}

	public void setIdFloor(int idFloor) {
		this.idFloor = idFloor;
	}

	public String getNameFloor() {
		return nameFloor;
	}

	public void setNameFloor(String nameFloor) {
		this.nameFloor = nameFloor;
	}

	public int getIdTable() {
		return idTable;
	}

	public void setIdTable(int idTable) {
		this.idTable = idTable;
	}

	public String getNameTable() {
		return nameTable;
	}

	public void setNameTable(String nameTable) {
		this.nameTable = nameTable;
	}

}
