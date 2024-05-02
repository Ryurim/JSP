<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<%
if (request.getAttribute("errMsg") != null) {
%>
<span style="color : red; font-size : 20px">
<%=request.getAttribute("errMsg") == null ? "" : request.getAttribute("errMsg") %><br><br>
</span>	
<%
}
%>
<h2>로그인</h2>
<form name="frmLogin" id="frmLogin" action="login_ok.jsp" method="post">
아이디 : <input type="text" name="id" id="id" value=""><br>
비밀번호 : <input type="password" name="pwd" id="pwd" value=""><br>
<input type="submit" value="로그인">
<input type="button" id="logOut" value="로그아웃">
</form>

<script>
const logOut = document.querySelector("#logOut");
logOut.addEventListener("click", (e) => {
	location.href="logout.jsp";
});



</script>

</body>
</html>