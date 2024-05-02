<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>

<!-- 페이지 변수 만들기 -->
<%
int pageInt2 = (Integer)(pageContext.getAttribute("pageInt"));
//String pageName2 = pageContext.getAttribute("pageStr").toString();
Person pagePerson2 = (Person)(pageContext.getAttribute("pageClass"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - page Context</title>
</head>
<body>
<ul>
	<li><%=pageInt2 %></li>
	<li><%=pageContext.getAttribute("pageStr") %></li>
	<li><%=pagePerson2 %></li>
</ul>
</body>
</html>