<%@page import="model2.bbs.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model2.bbs.BbsDAO"%>
<%@page import="common.CommonUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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


<c:choose>
	<c:when test="${empty UserId}" >
		<form name="frmLogin" id="frmLogin" method="get">
			<table>
				<tr>
					<td class="logIn"><a  href="../login/login_ok.do"><input type="button"  name="logIn" value="로그인"></a></td>
		
				</tr>
			</table>
		</form>
	</c:when>
	<c:otherwise>
		<form name="frmLogin" id="frmLogin" method="get">
			<table>
				<tr>
					<td class="logIn"><a href="../login/logout.do"><input type="button"  name="logIn" value="로그아웃"></a></td>
				</tr>
			</table>
		</form>
	</c:otherwise>
</c:choose>
<table>
	<tr>
		<td>번호 : ${params.idx }</td>
		<td>작성자 : ${params.user_id }</td>
		<td>조회수 : ${params.read_cnt }</td>
		<td>작성일 : ${params.reg_date }</td>
	</tr>
	<tr>
		<td>제목</td>
		<td colspan="3">${params.title }</td>
	</tr>
	<tr>
		<td>글내용</td>
		<td colspan="3">${params.content}</td>
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
	
	window.location.href = "list.do";

}, false);

document.querySelector("#btn_delete").addEventListener("click", function(e) {
	
	<%if (session.getAttribute("UserId") == null) {%>
	alert("로그인 후 접근이 가능합니다.");
	window.location.href = "../login/login_ok.do";
<%-- 	<%} else if (session.getAttribute("UserId").toString().equals(user_id)) {%> --%>
// 	alert("자신의 글만 삭제가 가능합니다.");
<%-- 	window.location.href = "view.jsp?idx=<%=idx %>"; --%>
	<%}else {%>
	let confirm_yn = confirm("현재 글을 삭제하시겠습니까?");
	if (confirm_yn) {
		window.location.href = "delete.do?idx=${params.idx}";	
	}
	<%}%>
}, false);

document.querySelector("#btn_modify").addEventListener("click", function(e) {
	<%if (session.getAttribute("UserId") == null) {%>
	alert("로그인 후 접근이 가능합니다.");
	window.location.href = "../login/login_ok.do";
<%-- 	<%} else if (session.getAttribute("UserId").toString().equals(user_id)) {%> --%>
// 		alert("자신의 글만 수정이 가능합니다.");
<%-- 		window.location.href = "view.jsp?idx=<%=idx %>"; --%>
	<%} else {%>
	window.location.href = "modify.do?idx=${params.idx}";
	<%}%>
	
	
}, false);



</script>


</body>
</html>