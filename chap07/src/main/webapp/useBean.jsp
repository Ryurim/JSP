<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - UseBean</title>
</head>
<body>

<h2>액션 태그 - UseBean</h2>
<jsp:useBean id="person" class="common.Person" scope="request"/>	<!-- common.Person person = new common.Person(); -->

<h3>빈의 필드값 설정</h3>
<jsp:setProperty name="person" property="name" value="홍길동"/> <!-- person.name = "홍길동" -->
<jsp:setProperty name="person" property="age" value="20" />	<!-- person.age = 20 -->

<h3>빈의 필드값 읽기</h3>
<ul>
	<li>이름 : <jsp:getProperty name="person" property="name" /></li>
	<li>나이 : <jsp:getProperty name="person" property="age" /></li>
</ul>

<h2>Person 자바 객체 직접 생성하여 person2에 할당</h2>
<%
Person person2 = new Person();
person2.setName("김철수");
person2.setAge(17);
//out.print(String.format("이름 : %s, 나이 : %d", person2.getName(), person2.getAge()));
%>
<ul>
	<li>이름 : <%=person2.getName() %></li>
	<li>나이 : <%=person2.getAge() %></li>
</ul>

</body>
</html>