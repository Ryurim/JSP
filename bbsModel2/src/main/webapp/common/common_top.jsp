<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TOP 공통 메뉴</title>
<style>
table, tr, td {
	border:0px solid black;
}
table {
	width:90%;
	text-align:center;
}
</style>
</head>
<body>
<%
final String __BASE_URL = "/bbsModel1";
String __SESSION_USER_ID = (session.getAttribute("UserId")!=null? session.getAttribute("UserId").toString():"");
final boolean __LOGIN_FLAG = (__SESSION_USER_ID!=null && !__SESSION_USER_ID.isEmpty());
%>
<table>
	<tr>
		<td></td>
		<td width="80">
			<%if (!__LOGIN_FLAG) {%>
			<input type="button" name="btn_login" id="btn_login" value="로그인" />
			<%} else { %>
			<input type="button" name="btn_logout" id="btn_logout" value="로그아웃" />
			<%} %>
		</td>
		<td></td>
	</tr>
</table>

<script>
const btnLogin = document.querySelector("#btn_login");
if (btnLogin != null){
	document.querySelector("#btn_login").addEventListener("click", function(e){
		location.href="/bbsModel2/login/login.jsp";
	}, false);
}
const btnLogOut = document.querySelector("#btn_logout");
if (btnLogOut != null){
	document.querySelector("#btn_logout").addEventListener("click", function(e){
		location.href="/bbsModel2/login/logout_ok.jsp";
	}, false);
}

</script>
</body>
</html>