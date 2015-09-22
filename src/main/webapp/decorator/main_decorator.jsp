<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="sitemesh" tagdir="/WEB-INF/tags/sitemesh" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main_decorator.jsp + <sitemesh:write property="title"/></title>
<%@ include file="/WEB-INF/common/link.jspf" %>

<sitemesh:write property="head"/>

<style type="text/css">
	.topmenu {
		display: inline-block;
		border: none;
		padding: 1px;
	}

</style>

</head>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}"/>

<body class="container">

<header class="col-sm-12">
<!-- Main Menu -->
	<ul class="list-group">
		<li class="list-group-item topmenu"><a href="#" class="btn btn-info">World</a></li>
		<li class="list-group-item topmenu"><a href="#" class="btn btn-info">Employee</a></li>
		<li class="list-group-item topmenu"><a href="#" class="btn btn-info">Util</a></li>
	</ul>
</header>
<aside class="col-sm-3">
<!-- Sub Menu -->
	<div class="btn-group">
		<a href="${contextPath}/util/fileexplorer.jsp" class="btn btn-success btn-block">File Explorer</a>
		<a href="${contextPath}/util/controlpanel.jsp" class="btn btn-success btn-block">Control panel</a>
		<a href="#" class="btn btn-success btn-block">Control panel 2</a>
		<a href="#" class="btn btn-success btn-block">Control panel 3</a>
		<a href="#" class="btn btn-success btn-block">Control panel 4</a>
		<a href="#" class="btn btn-success btn-block">Control panel 5</a>
	</div>
</aside>

<article class="col-sm-9">
<sitemesh:write property="body"/>
</article>


<footer class="col-sm-12">
	<h1 class="text-center text-primary bg-success">Footer</h1>
</footer>

</body>
</html>