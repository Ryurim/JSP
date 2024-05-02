<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<%
SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
long createTime = session.getCreationTime();
String strCreateTime = dateFormat.format(new Date(createTime));
long lastAccTime = session.getLastAccessedTime();
String strLastAccTime = dateFormat.format(new Date(lastAccTime));

%>
<h2>로그인</h2>

<form name="frmLogin" id="frmLogin" action="login_ok.jsp" method="post">
<table>
<tr>
	<td style="width:100px; text-align:right;">아이디</td>
	<td style="width:200px;"><input type="text" name="id" id="id" value="" maxlength="20" /></td>
</tr>
<tr>
	<td style="width:100px; text-align:right;">비밀번호</td>
	<td><input type="password" name="pwd" id="pwd" value="" maxlength="20"/></td>
</tr>
<tr>
	<td height="40" colspan="2" style="text-align:center;">
		<input type="submit" name="btn_submit" id="btn_submit" value="로그인" />
		<input type="button" name="logout_ok" id="logout_ok" value="로그아웃" />
	</td>
</tr>
</table>
</form>

<script>

document.querySelector("#frmLogin").addEventListener("submit", function(e){
	e.preventDefault();
	e.stopPropagation();
	
	const id = document.querySelector("#id");
	if(id.value.lengt<1 || id.value == "" || id.value == null) {
		alert("아이디를 입력하세요.");
		id.focus();
		return false;
	}
	const pwd = document.querySelector("#pwd");
	if(pwd.value.lengt<20 || pwd.value == "" || pwd.value == null) {
		alert("비밀번호를 입력하세요.");
		pwd.focus();
		return false;
	}
	
	const frm = document.querySelector("#frmLogin");
	//frm.action = "login_ok.jsp";
	frm.submit();
	
	return;
}, false);

document.querySelector("#logout_ok").addEventListener("click", function(e){
	location.href = "logout_ok.jsp";	
}, false);
</script>
</body>
</html>