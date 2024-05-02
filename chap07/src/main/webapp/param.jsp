<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - 파라미터 전달</title>
</head>
<body>
<%
int age = 40;
%>
<h2>액션태그 - param</h2>
<jsp:useBean id="person" class="common.Person" scope="request" />
<jsp:setProperty name="person" property="name" value="홍길동" />
<jsp:setProperty name="person" property="age" value="20" />

<jsp:forward page="param_forward.jsp?param1=유재석" > <!-- 제어권은 param.jsp가 갖고있음 -->
	<jsp:param name="param2" value="서울" />
	<jsp:param name="param3" value="<%=age %>" />
</jsp:forward>

</body>
</html>