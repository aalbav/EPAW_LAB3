package models;

import java.sql.ResultSet;

import controllers.DAO;

public class BeanLogin {

	private String user = "";
	private String password = "";
	private int[] error = {0};
	
	public String getUser(){
		return user;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setUser(String user){
		this.user = user;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public int[] getError() {
		return error;
	}
	
	public boolean isComplete() {
	    return(hasValue(getUser()));
	}	
	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}
	
	public boolean checkUser(String user, String password) {
		DAO dao;
		try {
			dao = new DAO();
			ResultSet f = dao.executeSQL("SELECT * FROM users WHERE user='" + user + "';");
			f.next(); int i = Integer.parseInt(f.getString(1));
			if(i!=0)return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	
}