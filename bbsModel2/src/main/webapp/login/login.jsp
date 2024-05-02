<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<span style="color : red; font-size : 20px">
<c:choose>
	<c:when test="${not empty params.errMsg }">
		${params.errMsg }
	</c:when>
	<c:otherwise>
		
	</c:otherwise>
</c:choose>
</span>	
<h2>로그인</h2>
<form name="frmLogin" id="frmLogin" action="login_ok.do" method="post">
아이디 : <input type="text" name="id" id="id" value=""><br>
비밀번호 : <input type="password" name="pwd" id="pwd" value=""><br>
<input type="submit" value="로그인">
<input type="button" id="logOut" value="로그아웃">
</form>

<script>
const logOut = document.querySelector("#logOut");
logOut.addEventListener("click", (e) => {
	location.href="logout.do";
});



</script>

</body>
</html>