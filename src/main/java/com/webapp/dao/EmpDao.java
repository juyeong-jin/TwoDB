package com.webapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.webapp.exception.InsertRuntimeException;
import com.webapp.model.Dept;
import com.webapp.model.Emp;

public class EmpDao {
   Connection con;

   final String SELECT_ALL = "select * from emp";

   // 커넥션 세터만들기
   public void setConnection(Connection con) {
      this.con = con;
   }

   public EmpDao(Connection con) {
      this.con = con;
   }

   public List<Emp> selectAll() { // / 리스트 형태의 Dept를 반환하는 역할의 메서드

      List<Emp> emps = new ArrayList<Emp>(); // while문의 객체들을 담는 그릇이 필요.

      Statement stmt = null;
      ResultSet rs = null;
      try {
         stmt = con.createStatement();
         rs = stmt.executeQuery(SELECT_ALL);

         while (rs.next()) { // 관계형 디비의 row 를 자바로 매핑처리하는 것.
            Emp emp = new Emp(); // VO 이므로 담는 역할 한다.
            emp.setEmpno(rs.getInt("empno"));
            emp.setEname(rs.getString("ename"));
            emp.setJob(rs.getString("job"));
            
            if (rs.getObject("mgr") !=null)
            	emp.setMgr(rs.getInt("mgr"));
            else
            	emp.setMgr(null);
            
            emp.setHiredate(rs.getTimestamp("hiredate"));
            
            if (rs.getObject("sal") !=null)
            	emp.setSal(rs.getFloat("sal"));
            else
            	emp.setMgr(null);
            
            if (rs.getObject("comm") !=null)
            	emp.setComm(rs.getFloat("comm"));
            else
            	emp.setMgr(null);

            Dept dept = new Dept();
            if (rs.getObject("deptno") != null)
            	dept.setDeptno(rs.getInt("deptno"));
            else
            	dept.setDeptno(null);
          
            emp.setDept(dept);
            
            emps.add(emp);
         }

      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         try {
            if (rs != null)
               rs.close();
            if (stmt != null)
               stmt.close();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }
      return emps;
   }

   final String INSERT = "insert into emp " +
                   "(              		  "+
                   " empno,         	  "+
                   " ename,         	  "+
                   " job,           	  "+
                   " mgr,           	  "+
                   " hiredate,            "+
                   " sal,            	  "+
                   " comm,            	  "+
                   " deptno           	  "+
                   ")              		  "+
                   "values         		  "+
                   "(             		  "+
                   "   ?,         	      "+
                   "   ?,           	  "+
                   "   ?,            	  "+
                   "   ?,          		  "+
                   "   ?,           	  "+
                   "   ?,           	  "+
                   "   ?,           	  "+
                   "   ?          	  	  "+
                   ")              		  ";

   public void insert(Emp emp) {
      PreparedStatement pstmt = null;
      try {
         pstmt = con.prepareStatement(INSERT);
         pstmt.setInt(1, emp.getEmpno());
         pstmt.setString(2, emp.getEname());
         pstmt.setString(3, emp.getJob());
         
         if (emp.getMgr() != null)
        	 pstmt.setInt(4, emp.getMgr());
         else
        	 pstmt.setNull(4, Types.NUMERIC);
         
         pstmt.setTimestamp(5, (emp.getHiredate() != null) ? new Timestamp(emp.getHiredate().getTime()) : null);
         
         /*
          * Sal 
          */
         
         if (emp.getMgr() != null)
        	 pstmt.setFloat(6, emp.getSal());
         else
        	 pstmt.setNull(6, Types.NUMERIC);
         
         /*
          * Comm 
          */
         
         if (emp.getMgr() != null)
        	 pstmt.setFloat(7, emp.getComm());
         else
        	 pstmt.setNull(7, Types.NUMERIC);
         
         Integer deptno = emp.getDept().getDeptno();
         if(deptno!=null)
         pstmt.setInt(8, emp.getDept().getDeptno());
         else
//        	 pstmt.setString(8, null);
        	 pstmt.setNull(8, Types.NUMERIC);
         int count = pstmt.executeUpdate();
         if (count != 1) { // 1이 아니라면 문제가 있음
            throw new InsertRuntimeException("count =" + count);
         }
      } catch (SQLException e) {
         // 요기서 잡혔으면 인서트시 예외 발생했다는 뜻.
         throw new InsertRuntimeException(e);
      } finally {
         if (pstmt != null)
            try {
               pstmt.close();
            } catch (SQLException e) {
               e.printStackTrace();
            }
      }
   }
   
   public void deleteAll() {
         Statement stmt = null;
         try {
            stmt = con.createStatement();
            stmt.executeUpdate("delete from emp");
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
               try {
                  if (stmt != null) stmt.close();
               } catch (SQLException e) {
                  e.printStackTrace();
               }
         }
      }
   
   
   
}