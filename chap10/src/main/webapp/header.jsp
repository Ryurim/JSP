<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%@ page import="common.CookieUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL - 내장 객체</title>
</head>
<body>
<%
CookieUtil.setCookies(response, "localhost", "/", 10, "EL", "ELCookie");

%>
<h2>쿠키 읽기</h2>

<ul>
	<li>쿠키값 : ${cookie.EL.value }</li>
</ul>

<h2>헤더값</h2>
<ul>
	<li>host : ${header.host }</li>
	<li>user-agent : ${header["user-agent"] }</li> <!-- 특수문자는 [] array 로 처리! -->
	<li>cookie : ${header.cookie }</li>
</ul>

<h2>컨텍스트 변수</h2>
<ul>
	<li>web.xml 초기화 변수 : ${initParam.Driver }</li>
	<li>컨텍스트 루트 : ${pageContext.request.contextPath }</li>
</ul>
</body>
</html>