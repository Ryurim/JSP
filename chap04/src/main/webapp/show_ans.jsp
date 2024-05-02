<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%@ page import="chap04.CookieUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie c : cookies) {
		String cookieName = c.getName();
		String cookieVal = c.getValue();
		out.print(String.format("<li>쿠키이름 : %s => 쿠키값 : %s</li>" ,cookieName, cookieVal));
	}
}

out.print(CookieUtil.getCookieInfo(request, "paramInfo") + "<br>");

%>
</body>
</html>