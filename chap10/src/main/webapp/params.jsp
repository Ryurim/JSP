<%@page import="member.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL - 전송을 통한 객체 전달</title>
</head>
<body>

<%
request.setAttribute("person", new Person("홍길동", 20, "남자")); //객체 생성과 동시에 초기화
request.setAttribute("str","문자열");
request.setAttribute("intNo", new Integer(100));
%>

<jsp:forward page="paramsF.jsp">
	<jsp:param value="10" name="num1"/>
	<jsp:param value="50" name="num2"/>
</jsp:forward>


</body>
</html>