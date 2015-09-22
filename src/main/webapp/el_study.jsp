<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.webapp.model.Dept"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el_study.jsp</title>
<%@ include file="/WEB-INF/common/link.jspf" %>
</head>
<body>
<!--  
@EL 표기법
	1. \${expr}	==> EL
	2. \#{expr}	==>	deferred EL
	
@EL 변수 접근연산자
	1. . (dot)
	2. []
	
		
@EL 기본객체 11개	
	1. pageContext			==> page(this), Bean, Servlet
	2. pageScope			==> Map<String, object>	
	3. requestScope			==> Map<String, object>
	4. sessionScope			==> Map<String, object>
	5. applicationScope		==> Map<String, object>
	6. param				==> Map<String, String>
	7. paramValues			==> Map<String, String[]>
	8. header				==> Map<String, String>
	9. headerValues			==> Map<String, String[]>
   10. cookie				==> Map<String, Cookie>, Map<쿠키이름, Cookie>
   11. initParm				==> Map<String, String>
-->

<ol class="list-group">
<!-- 1. pageContext -->
   <li class="list-group-item">
   <h3 class="list-group-item-heading" style="background-color: Darkorange">
      1. \${ContextPath.servletContext.contextPath}
   </h3>
   <p class="list-group-item-text">
      ContextPath = <%=this.getServletContext().getContextPath() %><br>
      ContextPath = ${pageContext.servletContext.contextPath}
   </p>
   </li>
   <li class="list-group-item">
      <h3 class="list-group-item-heading" style="background-color: Thistle">
         1. \${pageContext.request.requestURI} 
      </h3>
      <p class="list-group-item-text">
         RequestURI = <%=request.getRequestURI()%>><br>
         RequestURI = <%=((HttpServletRequest)pageContext.getRequest()).getRequestURI()%><br>
         RequestURI = ${pageContext.request.requestURI}
         </p>
   </li>
	<!-- 2. pageScope -->
	<%
		String id = "world";
		String name = "홍길동";
		int age = 30;
		pageContext.setAttribute("id", id);
		pageContext.setAttribute("new-name", name);
		pageContext.setAttribute("age", age);
	%>
	<li class="list-group-item">
		<h3 class="list-group-item-heading" style="background-color:yellow">
			2. \${pageScope.id} or \${pageScope['id']}
		</h3>
		<p class="list-group-item-text">
			id = 	${pageScope.id}<br>
			name = 	${pageScope['new-name']}<br>
			age = 	${pageScope.age}
		</p>
	</li>
	<!-- 3. requestScope -->
	<%
		String[] color = {"black", "white", "red", "blue", "green", "yellow"};
		
		request.setAttribute("color", color);
	%>
	<li class="list-group-item">
		<h3 class="list-group-item-heading" style="background-color:LawnGreen">
			3. \${requestScope.color[0]}
		</h3>
		<p class="list-group-item-text">
			color[0] = ${requestScope.color[0]}<br>
			color[1] = ${requestScope.color[1]}<br>
			color[2] = ${requestScope.color[2]}<br>
			color[3] = ${requestScope.color[3]}<br>
			color[4] = ${requestScope.color[4]}
		</p>
	</li>
	<!-- 4. sessionScope -->
	<%
		List<Dept> list = new ArrayList<Dept>();
		list.add(new Dept(10, "서울"));
		list.add(new Dept(20, "대전"));
		list.add(new Dept(30, "대구"));
		list.add(new Dept(40, "부산"));
		list.add(new Dept(50, "광주"));
		list.add(new Dept(60, "속초"));
		list.add(new Dept(70, "제주"));
		
		session.setAttribute("model", list);
	%>
	<li class="list-group-item">
		<h3 class="list-group-item-heading" style="background-color:gray">
			4. \${sessionScope.model[0]['deptno']}
		</h3>
		<p class="list-group-item-text">
			<%
				for (int i=0; i<list.size(); i++) {
					session.setAttribute("i", i);
			%>
			list[${i}] = ${sessionScope.model[i]['deptno']} ${sessionScope.model[i].dname}<br>
			<%
				}
			%>
		</p>
	</li>
	<!-- 5. applicationScope -->
	<%
		Map<String, Dept> map = new HashMap<String, Dept>();
		map.put("seoul", new Dept(10, "서울1"));
		map.put("daegu", new Dept(20, "대구1"));
		map.put("daejeon", new Dept(30, "대전1"));
		map.put("busan", new Dept(40, "부산1"));
		map.put("kwangju", new Dept(50, "광주1"));
		map.put("sokcho", new Dept(60, "속초1"));
		map.put("jeju", new Dept(70, "제주1"));
		
		application.setAttribute("model", map);
	%>
	<li class="list-group-item">
		<h3 class="list-group-item-heading" style="background-color:gold">
			5. Dept(\${m.deptno}, \${m.dname})
		</h3>
		<p class="list-group-item-text">
			<c:forEach var="m" items="${applicationScope.model}">
			${m.key} = Dept(${m.value.deptno}, ${m.value.dname})<br>
			</c:forEach>	
		</p>
	</li>
	<!-- 6. param -->
	<fmt:requestEncoding value = "utf-8"/>
	
	<c:if test="${not empty param.name}">
	<li class="list-group-item">
		<h3 class="list-group-item-heading" style="background-color:Plum">
			6.\${paramValues.name[i]}
		</h3>
		<p class="list-group-item-text">
			pageNo = ${param.pageNo}<br>
			<c:forEach var="name" items="${paramValues.name}">
				name = ${name}<br>
			</c:forEach>
			<hr>
			
			<c:set var="length" value='${fn:length(paramValues.name)}'/>
			
			<c:forEach var="i" begin="0" end="${length - 1}">
					name = ${paramValues.name[i]}<br>
			</c:forEach>
			
			<hr>
			<c:forEach var="i" begin="0" end="${fn:length(paramValues.name) - 1}">
				<c:if test="${i == 0}">
					<b><i>name = ${paramValues.name[i]}</i></b><br>
				</c:if>
				<c:if test="${i != 0}">
					name = ${paramValues.name[i]}<br>
				</c:if>
			</c:forEach>
			
			<hr>
			<c:set var="length" value="${fn:length(paramValues.name)}"/>
			<c:forEach var="i" begin="0" end="${fn:length(paramValues.name) - 1}">
				<c:choose>
					<c:when test="${i == 0}">
						<b style="color: red;">name = ${paramValues.name[i]}</b><br>
					</c:when>
					<c:when test="${i == (length-1)}">
						<b style="color: blue;">name = ${paramValues.name[i]}</b><br>
						name = ${paramValues.name[i]}<br>
					</c:when>
					<c:otherwise>
						name = ${paramValues.name[i]}<br>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</p>
	</li>
	</c:if>
	<!-- 8. header -->
	<li class="list-group-item">
		<h3 class="list-group-item-heading">
			8.\${header['User-Agent']}
		</h3>
		<p class="list-group-item-text">
			User-Agent = ${header['User-Agent']}<br>
			Accept-Language = ${header['Accept-Language']}
		</p>
		<hr>
		<p>
			<c:forEach var="entry" items="${header}">
				${entry.key} = ${entry.value}<br>
			</c:forEach>
		</p>	
	</li>
	<!-- 10. cookie -->
	<%
		Cookie loginid = new Cookie("loginid", "xxxx");
		Cookie password = new Cookie("password", "1234");
		response.addCookie(loginid);
		response.addCookie(password);
		
	%>
	<li class="list-group-item">
		<h3 class="list-group-item-heading">
			10.\${cookie.loginid.value}
		</h3>
		<p class="list-group-item-text">
			${cookie.loginid.name} = ${cookie.loginid.value}<br>
			${cookie.password.name} = ${cookie.password.value}
		</p>
		<hr>
		<p>
			<c:forEach var="entry" items="${cookie}">
				${entry.key} = ${entry.value.name} =  ${entry.value.value}<br>
			</c:forEach>
		</p>	
	</li>
	
	<!-- 11. initParam -->
	<li class="list-group-item">
		<h3 class="list-group-item-heading">
			11.\
		</h3>
		<p class="list-group-item-text">
			DB = 		${initParam.DB}<br>
			className = ${initParam.className}<br>
			url = 		${initParam.url}<br>
			user = 		${initParam.user}<br>
			password = 	${initParam.password}<br>
		</p>
		<hr>
		<p>
			<c:forEach var="entry" items="${initParam}">
				${entry.key} = ${entry.value}<br>
			</c:forEach>
		</p>	
	</li>
</ol>
</body>
</html>