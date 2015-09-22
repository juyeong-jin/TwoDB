package com.webapp.employee;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;

public class insertEmpTest {

	static String className="oracle.jdbc.OracleDriver";
	static String url="jdbc:oracle:thin:@localhost:1521:xe";
	static String user="scott";
	static String password="tiger";
	
	static String sql = 
						"	insert into emp   " +
						"	(				  "	+
						"		empno,		  " +
						"		ename,		  " +
						"		job,		  " +
						"		mgr,		  " +
						"		hiredate,	  " +
						"		sal,		  " +
						"		deptno		  " +
						"	)				  " +
						"	values			  " +
						"	(				  " +
						"		?,		  	  " + 
						"		?,	 		  " +
						"		?,			  " +
						"		?,			  " +
						"		?, 			  " +
						"		?,		 	  " +
						"		?			  " +
						"	)				  " ;
	
	public static void main(String[] args) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(className);
			con = DriverManager.getConnection(url, user, password);
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, 9112);
			pstmt.setString(2, "홍길동");
			pstmt.setString(3, "'xxx'");
			pstmt.setInt(4, 100);
//			pstmt.setTimestamp(5, new Timestamp(new Date().getTime())); // 날짜와 시간을 같이 표시
			pstmt.setDate(5, new java.sql.Date(new Date().getTime()));  // 날짜만
			pstmt.setFloat(6, 300.3f);
			pstmt.setInt(7, 30);
			
			pstmt.executeUpdate();
			
//			con.rollback();
			con.commit();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(con!=null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
