package culinet.app.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class ConnectionParameters {
	
	public static final String xmlFilePath = ConnectionParameters.class.getResource("ConnectionParameters.xml").getPath();
	
	private String database;
	private String username;
	private String password;
	private String server;
	private String port;

	private Connection conn = null;

	public ConnectionParameters() {

		getParamsFromFile();
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
	
	public void getParamsFromFile(){
		
		try{
			DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
			Document document = documentBuilder.parse(xmlFilePath);
			
			Node parameters = document.getElementsByTagName("parameters").item(0);
			
			NodeList nodes =parameters.getChildNodes();
			
			for (int i = 0; i < nodes.getLength(); i++) {
				
				Node element = nodes.item(i);
				
				switch(element.getNodeName()){
				
				case "server":
					setServer(element.getTextContent());
					break;
				
				case "port":
					setPort(element.getTextContent());
					break;
				
				case "database":
					setDatabase(element.getTextContent());
					break;
				
				case "username":
					setUsername(element.getTextContent());
					break;
				
				case "password":
					setPassword(element.getTextContent());
					break;			
				
				}
				
			}			
			
		}catch(Exception e){
			System.out.println("File: " + xmlFilePath);
			System.out.println(e.getClass().getName() + ": " + e.getMessage() );
			
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

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}
	
}
