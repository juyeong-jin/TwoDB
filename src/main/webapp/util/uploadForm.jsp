<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadForm.jsp</title>
<%@ include file="/WEB-INF/common/link.jspf" %>
</head>
<body>

<c:set var="contextPath" value="${pageContext.servletContext.contextPath}"/>

<section style="width: 50%">
   <h1>Upload Form</h1>
<!--    <form action="http://localhost:8081/" method="post" enctype="multipart/form-data"> -->
   <form action="${contextPath}/upload" method="post" enctype="multipart/form-data">
   <!-- <form action="" method="post" enctype="application/x-www-form-urlencoded"> -->
   
<!--    <div class="form-group"> -->
<!--    <label for="id">id</label> -->
<!--    <input id="id" type="text" name="id" value="홍길동" class="form-control"/> -->
<!--    </div> -->
   
   <div class="form-group">
   <label for="file1">file1</label>
   <input id="file1" type="file" name="file1" class="form-control"/>
   </div>
   
   <input type="submit" value="업로드" class="btn btn-default"/>

</form>
</section>
</body>
</html>