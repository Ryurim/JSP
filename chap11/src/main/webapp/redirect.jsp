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

<h2>Redirect 전송 페이지</h2>
<c:set var="reqVal" value="전송문자열" scope="session"/>
<c:redirect url="redirect2.jsp">
	<c:param name="param1" value="문자열1"/>
	<c:param name="param2" value="문자열2"/>
</c:redirect>

<script>
window.location.replace("redirect2.jsp");
//동일하게 동작!
// 자바 코드가 들어가있거나, 스크립트 코드가 들어있거나 하면 모두 html 파일이 아님
// script는 html 상에서 동작하는 애고, 위에거는 html 아니라서 위에거 먼저 해석하고 나서 html 파일을 만드는데 위에 코드가
// 제어권을 redirect2.html 에 이미 넘겼기 때문에 script코드는 써지지도 않아
</script>
</body>
</html>