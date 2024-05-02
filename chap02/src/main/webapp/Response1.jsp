<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - Response</title>
</head>
<body>
<%
String err = request.getParameter("loginErr");
String user_id = request.getParameter("user_id");
user_id = (user_id != null ? user_id : "");
String pwd = request.getParameter("pwd");
pwd = (pwd != null ? pwd : "");
if (err != null) {
	out.println("로그인 실패!<br>");
}
%>
	<h2>로그인</h2>
	<form name="frmLogin" id="frmLogin" action="login_ok.jsp" method="post">
		<label for="user_id">아이디 : </label><input type="text" name="user_id" id="user_id" value="<%=user_id %>" maxlength="20"><br>
		<label for="pwd">비밀번호 : </label><input type="password" name="pwd" id="pwd" value="<%=pwd %>" maxlength="20"><br>
		<input type="submit" value="로그인">
	</form>
	
	<br><hr><br>
	
	<h2>응답 헤더 설정</h2>
	<form name="frmHeader" id="frmHeader" action="response_header.jsp" method="get">
		<label for="date_type">날짜 형식 : </label><input type="text" name="date_type" id="date_type" value="2024-03-06 09:20:00"><br>
		<label for="no_type">숫자 : </label><input type="number" name="no_type" id="no_type" value="20000"><br>
		<label for="text_type">문자 : </label><input type="text" name="text_type" id="text_type" value="문자열"><br>
		<input type="submit" value="응답 헤더 설정">
		
	</form>
	
	
</body>
</html>