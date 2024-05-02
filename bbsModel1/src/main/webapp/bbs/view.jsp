<%@page import="model1.bbs.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.bbs.BbsDAO"%>
<%@page import="common.CommonUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
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
<h2>상세 페이지</h2>

<%

int idx = CommonUtil.parseInt(request.getParameter("idx"));
BbsDTO bbsView = new BbsDTO();


if (idx > 0) {
	BbsDAO dao = new BbsDAO(application);
	bbsView = dao.bbsView(idx);
	dao.close(); //여기서 안닫으면 BbsDAO에서 커넥션 맺은 후 거기에 일일히 다 쳐서 닫아야해. if(rs != null) rs.close() 이런거
}  else {
	out.println("<script>");
	out.println("alert('접근 정보가 올바르지 않습니다.')");
	out.println("window.location.replace('list.jsp')"); //히스토리가 남지 않게 하는 방법. null이 들어간게 보이지 않게 하는 방법임
	out.println("</script>");
}


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
	reg_date = (bbsView.getReg_date() != null ? bbsView.getReg_date().toString() : "");
	title = bbsView.getTitle();
	content = bbsView.getContent();
	content = (content != null ? content.replace("\r\n", "<br>") : "");
	content = (content != null ? content.replace(" ", "&nbsp;") : "");
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

<table>
	<tr>
		<td>번호 : <%=idx %></td>
		<td>작성자 : <%=user_id %></td>
		<td>조회수 : <%=read_cnt %></td>
		<td>작성일 : <%=reg_date %></td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="3"><%=title %></td>
	</tr>
	<tr>
		<td>글내용</td>
		<td colspan="3"><%=content %></td>
	</tr>


</table>

<table>
		<tr>
			<td>
			
				
				<input type="button" name="btn_modify" id="btn_modify" value="수정하기">
				<input type="button" name="btn_delete" id="btn_delete" value="삭제하기">
			
				<input type="button" name="btn_list" id="btn_list" value="이전 페이지로">
			</td>
			
		</tr>
</table>
</main>
<script>
document.querySelector("#btn_list").addEventListener("click", function(e) {
	
	window.location.href = "list.jsp";

}, false);

document.querySelector("#btn_delete").addEventListener("click", function(e) {
	
	<%if (session.getAttribute("UserId") == null) {%>
	alert("로그인 후 접근이 가능합니다.");
	window.location.href = "../login/login.jsp";
<%-- 	<%} else if (session.getAttribute("UserId").toString().equals(user_id)) {%> --%>
// 	alert("자신의 글만 삭제가 가능합니다.");
<%-- 	window.location.href = "view.jsp?idx=<%=idx %>"; --%>
	<%}else {%>
	let confirm_yn = confirm("현재 글을 삭제하시겠습니까?");
	if (confirm_yn) {
		window.location.href = "delete_ok.jsp?idx=<%=idx%>";	
	}
	<%}%>
}, false);

document.querySelector("#btn_modify").addEventListener("click", function(e) {
	<%if (session.getAttribute("UserId") == null) {%>
	alert("로그인 후 접근이 가능합니다.");
	window.location.href = "../login/login.jsp";
<%-- 	<%} else if (session.getAttribute("UserId").toString().equals(user_id)) {%> --%>
// 		alert("자신의 글만 수정이 가능합니다.");
<%-- 		window.location.href = "view.jsp?idx=<%=idx %>"; --%>
	<%} else {%>
	window.location.href = "modify.jsp?idx=<%=idx%>";
	<%}%>
	
	
}, false);



</script>


</body>
</html>