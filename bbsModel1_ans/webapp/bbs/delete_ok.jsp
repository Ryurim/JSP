<%@page import="model1.bbs.BbsDTO"%>
<%@page import="model1.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
int idx = Integer.parseInt(request.getParameter("idx"));

BbsDAO dao = new BbsDAO(application);
int result = dao.bbsDelete(idx);
dao.close();

if (result > 0){
	response.sendRedirect("list.jsp");
} else {
	out.println("<script>");
	out.println("alert('글 삭제시 에러가 발생하였습니다.');");
	out.println("window.location.replace('list.jsp');");
	out.println("</script>");
}
%>