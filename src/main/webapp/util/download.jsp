<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>download.jsp</title>
<%@ include file="/WEB-INF/common/link.jspf" %>
</head>
<body>

<c:set var="contextPath" value="${pageContext.servletContext.contextPath}"/>

<h1>Download Test</h1>
<ol>
	<li>
		<a href="download?filename=xxx.zip" 
		   class="btn btn-primary">
		   xxx.zip(tomcat src)
		</a>
	</li>
	<li>
		<a href="${contextPath}/download?filename=yyy.zip"
		   class="btn btn-success">
		   yyy.zip(tomcat src)
		</a>
	</li>
	<li>
		<a href="${contextPath}/download?filename=홍길동.msi"
		   class="btn btn-success">
		   홍길동.msi(mysql)
		</a>
	</li>
	<li>
		<a href="${contextPath}/download?filename=apache-tomcat-8.0.23-src.zip"
		   class="btn btn-success">
		   apache-tomcat-8.0.23-src.zip
		</a>
	</li>
	<li>
		<a href="${contextPath}/download?filename=OracleXE112_Win32.zip"
		   class="btn btn-success">
		   OracleXE112_Win32.zip
		</a>
	</li>
	<li>
		<a href="${contextPath}/download?filename=sample.jocl"
		   class="btn btn-success">
		   sample.jocl
		</a>
	</li>
</ol>
</body>
</html>