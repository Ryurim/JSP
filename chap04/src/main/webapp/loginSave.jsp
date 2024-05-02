<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%@ page import = "chap04.CookieUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String idVal = request.getParameter("id");
String checked = request.getParameter("check");

/* 원래 했던 방법
if (checked != null && checked.equals("Y")) {
	Cookie cookie = new Cookie("id", idVal);
	cookie.setPath(request.getContextPath());
	cookie.setMaxAge(5);
	response.addCookie(cookie);
	
	Cookie checkVal = new Cookie("check", checked);
	checkVal.setPath(request.getContextPath());
	checkVal.setMaxAge(5);
	response.addCookie(checkVal);
}
else {
	Cookie cookie = new Cookie("id", "");
	cookie.setPath(request.getContextPath());
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	
	Cookie checkVal = new Cookie("check", "");
	checkVal.setPath(request.getContextPath());
	checkVal.setMaxAge(0);
	response.addCookie(checkVal);
}
*/

//static 이라서 할당 안하고 바로 쓸 수 있는거야 CookieUtil cookie = new CookieUtil() 요런거 없이!
//자바 클래스 이용! 완전 깔끔한 코드,,
if (checked != null && checked.equals("Y")) {
	if(idVal != null && !idVal.isEmpty()) {
		CookieUtil.setCookies(response, "", "/", 5, "id", idVal);
		CookieUtil.setCookies(response, "", "/", 5, "check", checked);
	}
}
else {
	CookieUtil.setDeleteCookie(response, "", "/", 0, "id", "");
	CookieUtil.setDeleteCookie(response, "", "/", 0, "check", "");

}


response.sendRedirect("login.jsp");

%>
</body>
</html>