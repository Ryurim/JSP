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
String params = request.getParameter("param");
String ref = request.getParameter("referer");
String refCookie = String.format("%s?params=%s", ref, params);

String prevCookieInfo = CookieUtil.getCookieInfo(request, "refCookie");

StringBuilder sb = new StringBuilder();

if (prevCookieInfo != null & !prevCookieInfo.isEmpty()) {
	sb.append(prevCookieInfo);
}

if (refCookie != null && !refCookie.isEmpty()) {
	if (sb != null) {
		sb.append("&&");
	}
	sb.append(refCookie);
}

CookieUtil.setCookies(response, "", "/", 3600, "paramInfo", params);
CookieUtil.setCookies(response, "", "/", 3600, "refInfo", ref);
CookieUtil.setCookies(response, "", "/", 3600, "refCookie", refCookie);
CookieUtil.setCookies(response, "", "/", 3600, "prevCookieInfo", sb.toString());

response.sendRedirect("show_ans.jsp");
%>
</body>
</html>