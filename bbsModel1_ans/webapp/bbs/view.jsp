<%@page import="common.CommonUtil"%>
<%@page import="model1.bbs.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model1.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세정보 조회 페이지</title>
<style>
table, tr, td {
	border:1px solid black;
}
table {
	width:90%;
}
</style>
</head>
<body>

<%@ include file="/common/common_top.jsp" %>
<%-- <jsp:include page="/common/common_top.jsp" /> --%>

<h2>게시판 목록</h2>

<%
int idx = CommonUtil.parseInt(request.getParameter("idx"));
BbsDTO bbsView = new BbsDTO();

if ( idx > 0 ) {
	BbsDAO dao = new BbsDAO(application);
	bbsView = dao.bbsView(idx);
	dao.close();
}else {
	out.println("<script>");
	out.println("alert('접근 경로가 올바르지 않습니다.');");
	out.println("window.location.replace('list.jsp');");
	out.println("</script>");
}

int read_cnt = 0;
String user_id = "";
String reg_date = "";
String title = "";
String content = "";
if (bbsView != null) {
	read_cnt = bbsView.getRead_cnt();
	user_id = bbsView.getUser_id();
	reg_date = (bbsView.getReg_date()!=null ? bbsView.getReg_date().toString() : "");
	title = bbsView.getTitle();
	content = bbsView.getContent();
	content = (content!=null ? content.replace("\n\r", "<br>") : "");
	content = (content!=null ? content.replace(" ", "&nbsp;") : "");
}
%>


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
	<td>내용</td>
	<td colspan="3"><%=content %></td>
</tr>
</table>


<table>
	<tr>
		<td>
			<input type="button" name="btn_modify" id="btn_modify" value="글수정" />
			<input type="button" name="btn_delete" id="btn_delete" value="삭제" />
			<input type="button" name="btn_list" id="btn_list" value="이전페이지로" />
		</td>
	</tr>
</table>


<script>
document.querySelector("#btn_list").addEventListener("click", function(e){
	window.location.href="list.jsp";
}, false);

document.querySelector("#btn_delete").addEventListener("click", function(e){
<%if (__LOGIN_FLAG == true){%>
	let confirm_yn = confirm("현재 글을 삭제하시겠습니까?");
	if (confirm_yn) {
		window.location.href="delete_ok.jsp?idx=<%=idx%>";
	}
<%} else {%>
	alert("로그인 후 삭제 가능합니다.");
	window.location.href="<%=__BASE_URL%>/login/login.jsp";
<%}%>
}, false);

document.querySelector("#btn_modify").addEventListener("click", function(e){
<%if (__LOGIN_FLAG == true){%>
	window.location.href="modify.jsp?idx=<%=idx%>";
<%} else {%>
	alert("로그인 후 수정 가능합니다.");
	window.location.href="<%=__BASE_URL%>/login/login.jsp";
<%}%>
}, false);

</script>


</body>
</html>