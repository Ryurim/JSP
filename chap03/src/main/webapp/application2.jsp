<%@page import="java.util.Set"%>
<%@page import="common.Person"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - application 영역</title>
</head>
<body>

<h2>application 조회</h2>
<%
Map<String, Person> map = (Map<String, Person>)application.getAttribute("map");

Set<String> keys = map.keySet(); //map의 key들을 다 가져와

for (String key : keys) {
	Person person = map.get(key); //객체 할당
	out.print(String.format("이름 : %s, 나이 : %d<br>", person.getName(), person.getAge())); //객체 접근
}
//게시판에서 글쓰기 하고, 조회, 보기 클릭 했을 때 object 모델에 글 내용을 담아서 jsp에 던져 그거 가져올 때 하는거야.
%>

</body>
</html>