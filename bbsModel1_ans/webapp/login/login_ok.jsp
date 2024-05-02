<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

out.println(String.format("아이디 : %s, 비밀번호 : %s", id, pwd));

String driver = application.getInitParameter("Driver");
String url = application.getInitParameter("URL");
String dbId = application.getInitParameter("dbId");
String dbPwd = application.getInitParameter("dbPwd");

MemberDAO dao = new MemberDAO(driver, url, dbId, dbPwd);
MemberDTO dto = dao.getMemberInfo(id, pwd);
dao.close();

if (dto != null && dto.getMemberId() != null ){
	session.setAttribute("UserId", dto.getMemberId());
	session.setAttribute("UserName", dto.getName());
	response.sendRedirect("/bbsModel1/bbs/list.jsp");
} else {
	request.setAttribute("errMsg", "로그인 오류");
	request.getRequestDispatcher("login.jsp").forward(request, response);
}


%>
