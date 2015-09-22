<%@page import="com.webapp.util.Pagination"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>pagination.jsp</title>
<style type="text/css">
	.listnone {
		list-style: none;
	}
	.vertical {
		display: inline-block;
	}
	
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String pageNoStr = request.getParameter("pageNo");
	int pageNo=1;
	if (pageNoStr !=null)
		pageNo = Integer.parseInt(pageNoStr);
	
	Pagination paging  = new Pagination();
	paging.setPageNo(pageNo);
	paging.setTotalItem(487);	// select count(*) from city
%>
<ol>
	<li><%=paging.getPageNo()%>/<%=paging.getTotalPage()%></li>
	<li>[<%=paging.getTotalItem()%>]</li>
</ol>

<ul class="listnone">
	<%
		if (!paging.isFirstGroup()) {
	%>
		<li class="vertical"><a href="pagination.jsp?pageNo=<%=paging.getFirstPage()-1%>">&lt;&lt;이전</a></li>
	<%
		}
	%>
	
	<%
		for (int i=paging.getFirstPage(); i<=paging.getLastPage(); i++) {
	%>
		<li class="vertical"><a href = "pagination.jsp?pageNo=<%=i%>">[<%=i%>]</a></li>
	<%
		}
	%>
	
	<%
		if (!paging.isLastGroup()) {
	%>
		<li class="vertical"><a href="pagination.jsp?pageNo=<%=paging.getLastPage()+1%>">다음&gt;&gt;</a></li>
	<%
		}
	%>
</ul>

<ul>
	<%
		for (int i=paging.getFirstItem(); i<=paging.getLastItem(); i++) {
	%>
		<li><%=i * 100%></li>
	<%
		}
	%>
</ul>
</body>
</html>