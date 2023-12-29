package com.project.icls;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.http.HttpSession;

public class Booking {

		private String customerid;
		private String tourid;
		private String nvisitors;
		private String vdate;
		private String toalprice;
		
		public String getCustomerid() {
			return customerid;
		}
		public void setCustomerid(String customerid) {
			this.customerid = customerid;
		}
		public String getTourid() {
			return tourid;
		}
		public void setTourid(String tourid) {
			this.tourid = tourid;
		}
		public String getNvisitors() {
			return nvisitors;
		}
		public void setNvisitors(String nvisitors) {
			this.nvisitors = nvisitors;
		}
		public String getVdate() {
			return vdate;
		}
		public void setVdate(String vdate) {
			this.vdate = vdate;
		}
		public String getToalprice() {
			return toalprice;
		}
		public void setToalprice(String toalprice) {
			this.toalprice = toalprice;
		}
		
		
}	


