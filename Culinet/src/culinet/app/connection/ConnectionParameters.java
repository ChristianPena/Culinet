package culinet.app.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionParameters {
	
	private String database;
	private String username;
	private String password;
	private String server;

	private Connection conn = null;

	public ConnectionParameters() {

		getConnectionData();
		setConnectionData(conn);

	}

	public void getConnectionData() {

		try {
			Class.forName("org.sqlite.JDBC");
			conn = DriverManager.getConnection("jdbc:sqlite:src/culinet/app/connection/ConnectionData.db");
			conn.setAutoCommit(false);		

		}catch(Exception e) {
			System.out.println(e.getClass().getName() + ": " + e.getMessage() );

		}

	}

	public void setConnectionData(Connection conn) {
		String sql;
	
		try {
	
			sql = "SELECT database, username, password, server "
					+ "FROM connection_params;";				
	
			Statement stmt = conn.createStatement();
			ResultSet rs   = stmt.executeQuery(sql);
	
			while(rs.next()) {
		
				database = rs.getString("database");
				username = rs.getString("username");
				password = rs.getString("password");
				server   = rs.getString("server");
		
			}			
	
			rs.close();
			stmt.close();
			conn.close();			
	
		}catch (SQLException e) {			
			System.out.println(e.getClass().getName() + ": " + e.getMessage() );
		}	
	
	}
	
	public boolean changeConnectionParams(String database, String user, String passwd, String server) {
	
		String sql;
	
		try {
	
			getConnectionData();
	
			sql = "DELETE FROM connection_params;";				
	
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);
				
			stmt.close();
	
			sql = "INSERT INTO connection_params (DATABASE, USERNAME, PASSWORD, SERVER) VALUES "
					+ "('" + database + "','" + user + "','" + passwd + "','" + server + "');";			
	
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);			
				
			stmt.close();
			conn.close();			
	
			return true;	
	
		}catch (SQLException e) {			
			System.out.println(e.getClass().getName() + ": " + e.getMessage() );
			return false;
		}			
	
	}
	
	public String getDatabase() {
		return database;
	}
	
	public void setDatabase(String database) {
		this.database = database;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getServer() {
		return server;
	}
	
	public void setServer(String server) {
		this.server = server;
	}
	
	public void createTable() {
	
	//	String sql = "CREATE TABLE CONNECTION_PARAMS(DATABASE TEXT, USERNAME TEXT, PASSWORD TEXT, SERVER TEXT);";
	
	}
	
}
