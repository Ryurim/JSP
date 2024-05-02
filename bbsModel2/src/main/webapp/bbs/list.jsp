<%@page import="model2.bbs.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="common.BbsPage"%>
<%@page import="java.util.Map"%>
<%@page import="model2.bbs.BbsDAO"%>
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
<h2>게시판 목록</h2>

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


<form name="frmSearch" id="frmSearch" method="get"> <!-- post 로 주면 백 하면 오류 뜸 action 안주면 자기 자신으로 디폴트-->
	<table>
		<tr>
			<td>
				<select name="search_category" id="search_category">
					<option value="" selected>선택</option>
					<option value="title" >제목</option>
					<option value="content" >글내용</option>
					<option value="user_id" >작성자</option>
				</select>
				&nbsp;&nbsp; <input type="text" name="search_word" id="search_word" value="" maxlength="20"/>
				&nbsp; <input type="button" name="btn_search" id="btn_search" value="검색"/>
			</td>
			
		</tr>
	</table>
</form>

<table>
	<tr>
		<td colspan="6" style="text-align:left">전체 게시글 수 : ${params.total_count}개</td>
	</tr>
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>조회수</td>
		<td>작성일</td>
		<td>다운로드</td>
	</tr>
	<tbody>
<c:set var="row_no" value="${params.total_count - (params.page_no-1)*params.page_size}"/>
<c:choose>
	<c:when test="${not empty bbsList}">
		<c:forEach var="list" items="${bbsList}" varStatus="loop">
			<tr>
				<td>${row_no}</td>
				<td><a id="view" href="view.do?idx=${list.idx}" > ${list.title}</a></td>
				<td>${list.user_id}</td>
				<td>${list.read_cnt}</td>
				<td>${list.reg_date}</td>
				<td>다운로드</td>
			</tr>
			${row_no = row_no -1;''}
		</c:forEach>
	</c:when>
	
	<c:otherwise>
		<tr>
			<td colspan="6">등록된 게시물이 없습니다.</td>
		</tr>
	</c:otherwise>
</c:choose>	

</tbody>
</table>
<table>
	<tr>
		<td class="btn_regist">
			<input type="button" name="btn_regist" id="btn_regist" value="글등록">
		</td>
		
	</tr>
</table>

<table>
	<tr>
		<td>
			<div id="paging">${params.paging }</div>
		</td>
	</tr>
</table>
</main>
<script>
document.querySelector("#btn_regist").addEventListener("click", function(e) {
	location.href = "regist_ok.do";
}, false);

document.querySelector("#btn_search").addEventListener("click", function(e) {

	e.preventDefault();
	e.stopPropagation();
	
	const search_category = document.querySelector("#search_category");
	if (search_category.value.length < 1 || search_category.value == "" || search_category.value == null) {
		alert("검색 구분을 선택하세요");
		search_category.focus();
		return false;
	}
	
	const search_word = document.querySelector("#search_word");
	if (search_word.value.length < 1 || search_word.value == "" || search_word.value == null) {
		alert("검색어 입력하세요");
		search_word.focus();
		return false;
	}
	
	const frm = document.querySelector("#frmSearch");
	frm.submit();
	
	return;

}, false);


function notLogin() {
	alert("로그인 후 접근이 가능합니다.");
	location.href = "../login/login.jsp";
}
</script>

</body>
</html>