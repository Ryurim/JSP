<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL - 내장 객체 연습</title>
</head>
<body>

<h2>액션태그 forward 페이지</h2>
<h3>영역별 속성값 읽기</h3>
<ul>
	<li>page 영역 : ${pageScope.scope }</li>
	<li>request 영역 : ${requestScope.scope }</li>
	<li>session 영역 : ${sessionScope.scope }</li>
	<li>application 영역 : ${applicationScope.scope }</li>
	<li>영역 지정 안함 : ${scope }</li>
</ul>
</body>
</html>