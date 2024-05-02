<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<h2>Redirect 수신 페이지</h2>
<ul>
	<li>저장된 값 : ${reqVal }</li>
	<li>매개변수1 : ${param.param1 }</li>
	<li>매개변수2 : ${param.param2 }</li>
</ul>