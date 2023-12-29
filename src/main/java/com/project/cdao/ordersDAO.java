package com.project.cdao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.project.icls.Orders;

public class ordersDAO {
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
	
	public static ResultSet getOrdersData(String c_id) {
		Connection con = getCon();
		ResultSet rs = null;
		try {
			PreparedStatement getT = con.prepareStatement("select * from bookedMerge where c_id = ?");
			getT.setString(1, c_id);
			rs = getT.executeQuery();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		return rs;
	}
	
	public static int deleteOrder(Orders o) throws SQLException {
		Connection con = getCon();
		int ans = 0;
		try {
			PreparedStatement del = con.prepareStatement("delete from bookedMerge where c_id = ? and m_name = ?");
			String c_id = String.valueOf(o.getC_id());
			del.setString(1,c_id);
			del.setString(2, o.getMerch());
			del.executeUpdate();
			ans = 1;
		}catch(Exception e) {
			System.out.print(e);
			ans = 0;
			
		}
		return ans;
	}
}
