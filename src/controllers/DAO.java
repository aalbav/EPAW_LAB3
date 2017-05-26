package controllers;

import java.sql.*;


public class DAO {
	private Connection connection;
	private Statement statement;

	public DAO() throws Exception {
	String user = "mysql";
	String password="prac";
	
Class.forName("com.mysql.jdbc.Driver").newInstance();

	
	connection=DriverManager.getConnection("jdbc:mysql://localhost/ts1?user="+user+"&password="+password);

	statement=connection.createStatement();
	String sqlCreate = "CREATE DATABASE IF NOT EXISTS practica2";
	statement = connection.createStatement();
	statement.execute(sqlCreate);

	sqlCreate = "USE practica2";
	statement = connection.createStatement();
	statement.execute(sqlCreate);
	
	sqlCreate = "CREATE TABLE IF NOT EXISTS users"
            + "  (user CHAR(24) PRIMARY KEY,"
            + "   name CHAR(50),"
            + "   middleName CHAR(50),"
            + "   lastName CHAR(50),"
            + "   mail CHAR(50) NOT NULL,"
            + "   password CHAR(50),"
            + "   birthdate CHAR(50),"
            + "   profilePicture CHAR(200))";

	
	statement = connection.createStatement();
	statement.execute(sqlCreate);

	connection = DriverManager.getConnection("jdbc:mysql://localhost/practica2?user=" + user + "&password=" + password);

	

	
	}
	//execute queries
	public ResultSet executeSQL(String query) throws SQLException{
		return statement.executeQuery(query);
	}
	public int executeInsert(String query) throws SQLException {
		return statement.executeUpdate(query);
	}

	//TODO: code for updates for Assignments 2, 3 and 4.
	public void disconnectBD() throws SQLException{
		statement.close();
		connection.close();
	}
}