<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - 코어태그</title>
</head>
<body>
<h2>remove 태그</h2>

<c:set var="val" value="Page 영역" />
<c:set var="val" value="Request 영역" scope="request"/>
<c:set var="val" value="Session 영역" scope="session"/>
<c:set var="val" value="Application 영역" scope="application"/>

<h2>session 영역 값 삭제</h2>
<c:remove var="val" scope="session"/>

<ul>
	<li>val : ${val }</li>
	<li>pageScope.val : ${pageScope.val }</li>
	<li>sessionScope.val : ${sessionScope.val }</li>
	<li>requestScope.val : ${requestScope.val }</li>
	<li>applicationScope.val : ${applicationScope.val }</li>
</ul>

<c:remove var="val" />
<!-- scope 안주면 모든 영역 값이 한방에 다 지워져! -->
<ul>
	<li>val : ${val }</li>
	<li>pageScope.val : ${pageScope.val }</li>
	<li>sessionScope.val : ${sessionScope.val }</li>
	<li>requestScope.val : ${requestScope.val }</li>
	<li>applicationScope.val : ${applicationScope.val }</li>
</ul>
</body>
</html>