package models;
import java.sql.ResultSet;

import controllers.DAO;

//import controllers.DAO;
public class BeanUser implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private String user = "";
	private String mail = "";
	private String name = "";
	private String middleName = "";
	private String lastName = "";
	private String password = "";
	private String confirmationPassword = "";
	private String birthdate = "";
	private String profilePicture = "";

	
	public String getProfilePicture() {
		return profilePicture;
	}

	public void setProfilePicture(String profilePicture) {
		this.profilePicture = profilePicture;
	}

	/*  Control which parameters have been correctly filled */
	private int[] error = {0,0}; 
	
	/* Getters */
	public String getUser(){
		return user;
	}
	
	public String getMail() {
		return mail;
	}
	
	public String getName() {
		return name;
	}

	public String getMiddleName() {
		return middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getPassword() {
		return password;
	}

	public String getConfirmationPassword() {
		return confirmationPassword;
	}
	
	public String getBirthdate() {
		return birthdate;
	}
	
	public int[] getError() {
		return error;
	}
	
	/*Setters*/
	public void setUser(String user){
		try {
			DAO dao = new DAO();
			ResultSet f = dao.executeSQL("SELECT COUNT(*) FROM users WHERE user='" + user + "';");
			f.next(); int i = Integer.parseInt(f.getString(1));
			if(i!=0)setError(0,1);
			
			else {
				this.user = user;
			}
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void setMail(String mail){
		try {
			DAO dao = new DAO();
			ResultSet f = dao.executeSQL("SELECT COUNT(*) FROM users WHERE mail='" + mail + "';");
			f.next(); int i = Integer.parseInt(f.getString(1));
			if(i!=0)setError(1,1); 
			else {
				this.mail = mail;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setConfirmationPassword(String confirmationPassword) {
		this.confirmationPassword = confirmationPassword;
	}
	
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}	

	public void setError(int pos, int error) {
		//En la primera posicin va el error del user, 
		// en la segunda el error del mail
		this.error[pos] = error;
	}
	
	/* Logic Functions */
	public boolean isComplete() {
	    return(hasValue(getUser()) &&
	           hasValue(getMail()) &&
	           hasValue(getName()) &&
	           hasValue(getLastName()) &&
	           hasValue(getPassword()) &&
	           hasValue(getBirthdate())
	           );
	}
	
	private boolean hasValue(String val) {
		return((val != null) && (!val.equals("")));
	}
}
