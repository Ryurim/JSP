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
<h2>OUT 태그</h2>
<c:set var="txt">
	<span style="color:red;">문자열을 출력해 주세요.</span>
</c:set>

<h2>출력 문자</h2>
<c:out value="${txt}" escapeXml="false"/>
<!-- escapeXml : true -> 마크업이 있으면 마크업 그대로 출력해주는거. false 면 마크업 활성화됨 -->


<h2>예외처리</h2>
<%
int num1 = 100;
%>
<c:catch var="eMsg">
<%
	int result = num1/0;
%>
</c:catch>
예외 : ${eMsg}

<%
try {
	int result = num1/0;
} catch (Exception e) {
	out.println(e.getMessage());
	e.printStackTrace();
}

%>
</body>
</html>