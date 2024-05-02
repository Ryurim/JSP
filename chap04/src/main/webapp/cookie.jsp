<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 설정</title>
</head>
<body>
<h2>쿠키 사용하기</h2>

<%!
public void setCookie(String name, String val, String path, int expire_date, String domain, HttpServletRequest req, HttpServletResponse resp) {
	Cookie cookie = new Cookie(name, val);
	cookie.setPath((!path.isEmpty())? path : req.getContextPath()); //컨텍스트 루트 --> 페이지의 루트 도메인 cookie.setPath("/"); 와 같음
	cookie.setMaxAge((expire_date > 0) ? expire_date : 0); //살아있는 시간은 초단위로 저장
	cookie.setDomain((!domain.isEmpty())? domain : "");
	resp.addCookie(cookie);
} // 이렇게 많이 작성함
%>
<h3>1. 쿠키 저장</h3>
<%
Cookie cookie = new Cookie("myCookie", "쿠키값1");
cookie.setPath(request.getContextPath()); //컨텍스트 루트 --> 페이지의 루트 도메인 cookie.setPath("/"); 와 같음
cookie.setMaxAge(3600); //살아있는 시간은 초단위로 저장
response.addCookie(cookie);
//setCookie("myCookie", "쿠키값1", "/", 3600, "", request, response);
%>
<h3>2. 쿠키 조회</h3>
<%
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie c : cookies) {
		String cookieName = c.getName();
		String cookieVal = c.getValue();
		out.print(String.format("%s : %s<br>", cookieName, cookieVal));
	}
}
%>


<a href="cookie2.jsp">다른 페이지에서 쿠키 조회하기</a> <!-- 똑같은 쿠키 넘어감 -->


</body>
</html>