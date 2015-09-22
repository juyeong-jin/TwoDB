package com.webapp.calc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class OracleJDBCTest {

	static Log log = LogFactory.getLog(OracleJDBCTest.class);
	public static void main(String[] args) {
		
		String className = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "scott";
		String password = "tiger";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			// 1. Class Loading
			Class.forName(className);
			// 2. Connection 연결
			con = DriverManager.getConnection(url, user, password);
			// 3. Statement 생성(2가지 방법이 있다)
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from dept");
			// 4. Result를 읽는다
			rs.next();
			int deptno = rs.getInt("deptno");
			String dname = rs.getString("dname");
			String loc = rs.getString("loc");
			log.info(deptno + "" + dname + "" + loc);
			
			} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
				log.error("ErrorCode = " + e.getErrorCode());
				log.error("Message = " + e.getMessage());
				log.error("SQLState = " + e.getSQLState());
				e.printStackTrace();
			}finally{
				try {
					// 5. 자원을 정상적으로 회수한다.
					if(rs!=null) rs.close();
					if(stmt!=null) stmt.close();
					if(con!= null) con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

	}

}
