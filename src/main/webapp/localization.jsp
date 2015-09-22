<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>localization.jsp</title>
<%@ include file="/WEB-INF/common/link.jspf" %>
</head>
<body>

<c:if test="${not empty param.locale}">
<fmt:setLocale value="${param.locale}" scope="session"/>
<c:remove var="en"/>
<c:remove var="ko"/>
<c:remove var="ja"/>
<c:remove var="zh"/>
<c:choose>
	<c:when test="${param.locale eq 'en'}"><c:set var="en" value="selected" scope="session"/></c:when>
	<c:when test="${param.locale eq 'ko'}"><c:set var="ko" value="selected" scope="session"/></c:when>
	<c:when test="${param.locale eq 'ja'}"><c:set var="ja" value="selected" scope="session"/></c:when>
	<c:when test="${param.locale eq 'zh'}"><c:set var="zh" value="selected" scope="session"/></c:when>
</c:choose>
</c:if>

<hr>
<form action="localization.jsp">
<select name="locale">
	<option value="en" ${en}]>english</option>
	<option value="ko" ${ko}>korean</option>
	<option value="ja" ${ja}>japan</option>
	<option value="zh" ${zh}>chinese</option>
</select>
<input type="submit" value="언어설정"/>
</form>
<hr>
<div class="panel panel-success" style="display:inline-block;">
	<div class="panel-heading">
		<fmt:message key="greeting"/>
	</div>
	<div class="panel-body">
		<fmt:message key="body"/>
	</div>
</div>

</body>
</html>