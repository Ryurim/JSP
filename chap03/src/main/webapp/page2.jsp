<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%
Object pageInt2 = pageContext.getAttribute("pageInt");
Object pageName2 = pageContext.getAttribute("pageStr");
Object pagePerson2 = pageContext.getAttribute("pageClass");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<ul>
	<li>pageInt2 객체 : <%=(pageInt2 == null ? "null" : pageInt2) %></li>
	<li>pageName2 객체 : <%=(pageName2 == null ? "null" : pageName2) %></li>
	<li>pagePerson2 객체 : <%=(pagePerson2 == null ? "null" : pagePerson2) %></li>
</ul>
</body>
</html>