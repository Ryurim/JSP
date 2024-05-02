<%@page import="model1.bbs.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="common.BbsPage"%>
<%@page import="java.util.Map"%>
<%@page import="model1.bbs.BbsDAO"%>
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
<h2>게시판 목록</h2>

<%
int total_count = 0;
int total_page = 1;
int page_no = 1;
int page_size = 10;
int page_skip_cnt = 10;
int page_block_size = 10;
int page_block_start = 1;
int page_block_end = 1;

BbsDAO dao = new BbsDAO(application);

Map<String, Object> param = new HashMap<String, Object>();
String search_category = request.getParameter("search_category");
String search_word = request.getParameter("search_word");
page_no = (request.getParameter("page_no") != null ? Integer.parseInt(request.getParameter("page_no")) : 1);
page_skip_cnt = (page_no-1)*page_size;


if (search_word != null && !search_word.isEmpty() 
		&& search_category != null && !search_category.isEmpty()) {
	if (search_word.trim() != null && !search_word.trim().isEmpty()
			&& search_category.trim() != null && !search_category.isEmpty()) {
		param.put("search_category", search_category.trim());
		param.put("search_word", search_word.trim());
	}
}

param.put("page_skip_cnt", page_skip_cnt);
param.put("page_size", page_size);

total_count = dao.bbsTotalCount(param);
List<BbsDTO> bbsList = dao.bbsList(param);
dao.close();
%>



<%if (session.getAttribute("UserId") == null) { %>
<form name="frmLogin" id="frmLogin" method="get">
<table>
	<tr>
		<td class="logIn"><a  href="../login/login.jsp"><input type="button"  name="logIn" value="로그인"></a></td>
		
	</tr>
</table>
</form>
<%} else {%>
<form name="frmLogin" id="frmLogin" method="get">
	<table>
		<tr>
			<td class="logIn"><a href="../login/logout.jsp"><input type="button"  name="logIn" value="로그아웃"></a></td>
		</tr>
	</table>
</form>
<%} %>

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
		<td colspan="5" style="text-align:left">전체 게시글 수 : <%=total_count %> 개</td>
	</tr>
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>조회수</td>
		<td>작성일</td>
	</tr>
	<tbody>
	
<%
if (!bbsList.isEmpty()) {
	int row_no = total_count - (page_no-1)*page_size;
	for (BbsDTO dto : bbsList) {
		
%>
	
	
		<tr>
			<td><%=row_no %></td>
			<td><a id="view" href="view.jsp?idx=<%=dto.getIdx() %>" > <%=dto.getTitle() %></a></td>
			<td><%=dto.getUser_id() %></td>
			<td><%=dto.getRead_cnt() %></td>
			<td><%=dto.getReg_date() %></td>
		</tr>
<%		
		row_no--;
	}
}
else {

%>
		<tr>
			<td colspan="5">등록된 게시물이 없습니다.</td>
		</tr>
	
<%
}
%>
</tbody>
</table>
<table>
	<tr>
		<td class="btn_regist">
			<input type="button" name="btn_regist" id="btn_regist" value="글등록">
		</td>
		
	</tr>
</table>
<%
total_page = (int)Math.ceil(total_count/(double)page_size);
page_block_size = 10;
page_block_start = (int)Math.floor((page_no-1)/(double)page_size)*page_size + 1;
page_block_end = (int)Math.ceil((page_no/(double)page_size))*page_size;
page_block_end = (page_block_end > total_page ? total_page : page_block_end);
%>
<table>
	<tr>
		<td>
			<div id="paging"><%=BbsPage.pagingArea(total_page, page_no, page_block_start, page_block_end, "list.jsp?") %></div>
		</td>
		
	</tr>
</table>
</main>
<script>
document.querySelector("#btn_regist").addEventListener("click", function(e) {
	location.href = "regist.jsp";
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