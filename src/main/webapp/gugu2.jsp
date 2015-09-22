<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gugu.jsp</title>
<%@ include file="/WEB-INF/common/link.jspf" %>
</head>
<body>
<%-- 
	구구단 출력 프로그램( <c:forEach>, <c:if>, <c:choose> )
	1단 ~ 9단
	
	[1단]
	1 x 1 = 1	==> red		==> 이텔릭
	1 x 2 = 2	==> blue	
	1 x 3 = 3	==> red
	1 x 4 = 4	==> blue
	1 x 5 = 5	==> red
	1 x 6 = 6	==> blue
	1 x 7 = 7	==> red
	1 x 8 = 8	==> blue
	1 x 9 = 9	==> red		==> 이텔릭
	
 --%>
 
<c:forEach var="i" begin="1" end="9" varStatus="status">
<div class="panel panel-primary" style="display: inline-block;">
   <div class="panel-heading">
   [${i}]단
   </div>
   <div class="panel-body">
   <c:forEach var="j" begin="1" end="9" varStatus="status">
   	<c:choose>
   		<%-- first or last --%>
   		<c:when test="${status.first || status.last}">
   			<i style="color:red;">${i} X ${j} = ${i*j}</i>
   		</c:when>
   		<%-- even --%>
   		<c:when test="${status.count mod 2 eq 0}">
   			<div style="color:blue">${i} X ${j} = ${i*j}</div>
   		</c:when>
   		<%-- odd --%>
   		<c:when test="${status.count mod 2 ne 0}">
   			<div style="color:red">${i} X ${j} = ${i*j}</div>
   		</c:when>
   	</c:choose>
   </c:forEach>
   </div>
</div>
</c:forEach>