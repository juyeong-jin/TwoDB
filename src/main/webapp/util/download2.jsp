<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>download2.jsp</title>
<%@ include file="/WEB-INF/common/link.jspf" %>
</head>
<body>

<c:set var="contextPath" value="${pageContext.servletContext.contextPath}"/>
<h1> Download Test2</h1>
<ol>
<%
	final String UPLOAD_DIR="C:\\TEMP\\upload\\";
	File uDir = new File(UPLOAD_DIR);
	File[] dFiles = uDir.listFiles();
	int idx = -1;
	String title = null;
	String filename = null;
	for(File dFile : dFiles) {
		filename = dFile.getName(); 
		idx = filename.indexOf("_");
		if (idx > -1)
			title = filename.substring(0, idx);
		System.out.println("filename=[" + title + "]");
		%>
		<li>
		<a href="${contextPath}/download?filename=<%=filename%>" 
		class="btn btn-success">
		<%=title %>
		</a><br>
	</li>
		<% 
	}
%>

</ol> 
 
</body>
</html>