<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>

<%
request.setAttribute("reqStr1", "request 영역 문자열");
request.setAttribute("reqPerson", new Person("홍길동", 21));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - request 영역</title>
</head>
<body>

<h2>request 영역 속성값 조회</h2>
<%
//String이니까 그대로 출력
out.print("reqStr1 : " + request.getAttribute("reqStr1") + "<br>");
//Person 객체는 좀 달라. 캐스팅 필요
Person reqPerson = (Person)request.getAttribute("reqPerson");
out.print("reqPerson : " + reqPerson.getName() + ", " + reqPerson.getAge());
%>

<br><hr><br>

<h2>request 영역 속성값 제거</h2>
<%
request.removeAttribute("reqStr1");
request.removeAttribute("reqPerson");

out.print("reqStr1 : " + request.getAttribute("reqStr1") + "<br>");
Person reqPerson2 = (Person)request.getAttribute("reqPerson");

//이때는 null 처리를 해줘야함. 객체이기 때문에 참조하려고 하는데 null 이면 오류발생
if (reqPerson2 != null) {
	out.print("reqPerson : " + reqPerson2.getName() + ", " + reqPerson2.getAge());
}
%>

<br><hr><br>

<h2>request forward 후 속성값 조회</h2>
<%
//url은 안바뀌고 화면만 바뀜
//주석처리 하고 안하고 하면서 보면 페이지의 화면이 달라져.

request.getRequestDispatcher("request_forward.jsp?name=홍길동&ename=HONGGILDONG&age=30").forward(request, response);
//같은 표현식! 디스패쳐는 경로를 이동시키는 역할. 스프링, 스프링부트에서 계속 나올거야
//RequestDispatcher rd = request.getRequestDispatcher("request_foward.jsp?name=혿길동&name=HONGGILDONG&age=30");
//rd.forward(request, response);
%>
<!-- 
<form action="modify.jsp?변수1&변수2&변수3" method="post">
변수1, 2, 3은 get 방식으로 넘어가고

인풋 1, 2, 3은 post 방식으로 넘어가. 왜? 어떻게? 6장에서 배울겡
인풋1
인풋2
인풋3
</form>
 -->
</body>
</html>