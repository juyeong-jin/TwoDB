<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags/my" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myjstl.jsp</title>
<%@ include file="/WEB-INF/common/link.jspf" %>
</head>
<body>
<hr>
	<h1>jstl [set, if]</h1>
<hr>
<c:set var="login" value="false"/>

<c:if test="${login}">
	<button class="btn btn-defalut">Log out</button>
</c:if>
<c:if test="${not login}">
	<button class="btn btn-primary">Log In</button>
</c:if>

<hr>
	<h1>my jstl [set, if]</h1>
<hr>

<%
	boolean login = false;
	pageContext.setAttribute("login", login);
%>
<my:if test="${login}">
	<button class="btn btn-defalut"> My Log out</button>
</my:if>
<my:if test="${not login}">
	<button class="btn btn-primary"> My Log In</button>
</my:if>


<hr>
	<h1>my login tag</h1>
<hr>

<my:login test="${login}" cls="btn btn-default"/>

<c:remove var="login"/>

<hr>
	<h1>my:set tag</h1>
<hr>
<my:set var="xxx" value="<%= new Boolean(false) %>"/>

<my:login test="${xxx}" cls="btn btn-default"/>

<my:set var="hong" value="홍길동"/>
hong = ${hong}<br>

<my:set var="date" value="<%=new Date()%>"/>
date = <fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/><br>	

<hr>
	<h1>my:listFiles tag</h1>
<hr>

<my:listFiles var="files" path="c:\\"/>

<c:forEach var="file" items="${files}">
	${file.name} <br>
</c:forEach>

<hr>
	<h1>my:remove tag</h1>
<hr>
<c:set var="xxx" value="12_page" 		scope="page"/>
<c:set var="xxx" value="12_request" 	scope="request"/>
<c:set var="xxx" value="12_session" 	scope="session"/>
<c:set var="xxx" value="12_application" scope="application"/>

xxx page = 			${xxx}<br>
xxx page = 			${pageScope.xxx}<br>
xxx request = 		${requestScope.xxx}<br>
xxx session = 		${sessionScope.xxx}<br>
xxx application = 	${applicationScope.xxx}<br>
<my:remove var="xxx"/>
xxx page = 			${xxx}<br>
xxx page = 			${pageScope.xxx}<br>
xxx request = 		${requestScope.xxx}<br>
xxx session = 		${sessionScope.xxx}<br>
xxx application = 	${applicationScope.xxx}<br>


</body>
</html>