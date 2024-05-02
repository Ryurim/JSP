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
request.setCharacterEncoding("UTF-8"); //지시어에 charset 해도 깨질 때 헤더?에 이거 넣어줘
%>


	<h3>클라이언트/서버 환경정보 조회</h3>
	<ul>
		<li>데이터 전송 방식 : <%=request.getMethod() %></li>
		<li>URL : <%=request.getRequestURL() %></li>
		<li>URI : <%=request.getRequestURI() %></li>
		<li>프로토콜 : <%=request.getProtocol() %></li>
		<li>서버이름 : <%=request.getServerName() %></li>
		<li>서버포트 : <%=request.getServerPort() %></li>
		<li>클라이언트IP : <%=request.getRemoteAddr() %></li>
		<li>쿼리스트링 : <%=request.getQueryString() %></li>
		<li>전송파라미터1 : <%=request.getParameter("param1") %></li>
		<li>전송파라미터2 : <%=request.getParameter("param2") %></li>
	</ul>
	
</body>
</html>