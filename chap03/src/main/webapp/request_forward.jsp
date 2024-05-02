<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request 영역</title>
</head>
<body>

<h2>request forward 로 전달 받은 페이지</h2>

<%
String reqStr1 = (String)request.getAttribute("reqStr1");
Person reqPerson2 = (Person)request.getAttribute("reqPerson");


%>
<ul>
	<li>reqStr1 객체 : <%=(reqStr1 == null ? "null" : reqStr1) %></li>
	<li>reqPerson2 객체 : <%=(reqPerson2 == null ? "null" : reqPerson2) %></li>
</ul>

<h2>request forward 파라미터로 전달 받은 페이지</h2>
<%
request.setCharacterEncoding("UTF-8");
out.print(request.getParameter("name") + "<br>");
out.print(request.getParameter("ename") + "<br>");
out.print(request.getParameter("age") + "<br>");

%>
</body>
</html>