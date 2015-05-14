package culinet.app.application;

import java.sql.ResultSet;

import culinet.app.connection.Connection;

public class Application extends Connection{
	
	private int idApplication;
	private String appName;
	private String appTitle;
	private String appDesc;
	private String appSource;
	private String leftPane;
	private String rightPane;
	
	public Application(){
		
	}
	
	public Application[] getApplications(int idProfile){
		
		Application[] apps = null;
		ResultSet rs = null;
		int count = 0;
		
		
		try{
			
			super.openConnection();			
			String sql = "SELECT COUNT(*) " +
							"FROM APPLICATIONS INNER JOIN PROFILE_APPLICATION " +
							"WHERE APPLICATIONS.ID_APPLICATION = PROFILE_APPLICATION.APPLICATION " +
							  "AND PROFILE_APPLICATION.PROFILE = " + idProfile + " ;";	
			rs = super.executeSelect(sql);			
			while(rs.next()){
				count = rs.getInt(1);				
			}
			//rs.close();	
			
			apps = new Application[count];			
			rs = null;
			
			sql = "SELECT ID_APPLICATION, APPLICATION_NAME, TITLE, DESCRIPTION, SOURCE, LEFT_PANE, RIGHT_PANE " +
							"FROM APPLICATIONS INNER JOIN PROFILE_APPLICATION " +
			  				"WHERE APPLICATIONS.ID_APPLICATION  = PROFILE_APPLICATION.APPLICATION " +
			  				  "AND PROFILE_APPLICATION.PROFILE  = " + idProfile + "; ";
			
			rs = super.executeSelect(sql);		
			int i = 0;
			while(rs.next()){				
				
				apps[i] = new Application();				
				apps[i].setIdApplication(rs.getInt(1));
				apps[i].setAppName(rs.getString(2));
				apps[i].setAppTitle(rs.getString(3));
				apps[i].setAppDesc(rs.getString(4));
				apps[i].setAppSource(rs.getString(5));
				apps[i].setLeftPane(rs.getString(6));
				apps[i].setRightPane(rs.getString(7));
				i++;
				
			}
			rs.close();
			super.closeConnection();
			
		}catch(Exception e){
			System.out.println(e.getClass() + ": "+ e.getMessage());
			
		}	
		
		return apps;		
	}
	
	public void setApplication(int idApp){
		
		super.openConnection();
		ResultSet rs = null;
		
		try{
			String sql = "SELECT * FROM APPLICATIONS " +
			  			  "WHERE ID_APPLICATION = " + idApp + " ;";
			
			rs = super.executeSelect(sql);
	
			while(rs.next()){
				
				setIdApplication(rs.getInt(1));
				setAppName(rs.getString(2));
				setAppTitle(rs.getString(3));
				setAppDesc(rs.getString(4));
				setAppSource(rs.getString(5));
				setLeftPane(rs.getString(6));
				setRightPane(rs.getString(7));				
				
			}
			rs.close();
			super.closeConnection();
			
		}catch(Exception e){
			System.out.println(e.getClass() + ": "+ e.getMessage());
			
		}	
		
	}

	public int getIdApplication() {
		return idApplication;
	}

	public void setIdApplication(int idApplication) {
		this.idApplication = idApplication;
	}

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getAppTitle() {
		return appTitle;
	}

	public void setAppTitle(String appTitle) {
		this.appTitle = appTitle;
	}

	public String getAppDesc() {
		return appDesc;
	}

	public void setAppDesc(String appDesc) {
		this.appDesc = appDesc;
	}

	public String getAppSource() {
		return appSource;
	}

	public void setAppSource(String appSource) {
		this.appSource = appSource;
	}

	public String getLeftPane() {
		return leftPane;
	}

	public void setLeftPane(String leftPane) {
		this.leftPane = leftPane;
	}

	public String getRightPane() {
		return rightPane;
	}

	public void setRightPane(String rightPane) {
		this.rightPane = rightPane;
	}

}
