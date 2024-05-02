<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - param</title>
</head>
<body>

<h2>액션태그 - param - 포워드 페이지</h2>

<jsp:useBean id="person" class="common.Person" scope="request" />

<ul>
	<li>이름 : <jsp:getProperty name="person" property="name"/></li>
	<li>나이 : <jsp:getProperty name="person" property="age"/></li>
	<li>param1 : <%=request.getParameter("param1") %></li>
	<li>param2 : <%=request.getParameter("param2") %></li>
	<li>param3 : <%=request.getParameter("param3") %></li>
	
</ul>

<jsp:include page="inc/inc_param.jsp" > <!-- inc_param.jsp를 인클루드 한 후 그 결과를 다 param.jsp에 넘겨줌 -->
	<jsp:param name="param4" value="강호동"/>
	<jsp:param name="param5" value="50" />
</jsp:include>

<%--  이 페이지 내에 이렇게 작성해 준것과 똑같애.
<h2>액션태그 - 포워드 -> 인클루드</h2>
<%=request.getParameter("param4") %>
<%=request.getParameter("param5") %>
 --%>

<!-- "inc_param.jsp?param4=강호동&param3=40" 이렇게 날린것과 같음  -->

</body>
</html>