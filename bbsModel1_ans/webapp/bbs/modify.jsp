<%@page import="model1.bbs.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model1.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
BbsDAO dao = new BbsDAO(application);
int idx = Integer.parseInt(request.getParameter("idx"));
BbsDTO bbsView = dao.bbsView(idx);
dao.close();

int read_cnt = 0;
String user_id = "";
String reg_date = "";
String title = "";
String content = "";
if (bbsView!=null) {
	read_cnt = bbsView.getRead_cnt();
	user_id = bbsView.getUser_id();
	reg_date = bbsView.getReg_date().toString();
	title = bbsView.getTitle();
	content = bbsView.getContent();
	//content = (content!=null ? content.replace("\n\r", "<br>") : "");
	//content = (content!=null ? content.replace(" ", "&nbsp;") : "");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정 페이지</title>
<style>
table, tr, td {
	border:1px solid black;
}
table {
	width:60%;
}
</style>
</head>
<body>

<%@ include file="/common/common_top.jsp" %>
<%-- <jsp:include page="/common/common_top.jsp" /> --%>

<h2>게시판 수정 페이지</h2>

<form name="frmModify" id="frmModify" action="modify_ok.jsp" method="post">
<input type="hidden" name="idx" id="idx" value="<%=idx %>" />

<table>
<tr>
	<td width="200">작성자 : </td>
	<td width="600"><input type="text" name="user_id" id="user_id" value="test" readonly /></td>
</tr>
<tr>
	<td width="200">제목</td>
	<td><input type="text" name="title" id="title" value="<%=title %>" maxlength="100" style="width:600px"/></td>
</tr>
<tr>
	<td width="200">내용</td>
	<td>
		<textarea name="content" id="content" rows="10" wrap="hard" style="width:600px"><%=content %></textarea>
	</td>
</tr>
</table>

<table>
	<tr>
		<td>
			<input type="submit" name="btn_submit" id="btn_submit" value="글수정" />
			<input type="reset" name="btn_cancel" id="btn_cancel" value="취소" />
			<input type="button" name="btn_list" id="btn_list" value="이전페이지로" />
		</td>
	</tr>
</table>
</form>

<script>
document.querySelector("#btn_list").addEventListener("click", function(e){
	window.location.replace("list.jsp");
}, false);

document.querySelector("#frmModify").addEventListener("submit", function(e){
	e.preventDefault();
	e.stopPropagation();
	
	const title = document.querySelector("#title");
	if(title.value.lengt<1 || title.value == "" || title.value == null) {
		alert("제목을 입력하세요.");
		title.focus();
		return false;
	}
	const content = document.querySelector("#content");
	if(content.value.lengt<20 || content.value == "" || content.value == null) {
		alert("내용을 20자 이상 입력하세요.");
		content.focus();
		return false;
	}
	
	const frm = document.querySelector("#frmModify");
	//frm.action = "modify_ok.jsp";
	frm.submit();
	
	return;
}, false);


</script>
</body>
</html>