<%@page import="model1.bbs.BbsDTO"%>
<%@page import="model1.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String user_id = request.getParameter("user_id");
String title = request.getParameter("title");
String content = request.getParameter("content");

BbsDTO dto = new BbsDTO();
dto.setUser_id(user_id);
dto.setTitle(title);
dto.setContent(content);


BbsDAO dao = new BbsDAO(application);
int result = dao.bbsRegist(dto);
dao.close();

if (result > 0){
	response.sendRedirect("list.jsp");
} else {
	out.println("<script>");
	out.println("alert('글등록시 에러가 발생하였습니다.');");
	out.println("window.location.replace('list.jsp');");
	out.println("</script>");
}
%>