<%@page import="model1.bbs.BbsDAO"%>
<%@page import="model1.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, td, th {
		border : 1px solid black;
	}
	table {
		width : 90%;
	}
</style>
</head>
<body>
<h2>게시글 등록</h2>
<%
String user_id = request.getParameter("user_id");
String title = request.getParameter("title");
String content = request.getParameter("content");

BbsDTO dto = new BbsDTO();
dto.setUser_id(user_id);
dto.setTitle(title);
dto.setContent(content);

BbsDAO dao = new BbsDAO();
int result = dao.bbsRegist(dto);
dao.close();

if (result > 0) {
	response.sendRedirect("list.jsp");

} else {

%>
<h2>게시글 등록 실패!</h2>
	<table>
		<tr>
			<td width="200">작성자</td>
			<td width="600"><%=user_id %></td>
		</tr>
		<tr>
			<td width="200">제목</td>
			<td colspan="3"><%=title %></td>
		</tr>
		<tr>
			<td width="200">글내용</td>
			<td colspan="3">
				<%=content %>
			</td>
		</tr>
	
	</table>
<%
}
%>

</body>
</html>