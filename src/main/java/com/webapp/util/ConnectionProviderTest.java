package com.webapp.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ConnectionProviderTest {
	
	static Log log  = LogFactory.getLog(ConnectionProviderTest.class);
	
	public static void main(String[] args){
		// 1. JDBC driver Class Loading
		ConnectionProvider.classLoading();
		
		worldTest();
		employeeTest();
		
	}
	
	static void worldTest() {
		// 2. Connection 연결
		String url = "jdbc:apache:commons:dbcp:/dbcp/world";
		Connection con = null;
		try {
			con = DriverManager.getConnection(url);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select count(*) from city");
			rs.next();
			int count = rs.getInt(1);
			log.info("City count = " + count);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (con != null) con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	static void employeeTest() {
		// 2. Connection 연결 
				String url = "jdbc:apache:commons:dbcp:/dbcp/employee";
				Connection con = null;
				try {
					con = DriverManager.getConnection(url);
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery("select count(*) from emp");
					rs.next();
					int count = rs.getInt(1);
					log.info("Emp count = " + count);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					try {
						if (con != null) con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
	}

}
