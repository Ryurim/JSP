<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");

long createTime = session.getCreationTime(); //생성 시간 가져오기. 새로고침 해도 고정값
String strCreateTime = dateFormat.format(new Date(createTime)); // 서버의 생성시간을 자바시간으로 포맷팅해서 리턴하겠다

long lastAccTime = session.getLastAccessedTime(); //새로고침 하면 바뀜
String strLastAccTime = dateFormat.format(new Date(lastAccTime));

%>
<h2>세션 정보</h2>
세션 유지 시간 : <%=session.getMaxInactiveInterval() %><br>
세션 아이디 : <%=session.getId() %><br>
최초 요청 시간 : <%=strCreateTime %><br>
마지막 요청 시간 : <%=strLastAccTime %><br>
아이디 : <%=session.getAttribute("UserId") %><br>
이름 : <%=session.getAttribute("UserName") %><br>
비밀번호 : <%=session.getAttribute("UserPwd") %><br>

<br><hr><br>

<h2>로그인</h2>
<%
if (request.getAttribute("errMsg") != null) {
%>
<span style="color:red; font-weight:bold; font-size:20px">
<%=request.getAttribute("errMsg") == null ? "" : request.getAttribute("errMsg")%><br><br>
</span>
<%
}
%>


<form name="frmLogin" id="frmLogin" action="login_ok.jsp" method="post">
아이디 : <input type="text" name="id" id="id" value="" maxlength="20"><br>
비밀번호 : <input type="password" name="pwd" id="pwd" value="" maxlength="20"><br>
<input type="submit" value="로그인">
<input type="button" id="logOut" value="로그아웃">
</form>


<script>
let logOut = document.querySelector("#logOut");
logOut.addEventListener("click", (e) => {
	
	location.href = "logout.jsp";
	// 이런거 첨 봤는데! location.href("logout.jsp"); 로 냅다 하니까 진짜 안되더라,,

}, false);
</script>

</body>
</html>