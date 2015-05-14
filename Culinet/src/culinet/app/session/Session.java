package culinet.app.session;

import java.net.InetAddress;
import java.sql.CallableStatement;

import culinet.app.connection.Connection;

public class Session extends Connection{
	
	private String idSession;
	private String username;
	private String hostname;
	private String servername;
	private String dateConnection;
	private String timeConnection;
	private String dateEndConnection;
	private String timeEndConnection;
	
	public Session(){
		getHostname();
	}
	
	public boolean createSession()	{
		try{
			String sql = "{CALL CREATE_SESSION(?,?,?,?,?,?)}";
			
			super.openConnection();				
			CallableStatement cStmt = super.conn.prepareCall(sql); 
			cStmt.setString(1, username);
			cStmt.setString(2, hostname);
			cStmt.execute();
			dateConnection = cStmt.getString(3);
			timeConnection = cStmt.getString(4);
			idSession      = cStmt.getString(5);
			servername     = cStmt.getString(6);
			cStmt.close();
			super.closeConnection();	
			
			return true;
			
		}catch(Exception e){
			
			System.out.println(e.getClass() + ": " + e.getMessage());
			return false;
			
		}
		
	}
	
	public boolean closeSession(){
		try{
			boolean valReturn = false;
			String sql = "{CALL CLOSE_SESSION(?,?)}";
			
			super.openConnection();				
			CallableStatement cStmt = super.conn.prepareCall(sql); 
			cStmt.setString(1, idSession);
			cStmt.execute();
			valReturn = cStmt.getBoolean(2);
			cStmt.close();
			super.closeConnection();			
			
			if(valReturn == true){
				
				return true;
				
			} else{
				
				return false;
				
			}
			
		}catch(Exception e){
			
			System.out.println(e.getClass() + ": " + e.getMessage());
			return false;
			
		}
	}
	
	public String getDateConnection(){		
		return dateConnection;		
	}
	
	public String getTimeConnection(){		
		return timeConnection;		
	}
	
	public String getDateEndConnection(){		
		return dateEndConnection;		
	}
	
	public String getTimeEndConnection(){		
		return timeEndConnection;		
	}
	
	public String getSession(){
		return idSession;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public String getUsername(){
		return username;
	}
	
	public String getHostname(){
		
		try{
			hostname = InetAddress.getLocalHost().getHostName().toString();			
		}catch(Exception e){
			System.out.println(e.getClass() + ": " + e.getMessage());
			hostname = "Undefinied";
		}	
		return hostname;
	}
	
	public String getServername(){
		return servername;
	}

}
