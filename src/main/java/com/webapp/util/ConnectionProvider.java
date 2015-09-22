package com.webapp.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ConnectionProvider {
	static String oracleClassName = "oracle.jdbc.OracleDriver";
	static String mysqlClassName = "com.mysql.jdbc.Driver"; 
	static String dbcpClassName = "org.apache.commons.dbcp.PoolingDriver";
	
	static Log log = LogFactory.getLog(ConnectionProvider.class);
	
	public static void classLoading() {
		
		try {
			Class.forName(oracleClassName);
			Class.forName(mysqlClassName);
			Class.forName(dbcpClassName);
		} catch (ClassNotFoundException e) {
			log.info("classLoading...", e);
		}
		
	}
	
	public static Connection getConnectionWorld() throws SQLException {
		String url = "jdbc:apache:commons:dbcp:/dbcp/world";
		return DriverManager.getConnection(url);
	}
	
	public static Connection getConnectionEmployee() throws SQLException {
		String url = "jdbc:apache:commons:dbcp:/dbcp/employee";
		return DriverManager.getConnection(url);
	}
}
