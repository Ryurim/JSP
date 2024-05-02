<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="member.Person"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - 코어 태그</title>
</head>
<body>

<h2>forEach 태그</h2>
<c:forEach var="i" begin="1" end="10" step="1">
	<p>${i}번째 입니다.</p>
</c:forEach>
<%
for(int i=0; i<10; i++) {
	out.print(String.format("%d번째 입니다<br>", i));
}
//똑같애,, 이게 더 편한데,,
%>

<h2>varStatus 상태</h2>
<c:forEach var="i" begin="1" end="10" step="1" varStatus="Loop">
	count : ${Loop.count}, 
	index : ${Loop.index},
	current : ${Loop.current},
	first : ${Loop.first},
	last : ${Loop.last}<br>
	<!-- 커서 : 데이터베이스나 자료구조에서 현재 자료를 처리하고 있는 한 줄이 끝났을 때 그때 포인터의 위치가 커서 -->
</c:forEach>

<h2>향상된 for문</h2>
<%
String[] arrColor = {"빨강", "노랑" ,"파랑", "보라"};
%>
<c:forEach var="color" items="<%=arrColor %>">
	<span>${color}</span>&nbsp;
</c:forEach>

<h2>List 컬렉션</h2>
<%
LinkedList<Person> list = new LinkedList<Person>();
list.add(new Person("홍길동", 20));
list.add(new Person("임꺽정", 40));
%>
<c:set var="list" value="<%=list %>"/>
<c:forEach var="item" items="${list}">
	이름 : ${item.name}, 나이 : ${item.age}<br>
</c:forEach>


<h2>Map 컬렉션</h2>
<%
Map<String, Person> map = new HashMap<String, Person>();
map.put("1", new Person("홍길동", 20));
map.put("2", new Person("임꺽정", 40));
%>
<c:set var="map" value="<%=map %>"/>
<c:forEach var="item" items="${map}">
	KEY => ${item.key},
	이름 : ${item.value.name}, 나이 : ${item.value.age}
</c:forEach>


<h2>forToken</h2> <!-- 구분자. sql 에서는 delimiter -->
<%
String color ="Red,Blue,Yellow,Green";
%>
<c:forTokens var="color" items="<%=color %>" delims=",">
	<span style="color:${color};">${color}</span><br>
</c:forTokens>






</body>
</html>
