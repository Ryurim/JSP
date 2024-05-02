<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - 동작방식</title>
</head>
<body>
<%
//파일경로
String incDirective = "./inc/inc_directive.jsp";
String incAction = "./inc/inc_action.jsp";

pageContext.setAttribute("pageAttr", "화요일");
request.setAttribute("reqAttr", "불금");
%>

<h2>액션태그 - 지시어</h2>
<%@ include file="inc/inc_directive.jsp" %>
<p>지시어 페이지에서 선언된 변수 : <%=today %></p>


<h2>액션태그 - 인클루드</h2>
<jsp:include page="inc/inc_action.jsp" />
<%--<jsp:include page="<%=incAction %>" />--%>

<p>액션 페이지에서 선언된 변수 : </p>

</body>
</html>