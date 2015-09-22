<%@page import="com.webapp.util.Pagination"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pagination.jsp</title>
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
   int pageNo =1;
   if (pageNoStr != null)
      pageNo = Integer.parseInt(pageNoStr);
   
   Pagination paging = new Pagination();
   paging.setPageNo(pageNo);
   paging.setTotalItem(487);   // select count(*) from city

%>
<ol>
   <li>[<%=paging.getPageNo()%>/<%=paging.getTotalPage()%>]</li>
   <li>[<%=paging.getTotalItem()%>]</li>
</ol>

<ul class="listnone">
   <%
      if (!paging.isFirstGroup()) {
   %>
      <li class="horizontal">
         <a class="btn btn-primary" href="pagination_bootstrap.jsp?pageNo=<%=paging.getFirstPage()-1%>">&lt;&lt;이전</a>
      </li>
   <%
      }
   %>
      <li class="horizontal">
      <div class="btn-group">
   <%
      for (int i=paging.getFirstPage(); i<=paging.getLastPage(); i++) {
         String color = null;
         if (paging.getPageNo() == i)
            color = "btn-success";
         else
            color = "btn-default";
   %>
         <a class="btn <%=color %> btn-sm" href="pagination_bootstrap.jsp?pageNo=<%=i%>">[<%=i%>]</a>   
   <%
      }
   %>
      </div>
      </li>
   <%
      if (!paging.isLastGroup()) {
   %>
      <li class="horizontal">
         <a class="btn btn-info" href="pagination_bootstrap.jsp?pageNo=<%=paging.getLastPage()+1%>">다음&gt;&gt;</a>
      </li>
   <%
      }
   %>
</ul>
<ul>
   <%
      for (int i=paging.getFirstItem(); i<=paging.getLastItem(); i++) {
   %>
      <li><%=i * 100%> </li>
   <%
      }
   %>

</ul>



</body>
</html>