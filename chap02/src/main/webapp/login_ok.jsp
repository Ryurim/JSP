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
String user_id = request.getParameter("user_id");
String pwd = request.getParameter("pwd");

//나중에는 여기를 DB에서 갖고와서 비교하는거로 바꿀거야
if (user_id.equals("test1")) {
	response.sendRedirect("welcome.jsp?id=" + user_id);
} else {
	//화면을 바꿔주지만 url은 폼에서 전달한 페이지로 되어있음. 정보는 바뀌지 않음! 
	// Dispatcher가 화면만(내용만) 바꿔주고 url은 그대로 냅두는 역할을 함
	request.getRequestDispatcher("Response1.jsp?loginErr=1").forward(request, response);
}

%>
</body>
</html>