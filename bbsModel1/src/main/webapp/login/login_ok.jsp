<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
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
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

MemberDAO dao = new MemberDAO(application);

MemberDTO dto = dao.getMemberInfo(id, pwd);
dao.close();

if (dto != null && dto.getMemberId() != null) {
	session.setAttribute("UserId", dto.getMemberId());
	session.setAttribute("UserName", dto.getName());
	session.setAttribute("UserPwd", dto.getPwd());
	response.sendRedirect("../bbs/list.jsp");
}
else {
	request.setAttribute("errMsg", "로그인 오류");
	request.getRequestDispatcher("login.jsp").forward(request, response);
}

%>
</body>
</html>