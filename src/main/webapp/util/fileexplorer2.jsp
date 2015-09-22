<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileexplorer2.jsp</title>
<%@ include file="/WEB-INF/common/link.jspf" %>
</head>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}"/>

<%
	request.setCharacterEncoding("utf-8");

	String dir = request.getParameter("filename");
	if(dir == null || dir == "") dir = "C:\\";
	File currentDir = new File(dir);
	File[] files = new File(dir).listFiles();
	
	String name = 		files[0].getName();
	long lastModified = files[0].lastModified();
	long length = 		files[0].length();
	boolean isDir = 	files[0].isDirectory();
	boolean isFile = 	files[0].isFile();
	
	Date d = new Date();
	d.setTime(lastModified);
	
	long freeSpace = currentDir.getFreeSpace();
	long usableSpace = currentDir.getUsableSpace();
	
	long dirCnt = 0;
	long fileCnt = 0;
	pageContext.setAttribute("currentDir", currentDir);
	pageContext.setAttribute("dirCnt", dirCnt);
	pageContext.setAttribute("fileCnt", fileCnt);
	pageContext.setAttribute("freeSpace", freeSpace);
	
%>
<%-- <c:set var="files" value='<%=new File(pageContext.getAttribute("directory"))%>'/> --%>
<c:set var="files" value="<%=files%>"/>


<%-- <c:set var="date" value="<%=new Date()%>"/> --%>    
<jsp:useBean id="date" class="java.util.Date"/>

<body>
<%

%>
<c:if test="${not empty currentDir.getParent()}">
<a href="${contextPath}/util/fileexplorer2.jsp?filename=${currentDir.getParent()}" class="btn btn-success btn-block">back</a>
</c:if>
<c:if test="${empty currentDir.getParent()}">
<a href="${contextPath}/util/fileexplorer2.jsp" class="btn btn-info btn-block">back</a>
</c:if>

 <table class="table table-striped">
 	<thead>
 		<tr> 	
	 		<th>이름</th>
	 		<th>수정한 날짜</th>
	 		<th>유형</th>
	 		<th>크기</th>
 		</tr>
 	</thead>
	<tbody>
	<c:remove var="fileSize"/>
		<c:forEach var="file" items="${files}">
 		<tr>
 			<c:if test="${file.directory eq true}">
 				<%
 				pageContext.setAttribute("directory", "${file.getPath()}");
 				%>
 				<td><a href="${contextPath}/util/fileexplorer2.jsp?filename=${file.getPath()}">${file.name}</a></td>
 			</c:if>
 			<c:if test="${file.directory ne true}">
 				<td>${file.name}</td>
 			</c:if>
 				<td>
 				<!-- JSTL useBean관련 Bean의 Property Setting -->
 					<jsp:setProperty property="time" name="date" value="${file.lastModified()}"/>
 					<fmt:formatDate value="${date}" pattern="yyyy-MM-dd a hh:mm:ss"/>
 				</td>
 				<td>${file.directory ? '[폴더]' : '&nbsp;파일 '}</td>
<!--  				<td class="text-right"> -->
					<td style="text-align: right">
 					<fmt:formatNumber pattern="###,###,###,###" value="${file.length()}"/>
 				</td>
 		</tr>
 		<c:if test="${file.directory eq true}">
  			<c:set var="dirCnt" value="${dirCnt = dirCnt + 1}"></c:set> 
 		</c:if>
 		<c:if test="${file.directory eq false}">
 			<c:set var="fileCnt" value="${fileCnt = fileCnt + 1}"></c:set>

  			<c:set var="fileSize" value="${fileSize = fileSize + file.length()}"></c:set>  
 		</c:if>

 	</c:forEach>
 	</tbody>
 	<tfoot>
 		<tr>
 			<td>			
 				${fileCnt}개 파일 ${fileSize} 바이트<br>
 				${dirCnt}개디렉터리 ${freeSpace}바이트 남음  
 			</td>
 		</tr>
 	</tfoot>


 
 </table>
 
</body>
</html>