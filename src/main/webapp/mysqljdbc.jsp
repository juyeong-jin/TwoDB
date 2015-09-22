<%@page import="com.webapp.calc.CountryCode"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mysqljdbc.jsp</title>
</head>
<script>
function onLoadCntCode() {
   document.search.countrycode.value = '<%=request.getParameter("countrycode")%>';
}
</script>


<body>
<h1>두번째 버튼을 꼬옥 눌러주세요</h1>
<style type="text/css">
   h2{color: #161089;}
   h2:HOVER { color:#980151;};
   a{ text-decoration: none; }
   a :VISITED { color: #00D8FF; }
   body{background-color: #EBF7FF; font-family: Areal }
   
   #submitlabel { background-color: #FAECC5; }
</style>
<%
   String className = "com.mysql.jdbc.Driver";
   String url = "jdbc:mysql://localhost:3306/world";   // JDBC URL
   String user = "world";
   String password = "1234";
   String sql = "select *"
            + " from city as c"
            + " where countrycode = ?";   // placeholder
   Connection con = null;      
   PreparedStatement pstmt = null;
   PreparedStatement pstmt2 = null;
   ResultSet rs = null;
   ResultSet rs2 = null;
   List countrycodes = new ArrayList();
   String countrycode = request.getParameter("countrycode");
   try{
   Class.forName(className);
   con = DriverManager.getConnection(url, user, password);
   pstmt2 = con.prepareStatement("select code, name from country");
   rs2 = pstmt2.executeQuery();
   while(rs2.next()) {
      CountryCode code = new CountryCode();
      code.setCountryCode(rs2.getString("Code"));
      code.setName(rs2.getString("name"));
      countrycodes.add(code);
   }
   }catch(Exception e) {
      out.println("<script>alert('디비접속 중 오류가 발생했습니다.')</script>");
      e.printStackTrace();
   }%>
<form id="search" name="search" action="/TwoDB/mysqljdbc.jsp" method="post">
 <select id="countrycode" name="countrycode">
  <option value="country">CountryCode</option>
  <%for(int i = 0; i<countrycodes.size(); i++) {%>
  <option value="<%=((CountryCode)countrycodes.get(i)).getCountryCode() %>"><%=((CountryCode)countrycodes.get(i)).getName() %>
  </option>
  <%} %>
</select> 
<input type="submit" value="도시조회"/>
<input type="button" value="눌러보고싶지"/>
   <%
   if(countrycode != null) 
   try {   
      // 1. Class Loading 
      // 2. Connection 연결
      // 3. Statement 생성한다 (2가지 방법이 있다)
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, countrycode);
      rs = pstmt.executeQuery();
      
      out.println("<ol>");
      while(rs.next()) {
         int id = rs.getInt("id");
         String name = rs.getString("name");
         String district = rs.getString("district");
         int population = rs.getInt("population");
%>

   <li><%=id%> <%=name%> <%=district%> <%=population%></li>
<%
      }
      out.println("</ol>");
   } catch (SQLException e) {
      e.printStackTrace();
      log("mysql error", e);
   } finally {
      if(rs != null) rs.close();
      if(pstmt != null) pstmt.close();
      if(con != null) con.close();
   }
%>      
   

</form>
<script>
onLoadCntCode();
</script>

</body>
</html>