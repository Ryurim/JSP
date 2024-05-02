<%@page import="member.Person"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - core 태그</title>
</head>
<body>

<h2>JSTL - c:set 태그</h2>
<c:set var="var1" value="100"/>
<c:set var="var2" value="${var1 mod 5 }"/>
<c:set var="var3" value="<%=new Date() %>"/>
<c:set var="var4">값4</c:set>

<h2>JSTL - c:set 태그 출력</h2>
<ul>
	<li>var1 : ${pageScope.var1 }</li>
	<li>var2 : ${var2 }</li>
	<li>var3 : ${var3 }</li>
	<li>var4 : ${var4 }</li>
<%-- 	<li>var4 : <%=pageScopoe.var4 %></li> 오류 발생!--%>
	<li>var4 : <%=pageContext.getAttribute("var4") %>
</ul>

<h2>자바빈즈 이용</h2>
<c:set var="person" value='<%= new Person("홍길동", 20) %>' scope = "request" />
<ul>
	<!-- 반드시 스코프 주어지고 나서 시작하기! -->
	<!-- 스코프를 지정했으면 그 스코프를 이용해서 값 가져오기 -->
	<li>이름 : ${requestScope.person.name}</li>
	<li>나이 : ${requestScope.person.age }</li>
	<li>이름 : ${requestScope.person.getName()}</li>
	<li>나이 : ${requestScope.person.getAge() }</li>
	
	<!-- 같은 페이지라서 그 안에서 page -> request -> session -> application 순으로 찾아서 보여줘 -->
	<li>이름 : ${person.getName()}</li>
	<li>나이 : ${person.getAge() }</li>
</ul>

</body>
</html>