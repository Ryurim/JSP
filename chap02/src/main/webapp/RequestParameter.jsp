<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request</title>
</head>
<body>
	<h2>내장객체 - request</h2>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	String date = request.getParameter("birth");
	String favorite[] = request.getParameterValues("favo");
	String introduce = request.getParameter("text").replace("\r\n", "<br>").replace(" ", "&nbsp;");
	
	String favoVal = "";
	
	for (int i=0; i<favorite.length; i++) {
		favoVal += favorite[i] + ", ";
	}
	favoVal = favoVal.substring(0, favoVal.length()-2);
	
	
	%>
	
	<ul>
		<li>아이디 : <%=id %></li>
		<li>비밀번호 : <%=pwd %></li>
		<li>이름 : <%=name %></li>
		<li>성별 : <%=sex %></li>
		<li>생일 : <%=date %></li>
		<li>관심사항 : <%=favoVal %></li>
		<li>자기소개 : <%=introduce %></li>
	</ul>
</body>
</html>