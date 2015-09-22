<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag body-content="empty" %>
<%@ attribute name="test" required="true" type="java.lang.Boolean"%>
<%@ attribute name="cls" %>

<%
	if (test) {
%>
	<button class="${cls}"> my:login Log out</button>
<%
	} else {
%>
	<button class="${cls} btn-primary"> my:loing Log In</button>
<% 		
	}
%>

