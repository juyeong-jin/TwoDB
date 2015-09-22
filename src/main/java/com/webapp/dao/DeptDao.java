// 실제 디비에 접속하는 역할

package com.webapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.webapp.exception.InsertRuntimeException;
import com.webapp.model.Dept;

public class DeptDao {
   Connection con;
 
   final String SELECT_ALL = "select * from dept";

   // 커넥션 세터만들기
   public void setConnection(Connection con) {
      this.con = con;
   }

   public DeptDao(Connection con) {
      this.con = con;
   }

   public List<Dept> selectAll() { // / 리스트 형태의 Dept를 반환하는 역할의 메서드

      List<Dept> depts = new ArrayList<Dept>(); // while문의 객체들을 담는 그릇이 필요.

      Statement stmt = null;
      ResultSet rs = null;
      try {
         stmt = con.createStatement();
         rs = stmt.executeQuery(SELECT_ALL);

         while (rs.next()) { // 관계형 디비의 row 를 자바로 매핑처리하는 것.
            Dept dept = new Dept(); // VO 이므로 담는 역할 한다.
            dept.setDeptno(rs.getInt("deptno"));
            dept.setDname(rs.getString("dname"));
            dept.setLoc(rs.getString("loc"));
            depts.add(dept);
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
      return depts;
   }

   final String INSERT = "insert into dept " +
                   "(               "+
                   " deptno,          "+
                   " dname,          "+
                   " loc             "+
                   ")               "+
                   "values         "+
                   "(   ?,            "+
                   "   ?,            "+
                   "   ?            "+
                   ")               ";

   public void insert(Dept dept) {
      PreparedStatement pstmt = null;
      try {
         pstmt = con.prepareStatement(INSERT);
         pstmt.setInt(1, dept.getDeptno());
         pstmt.setString(2, dept.getDname());
         pstmt.setString(3, dept.getLoc());
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
            stmt.executeUpdate("delete from dept");
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