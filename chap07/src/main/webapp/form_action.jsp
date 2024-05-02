<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%
/*
Person p2 = (Person)request.getParameter("objPerson"); //형변환이 왜 안될까??
객체가 넘어갈 때 자바는 다 문자열로 인식함(String 으로 넘어감!)
그래서 String을 객체로 바꾸려고 하니까 오류가 나
직렬화 한 다음에 객체를 넘겨야 하는데 그건 뒤쪽에 Spring 가서 배울게
*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - 빈의 사용</title>
</head>
<body>
<h2>액션태그로 한 번에 받기</h2>
<jsp:useBean id="person" class="common.Person" />
<jsp:setProperty name="person" property="*" />

<ul>
	<li>이름 : <jsp:getProperty name="person" property="name" /></li>
	<li>나이 : <jsp:getProperty name="person" property="age" /></li>
</ul>

</body>
</html>