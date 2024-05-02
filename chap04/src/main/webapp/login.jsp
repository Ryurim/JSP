<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%@ page import = "chap04.CookieUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 아이디 저장</title>
</head>
<body>
<%
String idVal = "";
String checkVal = "";
/*
Cookie[] cookies = request.getCookies();

String cookieName = "";
String cookieVal = "";

if (cookies != null) {
	cookieName = "";
	cookieVal = "";
	for (Cookie c : cookies) {
		cookieName = c.getName();
		cookieVal = c.getValue();
		if (cookieName.equals("id")) {
			idVal = cookieVal;
		}
		if (cookieName.equals("check")) {
			checkVal = cookieVal;	
		}
	}
}
*/
idVal = CookieUtil.getCookieInfo(request, "id");
checkVal = CookieUtil.getCookieInfo(request, "check");

%>

	<form action="loginSave.jsp">
		<label for="id">아이디 : </label>
		<input type="text" id="id" name="id" value="<%=idVal%>"><br>
		<label for="pwd">비밀번호 : </label>
		<input type="password" id="pwd" name="pwd" value=""><br>
		<input type="submit" value="로그인">
		<input type="checkbox" id="check" name="check" value="Y" <%=(checkVal.equals("Y"))? "checked" : "" %>>아이디저장하기
	</form>
<%

%>



</body>
</html>