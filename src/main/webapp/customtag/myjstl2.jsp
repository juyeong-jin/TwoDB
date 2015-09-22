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
<title>myjstl2.jsp</title>
<%@ include file="/WEB-INF/common/link.jspf" %>
</head>
<body>
<hr>
	<h1>my:forEach</h1>
<hr>
<c:forEach var="i" begin="0" end="10">
	<c:choose>
		<c:when test="${i mod 2 == 0}">
			${i} = even<br>
		</c:when>
		<c:when test="${i mod 2 == 0}">
			${i} = odd<br>
		</c:when>
	</c:choose>
</c:forEach>
<hr>
	<h1>my:forEach</h1>
<hr>
<my:forEach var="i" begin="0" end="10">
	<c:choose>
		<c:when test="${i mod 2 == 0}">
			${i} = even<br>
		</c:when>
		<c:when test="${i mod 2 == 0}">
			${i} = odd<br>
		</c:when>
	</c:choose>
</my:forEach>

</body>
</html>