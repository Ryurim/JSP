<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
	String str1 = "HI";
	String str2 = "JSP";
	
	String add_str(String str1, String str2) {
		return str1 + str2;
	}
%>

<h2>첫 JSP</h2>

<%@ include file = "test.jsp" %>
<p>
	<%out.println(str1 + " " + str2); %>
</p>

<%
out.println(add_str(str1, str2));
%>
<%= add_str("JSP", "테스트") %>
</body>
</html>