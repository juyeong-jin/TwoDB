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
 
 <table>
	<tr>
   		<c:forEach var="a" begin="1" end="9">
    		<td align="center" width="70" ><font color="black"><b><p style="background-color:LawnGreen">[ ${a}단 ]</p></b></font></td>

   		</c:forEach>
  	</tr>
  	
 	<c:forEach var="i" begin="1" end="9">
	<tr>
		<c:forEach var="j" begin="1" end="9">	
			
			<c:if test="${i%2 == 0}">		
				<td align="center" width="70"><font color="blue">${j}*${i} = ${i*j}</font></td>
			</c:if>
			<c:if test="${i%2 == 1}">	
				<c:if test="${i == 1}">	
					<td align="center" width="70"><font color="red"><i><b>${j}*${i} = ${i*j}</b></i></font></td>
				</c:if>	
				<c:if test="${i == 9}">	
					<td align="center" width="70"><font color="red"><i><b>${j}*${i} = ${i*j}</b></i></font></td>
				</c:if>
				<c:if test="${(i != 9) && (i != 1)}">
					<td align="center" width="70"><font color="red">${j}*${i} = ${i*j}</font></td>
				</c:if>
			</c:if>
			
		</c:forEach>
	</tr>
	</c:forEach>

	</table>	
	
</body>
</html>