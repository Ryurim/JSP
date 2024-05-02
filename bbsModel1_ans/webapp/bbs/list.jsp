<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="common.BbsPage"%>
<%@page import="model1.bbs.BbsDTO"%>
<%@page import="model1.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>
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
page_no = (request.getParameter("page_no")!=null ? Integer.parseInt(request.getParameter("page_no")) : 1);
page_skip_cnt = (page_no-1)*page_size;

//out.print(String.format("%s, %s, %d, %d<br><br>", search_category, search_word, page_skip_cnt, page_size));

if ( search_word != null && !search_word.isEmpty() 
		&& search_category != null && !search_category.isEmpty() ) {
	param.put("search_category", search_category);
	param.put("search_word", search_word);
}

param.put("page_skip_cnt", page_skip_cnt);
param.put("page_size", page_size);

total_count = dao.bbsTotalCount(param);
List<BbsDTO> bbsList = dao.bbsList(param);
dao.close();
%>


<form name="frmSearch" id="frmSearch" method="get">
<table>
	<tr>
		<td>
			<select name="search_category" id="search_category">
				<option value="" selected>선택</option>
				<option value="title" >제목</option>
				<option value="content" >글내용</option>
				<option value="user_id" >작성자</option>
			</select>
			&nbsp;&nbsp;<input type="text" name="search_word" id="search_word" value="" maxlength="20" />
			&nbsp;<input type="button" name="btn_search" id="btn_search" value="검색" />

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
	int row_no = (total_count - (page_no-1)*page_size);
	for(BbsDTO dto : bbsList) {
%>
<tr>
	<td><%=row_no%></td>
	<td><a href="view.jsp?idx=<%=dto.getIdx()%>"><%=dto.getTitle()%></a></td>
	<td><%=dto.getUser_id()%></td>
	<td><%=dto.getRead_cnt()%></td>
	<td><%=dto.getReg_date()%></td>
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
<%} %>
</tbody>
</table>
<table>
	<tr>
		<td>
			<input type="button" name="btn_regist" id="btn_regist" value="글등록" />
		</td>
	</tr>
</table>

<%
total_page = (int)Math.ceil(total_count/(double)page_size);
page_block_size = 10;
page_block_start = (int)Math.floor((page_no-1)/(double)page_size)*page_size +1;
page_block_end = (int)Math.ceil(page_no/(double)page_size)*page_size;
page_block_end = (page_block_end>total_page?total_page:page_block_end);
%>
<table>
	<tr>
		<td>
		<%=BbsPage.pagingArea(total_page, page_no, page_block_start, page_block_end, "list.jsp?") %>
<!--
<%=(page_no>1? "<a href='list.jsp?page_no=1'><strong><<</strong></a>&nbsp;&nbsp;" : "<<&nbsp;&nbsp;")%>
<%=(page_block_start>1? "<a href='list.jsp?page_no="+(page_block_start-1)+"'><strong><</strong></a>&nbsp;&nbsp;" : "<&nbsp;&nbsp;")%>
<%
//1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10
for (int i=page_block_start; i<=page_block_end; i++) {
	if ( page_no == i ){
		out.print("<strong>"+i+"</strong>");
	} else {
		out.print("<a href='list.jsp?page_no="+i+"'>"+i+"</a>");
	}
	if (i!=page_block_end) {
		out.print("&nbsp;|&nbsp;");
	}
}
%>			
<%=(total_page>page_block_end? "&nbsp;&nbsp;<a href='list.jsp?page_no="+(page_block_end+1)+"'><strong>></strong></a>" : "&nbsp;&nbsp;>")%>
<%=(total_page>page_block_end? "&nbsp;&nbsp;<a href='list.jsp?page_no="+(total_page)+"'><strong>>></strong></a>" : "&nbsp;&nbsp;>>")%>
 -->
		</td>
	</tr>
</table>



<script>
document.querySelector("#btn_regist").addEventListener("click", function(e){
	location.href="regist.jsp";
}, false);

document.querySelector("#btn_search").addEventListener("click", function(e){
	e.preventDefault();
	e.stopPropagation();
	
	const search_category = document.querySelector("#search_category");
	if(search_category.value.length<1 || search_category.value == "" || search_category.value == null) {
		alert("검색 구분을 선택하세요.");
		search_category.focus();
		return false;
	}
	const search_word = document.querySelector("#search_word");
	if(search_word.value.length<1 || search_word.value == "" || search_word.value == null) {
		alert("검색어를 입력하세요.");
		search_word.focus();
		return false;
	}
	
	const frm = document.querySelector("#frmSearch");
	//frm.action = "list.jsp";
	frm.submit();
	
	return;
}, false);
</script>
</body>
</html>