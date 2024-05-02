<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL - 내장객체 사용법</title>
</head>
<body>
<%
pageContext.setAttribute("scope", "PAGE영역");
request.setAttribute("scope", "REQUETS영역");
session.setAttribute("scope", "SESSION영역");
application.setAttribute("scope", "APPLICATION영역");
%>

<h2>EL 페이지</h2>
<ul>
	<li>page 영역 : ${pageScope.scope }</li>
	<li>request 영역 : ${requestScope.scope }</li>
	<li>session 영역 : ${sessionScope.scope }</li>
	<li>application 영역 : ${applicationScope.scope }</li>
	<li>영역 지정 안함 : ${scope }</li> <!-- page 영역 변수로 나옴! -->
</ul>
<br><hr><br>
<jsp:forward page="el1.jsp" />

</body>
</html>