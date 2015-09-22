<%@page import="com.webapp.model.City"%>
<%@page import="com.webapp.model.CityList"%>
<%@page import="com.webapp.service.CityListService"%>
<%@page import="com.webapp.util.Pagination"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>citylist.jsp</title>
<!-- bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<style type="text/css">
   .listnone {
      list-style: none;      
   }
   .horizontal {
      display: inline-block;
   }
   
</style>
</head>
<body>
<%
   request.setCharacterEncoding("utf-8");

   String pageNoStr = request.getParameter("pageNo");
   int pageNo = 1;
   if (pageNoStr != null)
      pageNo = Integer.parseInt(pageNoStr);
   
   CityListService service = new CityListService();
   CityList model = service.getList(pageNo);
    
	pageContext.setAttribute("model", model);
   
    /* CityList m = new CityList();
	m.setPageNo(100); model.setTotalItem(1000);
	request.setAttribute("model", m);
	
	m = new CityList();
	m.setPageNo(200); model.setTotalItem(2000);
	session.setAttribute("model", m);
	
	m = new CityList();
	m.setPageNo(300); model.setTotalItem(3000);
	application.setAttribute("model", m); */
	
%>
<ol>
   <li>[<%=model.getPageNo()%>/<%=model.getTotalPage()%>]</li>
   <li>[<%=model.getTotalItem()%>]</li>
   
   <li>[${requestScope.model.pageNo}/${requestScope.model.totalPage}]</li>
   <li>[${requestScope.model.totalItem}]</li>
   
   <li>[${model.pageNo}/${model.totalPage}]</li>
   <li>[${model.totalItem}]</li>
</ol>

<ul class="listnone">
   <%
      if (!model.isFirstGroup()) {
   %>
      <li class="horizontal">
<%--          <a class="btn btn-primary" href="citylist.jsp?pageNo=<%=model.getFirstPage()-1%>">&lt;&lt;이전</a> --%>
         <a class="btn btn-primary" href="citylist.jsp?pageNo=${model.firstPage - 1}">&lt;&lt;이전</a>
      </li>
   <%
      }
   %>
      <li class="horizontal">
      <div class="btn-group">
   <%
      for (int i=model.getFirstPage(); i<=model.getLastPage(); i++) {
         String color = null;
         if (model.getPageNo() == i)
            color = "btn-success";
         else
            color = "btn-default";
         
         pageContext.setAttribute("color", color);
         pageContext.setAttribute("i", i);
   %>
<%--          <a class="btn <%=color %> btn-sm" href="citylist.jsp?pageNo=<%=i%>">[<%=i%>]</a>  --%>
         <a class="btn ${color} btn-sm" href="citylist.jsp?pageNo=${i}">[${i}]</a>  
   <%
      }
   %>
      </div>
      </li>
   <%
      if (!model.isLastGroup()) {
   %>
      <li class="horizontal">
<%--          <a class="btn btn-info" href="citylist.jsp?pageNo=<%=model.getLastPage()+1%>">다음&gt;&gt;</a> --%>
         <a class="btn btn-info" href="citylist.jsp?pageNo=${model.lastPage + 1}">다음&gt;&gt;</a>
      </li>
   <%
      }
   %>
</ul>
<table class="table table-bordered table-hover">
   <thread>
      <tr>
         <th>ID</th>
         <th>Name</th>
         <th>Code</th>
         <th>District</th>
         <th>Population</th>
      </tr>
   </thread>
   <tbody>
   <%
      for (City city : model.getCitys()) {
         pageContext.setAttribute("c", city);
   %>
      <tr>
         <td>${c.id}</td> 
         <td>${c.name}</td> 
         <td>${c.country.code}</td> 
         <td>${c.district}</td> 
         <td>${c.population}</td>
      </tr>
   <%
      }
   %>
   </tbody>
</table>



</body>
</html>