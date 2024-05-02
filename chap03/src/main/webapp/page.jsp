<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%@page import="common.Person"%>

<!-- 페이지 변수 만들기 -->
<%
pageContext.setAttribute("pageInt", 1000);
pageContext.setAttribute("pageStr", "페이지 영역 문자열");
pageContext.setAttribute("pageClass", new Person("홍길동", 20));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - page 영역</title>
</head>
<body>

<h2>page 영역 속성값</h2>
<%
int pageInt = (Integer)(pageContext.getAttribute("pageInt"));
String pageName = pageContext.getAttribute("pageStr").toString(); //객체로 들어가기 때문에 문자열로 한번 바꿔줘
Person pagePerson = (Person)pageContext.getAttribute("pageClass");
%>
<ul>
	<li><%=pageInt %></li>
	<li><%=pageName %></li>
	<li><%=pagePerson %></li>
</ul>
<%@ include file="includePage.jsp" %>
<!-- includePage.jsp의 내용을 카피 떠서 page.jsp에 갖다 놓은거라서 includePage.jsp는 없는 애야 -->

<h2>페이지 이동 후 page 영역 접근</h2>
<a href="page2.jsp">페이지 이동후 접근</a>
<!-- 페이지 벗어나는 순간 다 날라감! -->
</body>
</html>