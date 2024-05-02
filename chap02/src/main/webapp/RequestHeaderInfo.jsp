<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%@ page import="java.util.Enumeration" %> <!-- 순서 지키기! import는 밑에 있어야해 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request</title>
</head>
<body>
	<h2>내장객체 - 요청 헤더 정보 출력</h2>
	<%
	Enumeration headers = request.getHeaderNames();
	while(headers.hasMoreElements()) {
		String headerName = (String)headers.nextElement();
		String headerValue = request.getHeader(headerName);
		out.print("헤더명 : " + headerName + ", 헤더값 : " + headerValue + "<br>");
	}
	%>
</body>
</html>