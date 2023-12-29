package com.project.cdao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.project.icls.Booking;

public class BookingDAO {
	public static Connection getCon() {
		String dbDriver = "com.mysql.cj.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost:3306/mesProject";
		String dbUsername = "root";
		String dbPassword = "3435";
		Connection con = null;
		try {
			
			Class.forName(dbDriver);
			con = DriverManager.getConnection(dbURL,dbUsername,dbPassword);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	public static ResultSet getBooked(String c_id) {
	
		ResultSet rs = null;
		
		try {
			Connection con = getCon();
			 
			PreparedStatement pst = con.prepareStatement("select * from booked where c_id=?");
			pst.setString(1, c_id);
			rs = pst.executeQuery();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	public static int deleteBTour(Booking b) {
		int a = 0;
		try {
			Connection con = getCon();
			PreparedStatement sql = con.prepareStatement("delete from booked where c_id = ? and tour_name = ?");
			sql.setString(1,b.getCustomerid());
			sql.setString(2, b.getTourid());
			sql.executeUpdate();
			a = 1;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e);
		}
		return a;
	}
}
