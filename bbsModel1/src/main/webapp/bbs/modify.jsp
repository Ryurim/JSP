<%@page import="model1.bbs.BbsDTO"%>
<%@page import="model1.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {
		padding: 0;
		margin: 0;
	}
	h2 {
		text-align : center;
		
	}
	main {
		width: 1000px;
		margin: 0 auto;
	}
	table, tr, td, th {
		border : 1px solid black;
		text-align : center;
	}
	table {
		width : 100%;
	}
	#paging {
		
		text-align : center;
	}
	td.logIn, td.btn_regist{
		text-align: right;
	}
</style>
</head>
<body>
<main>
<%
if (session.getAttribute("UserId") == null) {
	out.println("<script>");
	out.println("alert('로그인 후 접근이 가능합니다.')");
	out.println("window.location.replace('../login/login.jsp')");
	out.println("</script>");
}
%>
<h2>글 수정 페이지</h2>

<%
BbsDAO dao = new BbsDAO(application);
int idx = Integer.parseInt(request.getParameter("idx"));
BbsDTO bbsView = dao.bbsView(idx);
dao.close(); //여기서 안닫으면 BbsDAO에서 커넥션 맺은 후 거기에 일일히 다 쳐서 닫아야해. if(rs != null) rs.close() 이런거
%>

<%
int read_cnt = 0;
String user_id = "";
String reg_date = "";
String title = "";
String content = "";
if (bbsView != null) {
	read_cnt = bbsView.getRead_cnt();
	user_id = bbsView.getUser_id();
	reg_date = bbsView.getReg_date().toString();
	title = bbsView.getTitle();
	content = bbsView.getContent();
	content = (content != null ? content.replace("<br>", "\r\n") : "");
	content = (content != null ? content.replace("&nbsp;", " ") : "");
}
%>
<%if (session.getAttribute("UserId") == null) { %>
<form name="frmLogin" id="frmLogin" method="get">
<table>
	<tr>
		<td><a href="../login/login.jsp"><input type="button" id="logIn" name="logIn" value="로그인"></a></td>
		
	</tr>
</table>
</form>
<%} else {%>
<form name="frmLogin" id="frmLogin" method="get">
	<table>
		<tr>
			<td><a href="../login/logout.jsp"><input type="button" id="logIn" name="logIn" value="로그아웃"></a></td>
		</tr>
	</table>
</form>
<%} %>
<form name="frmModify" id="frmModify" action = "modify_ok.jsp" method="post">
<input type="hidden" name="idx" id="idx" value="<%=idx %>">
	<table>
		<tr>
			<td width="200">작성자 : </td>
			<td width="600"><input type="text" name="user_id" id="user_id" value="<%=user_id %>" readonly /> </td>
		</tr>
		<tr>
			<td width="200">제목</td>
			<td><input type="text" name="title" id="title" value="<%=title %>" maxlength="100" style="width:600px"/></td>
		</tr>
		<tr>
			<td width="200">글내용</td>
			<td>
				<textarea name="content" id="content" rows="10" cols="80" wrap="hard" style="width:600px"><%=content %></textarea>
			</td>
		</tr>
	
	</table>
	<table>
		<tr>
			<td>
				<input type="submit" name="btn_submit" id="btn_submit" value="글수정">
				<input type="reset" name="btn_cancel" id="btn_cancel" value="취소">
				<input type="button" name="btn_list" id="btn_list" value="이전 페이지로">
			</td>
			
		</tr>
	</table>
</form>
</main>
<script>
document.querySelector("#btn_list").addEventListener("click", function(e) {
	window.location.href = "list.jsp";
}, false);

document.querySelector("#frmModify").addEventListener("submit", function(e) {

	
	const title = document.querySelector("#title");
	const content = document.querySelector("#content");
	
	if (title.value.length == 0 || title.value.trim().length == 0) {
		alert("제목을 입력하세요.");
		title.focus();
		e.preventDefault();
		return false;
	}
	if (content.value.length == 0 || content.value.trim().length == 0) {
		alert("내용을 입력하세요.");
		content.focus();
		e.preventDefault();
		return false;
	}
	

}, false);



</script>
</body>
</html>