<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="my" tagdir="/WEB-INF/tags/my"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileexplorer.jsp</title>
<%@ include file="/WEB-INF/common/link.jspf" %>
</head>

<%
	/* String dir = "C:\\";
	File[] files = new File(dir).listFiles();
	
	String name = 		files[0].getName();
	long lastModified = files[0].lastModified();
	long length = 		files[0].length();
	boolean isDir = 	files[0].isDirectory();
	boolean isFile = 	files[0].isFile();
	
	Date d = new Date();
	d.setTime(12344556L);
	 */
%>

<%-- <c:set var="files" value="<%=files%>"/> --%>
<my:listFiles var="files" path="c:\\"/>

<jsp:useBean id="date" class="java.util.Date"/>
<%-- <c:set var="date" value="<%= new Date() %>"/> --%>
<body>
<button onclick="goBack()">back</button>

<table class="table table-striped">
	<thead>
		<tr>
		<th>이름</th>
		<th>수정한 날짜</th>
		<th>유형</th>
		<th class="text-right">크기</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="file" items="${files}">
		<tr>
			
			<td>${file.name}</td>
			<td>
				<jsp:setProperty property="time" name="date" value="${file.lastModified()}"/>
				<fmt:formatDate value="${date}" pattern="yyyy-MM-dd a hh:mm:ss"/>
			
			</td>
			<td>${ file.directory ? '[폴더]' : '&nbsp;파일  '}</td>
			<td class="text-right">
				<fmt:formatNumber pattern="###,###,###,###" value="${file.length()}"/>
			</td>
			
		</tr>
	</c:forEach>		
	</tbody>
	<tfoot>
		<tr>
			<td class="text-right">
				
			</td>
		</tr>	
	</tfoot>
</table>
</body>
</html>