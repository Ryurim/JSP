<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<%

String param = "";
String referer = "";

/*
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie c : cookies) {
		if (c.getName().equals("param")) {
			param = c.getValue();
		}
		if (c.getName().equals("referer")) {
			referer = c.getValue();
		}
	}
}

out.print("param : " + param + ", referer : " + referer);
*/

List<String> par = (ArrayList<String>)request.getAttribute("pList");
List<String> ref = (ArrayList<String>)request.getAttribute("rList");

/*
Cookie[] cookies = request.getCookies();

if (cookies != null) {
	for (Cookie c : cookies) {
		if (c.getName().equals("param")) {
			param = c.getValue();
			par.add(param);
		}
		if (c.getName().equals("referer")) {
			referer = c.getValue();
			ref.add(referer);
		}
	}
}
*/
%>
<ul>
	<%
	if (par != null) {
	for (int i=0; i<par.size(); i++) {
		out.print("<li>param : " +  par.get(i) + "</li>");
		out.print("<li>referer : " + ref.get(i) + "</li>");
	}
	}
%>

</ul>


</body>
</html>