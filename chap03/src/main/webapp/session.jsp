<%@page import="common.Person"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>

<%
//2. 이렇게 최소화 해서 꼭 필요한 정보만 세션에 넣는것임
Person p = new Person("홍길동", 30);
session.setAttribute("person", p);

//key-value
session.setAttribute("name", "홍길동");
session.setAttribute("user_id", "test1");
session.setAttribute("email", "email@www.net");

//1. 사실 이렇게 덩어리 큰것들은 세션에 넣으면 안돼. 그냥 해보는 거야
ArrayList<String> lists = new ArrayList<String>();
lists.add("리스트1");
lists.add("컬렉션1");

session.setAttribute("lists", lists);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - session 영역</title>
</head>
<body>

<h2>세션 저장 페이지 이동 후 세션 조회</h2>

<a href="session2.jsp">세션 조회</a>
</body>
</html>