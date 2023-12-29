package com.project.cdao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TourDAO {
	public static Connection getCon() {
	String dbDriver = "com.mysql.cj.jdbc.Driver";
	String dbURL = "jdbc:mysql://localhost:3306/mesProject";
	String dbUsername = "root";
	String dbPassword = "3435";
	Connection con = null;
	
	try {
		Class.forName(dbDriver);
		con = DriverManager.getConnection(dbURL, dbUsername, dbPassword);	
		} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		return con;
	}
	
	public static ResultSet getTourdata() {
		Connection con = getCon();
		ResultSet rs = null;
		try {
			PreparedStatement getT = con.prepareStatement("select * from tours");
			rs = getT.executeQuery();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
}
