<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창 쿠키 처리 페이지</title>
</head>
<body>
<%
String popup_flag = request.getParameter("popup_flag");
if (popup_flag != null && popup_flag.equals("Y")) {
	Cookie cookie = new Cookie("popup_close", "off");
	cookie.setPath(request.getContextPath());
	cookie.setMaxAge(3600);
	response.addCookie(cookie);
	out.print("쿠키 : 창 열지 않기 설정");
	out.print("<script>console.log('쿠키 : 창 열지 않기 설정 " + popup_flag + "')</script>");
	
}


%>


<%
response.sendRedirect("cookie3.jsp");
%>
</body>
</html>