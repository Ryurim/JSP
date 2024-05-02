<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL - 연산</title>
</head>
<body>

<%
int num1 = 1;
pageContext.setAttribute("num2", 2);
pageContext.setAttribute("num3", "3");
pageContext.setAttribute("num4", "8");
%>

<h2>EL - 변수 할당</h2>
스크립틀릿 변수 : ${num1 }<br>
page 영역 : num2 = ${num2 }, num3 = ${num3 }, num4 = ${num4 }<br>
변수 할당 후 바로 출력 : ${num1=10 }<br>
변수 할당 후 출력 안됨 : ${num2 = 8;'' } => ${num2 }<br>

num1 = ${num1 }, num2 = ${num2 }, num3 = ${num3 }, num4 = ${num4 }<br>

<h2>산술 연산</h2>
num1 + num2 : ${num1 + num2 }<br>
num1 - num2 : ${num1 - num2 }<br>
num3 * num4 : ${num3 * num4 }<br>
num4 / num2 : ${num4 / num2 }<br>
num3 div num4 : ${num3 div num4 }<br>
num3 % num4 : ${num3 % num4 }<br>
num3 mod num4 : ${num3 mod num4 }<br>

<h2>+연산</h2>
num1 + "34" : ${num1 + "34" }<br>
<%-- num1 + "이십" : ${num1 + "이십" }<br> --%>
<%-- "천" + "백" : ${"천" +"백" }<br> --%>
<!-- 다 오류! 숫자 연산만 가능함 -->


</body>
</html>