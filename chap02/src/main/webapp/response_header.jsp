<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Collection" %>
<%
//응답헤더 값 처리
SimpleDateFormat sd = new SimpleDateFormat("yyyy-mm-dd HH:MM:SS");
long date_type = sd.parse(request.getParameter("date_type")).getTime();
int no_type = Integer.parseInt(request.getParameter("no_type"));
String text_type = request.getParameter("text_type");

//key-value 형태로 추가
response.addDateHeader("date_type", date_type);
response.addIntHeader("no_type", no_type);
response.addHeader("text_type", text_type);
//내가 바꿀수 있어!
response.setHeader("text_type", "스트링");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - response 응답헤더</title>
</head>
<body>

<h2>response - 응답헤더 출력</h2>
<ul>
<%
//map에서 key만 갖고올 때 getKeys..? 하는거랑 똑같애
Collection<String> headerNames = response.getHeaderNames();
for (String hName : headerNames) {
	String val = response.getHeader(hName);
%>
	<li><%=hName %> : <%=val %></li>
<%
}
%>
</ul>

<h2>response - 응답헤더 출력, 특정 헤더만 출력</h2>
<ul>
<%
Collection<String> no_header = response.getHeaders("no_type");
	for (String noType : no_header) {
		//이렇게 out 객체 이용해서 출력해도 돼.
		out.print("<li>no_header : " + noType + "</li><br>");
		
%>	
	<li>no_header : <%=noType %></li>
<%	
	}
%>
</ul>

</body>
</html>