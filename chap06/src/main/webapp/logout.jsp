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

session.removeAttribute("UserId");
session.removeAttribute("UserName");
session.removeAttribute("UserPwd");

//session.invalidate(); 세션 몽창 날리기


response.sendRedirect("login.jsp");
%>
</body>
</html>