package culinet.app.user;



import java.sql.CallableStatement;
import java.sql.ResultSet;

import culinet.app.connection.Connection;

public class User extends Connection{
	
	private String userName;
	private int idEmployee;
	private String name;
	private String name2;
	private String lastName;
	private String lastName2;
	private String shortName;
	private int enable;
	private String DtLastConnection;
	private String TmLastConnection;
	private int idProfile;
	
	public User(){
		
	}
	
	public User(String username){
		
		super.openConnection();
		ResultSet rs = null;
		try{
			String sql = "SELECT * FROM USERS WHERE USERNAME = '" + username + "';";
			rs = super.executeSelect(sql);
			while(rs.next()){
				setUserName(rs.getString(1));
				setIdEmployee(rs.getInt(2));
				setName(rs.getString(3));
				setName2(rs.getString(4));
				setLastName(rs.getString(5));
				setLastName2(rs.getString(6));
				setShortName(rs.getString(7));
				setEnable(rs.getInt(8));
				setDtLastConnection(rs.getString(9));
				setTmLastConnection(rs.getString(10));
				setIdProfile(rs.getInt(11));
			}
			rs.close();
			super.closeConnection();
			
		}catch(Exception e){
			System.out.println(e.getClass() + ": "+ e.getMessage());
			
		}
		
	}
	
	public int logIn(String user, String password){
		
		String sql = "{CALL VALIDATE_LOGIN(?,?,?)}";
		int result = 0;
		
		try{
			
			super.openConnection();
			CallableStatement cStmt = super.conn.prepareCall(sql);
			cStmt.setString(1, user);
			cStmt.setString(2, password);
			cStmt.execute();
			result = cStmt.getInt(3);
			cStmt.close();
			super.closeConnection();		
			return result;
				
			
		}catch(Exception e){
			
			System.out.println(e.getClass() + ": " + e.getMessage());			
			return 6;			
		}	
		
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getIdEmployee() {
		return idEmployee;
	}

	public void setIdEmployee(int idEmployee) {
		this.idEmployee = idEmployee;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName2() {
		return name2;
	}

	public void setName2(String name2) {
		this.name2 = name2;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getLastName2() {
		return lastName2;
	}

	public void setLastName2(String lastName2) {
		this.lastName2 = lastName2;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}

	public String getDtLastConnection() {
		return DtLastConnection;
	}

	public void setDtLastConnection(String dtLastConnection) {
		DtLastConnection = dtLastConnection;
	}

	public String getTmLastConnection() {
		return TmLastConnection;
	}

	public void setTmLastConnection(String tmLastConnection) {
		TmLastConnection = tmLastConnection;
	}

	public int getIdProfile() {
		return idProfile;
	}
	
	public int getIdProfile(String username) {
		
		int idProfile = 0;
		
		super.openConnection();
		ResultSet rs = null;
		try{
			String sql = "SELECT ID_PROFILE FROM USERS WHERE USERNAME = '" + username + "';";
			rs = super.executeSelect(sql);
			while(rs.next()){
				idProfile = rs.getInt(1);
				
			}
			rs.close();
			super.closeConnection();
			
		}catch(Exception e){
			System.out.println(e.getClass() + ": "+ e.getMessage());
			
		}
		
		return idProfile;
	}

	public void setIdProfile(int idProfile) {
		this.idProfile = idProfile;
	}

}
