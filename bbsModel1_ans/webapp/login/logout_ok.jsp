<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
session.removeAttribute("UserId");
session.removeAttribute("UserName");
session.invalidate();
response.sendRedirect("/bbsModel1/bbs/list.jsp");
%>
