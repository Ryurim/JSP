<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - 코어태그</title>
</head>
<body>
<h2>url 태그</h2>
<%
String url = "http://localhost:8080/chap10/form.jsp?param1=문자열1&param2=문자열2";
%>

<c:url value="../chap10/form.jsp" var="url" >
	<c:param name="param1" value="문자열1"/>
	<c:param name="param2" value="문자열2"/>
</c:url>

<a href="${url}">이전 장으로</a><br>
<a href="<%=url%>">이전 장으로</a>

</body>
</html>
<!-- value="http://localhost:8080
/chap10/form.jsp" 해도 돼 -->