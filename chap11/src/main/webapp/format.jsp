<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - 코어태그</title>
</head>
<body>
<h2>Formatting 태그</h2>
<c:set var="num1" value="4444"/>
콤마 : <fmt:formatNumber value="${num1}"/><br>
콤마 X : <fmt:formatNumber value="${num1}" groupingUsed="false"/><br>

통화 : <fmt:formatNumber value="${num1}" type="currency" var="num2"/><br>
통화 : ${num2}<br>

<h2>날짜태그</h2>
<c:set var="today" value="<%=new Date() %>" />
전체 : <fmt:formatDate value="${today}" type="date" dateStyle="full" /><br>
short : <fmt:formatDate value="${today}" type="date" dateStyle="short" /><br>
long : <fmt:formatDate value="${today}" type="date" dateStyle="long" /><br>
default : <fmt:formatDate value="${today}" type="date" dateStyle="default" /><br>

<h2>시간 포맷</h2>
전체 : <fmt:formatDate value="${today}" type="time" dateStyle="full" /><br>
short : <fmt:formatDate value="${today}" type="time" dateStyle="short" /><br>
long : <fmt:formatDate value="${today}" type="time" dateStyle="long" /><br>
default : <fmt:formatDate value="${today}" type="time" dateStyle="default" /><br>

<h2>날짜/시간 포맷</h2>
전체 : <fmt:formatDate value="${today}" type="both" dateStyle="full" /><br>
패턴 : <fmt:formatDate value="${today}" type="both" pattern="yyy-MM-dd hh:mm:ss" dateStyle="short" /><br>
패턴 : <fmt:formatDate value="${today}" type="both" pattern="yyy-MM-dd HH:mm:ss" dateStyle="short" /><br>

<h2>타임존 설정</h2>
<fmt:timeZone value="GMT">
	<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/><br>
</fmt:timeZone>
<fmt:timeZone value="America/Chicago">
	<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/><br>
</fmt:timeZone>


</body>
</html>