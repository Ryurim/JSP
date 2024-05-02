<%@page import="model2.bbs.BbsDAO"%>
<%@page import="model2.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
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
<c:choose>
	<c:when test="${params.result gt 0}">
		response.sendRedirect("list.do");
	</c:when>
	<c:otherwise>
		<h2>게시글 수정 실패!</h2>
		<table>
			<tr>
				<td width="200">작성자</td>
				<td width="600">${params.user_id}</td>
			</tr>
			<tr>
				<td width="200">제목</td>
				<td colspan="3">${params.title }</td>
			</tr>
			<tr>
				<td width="200">글내용</td>
				<td colspan="3">
					${params.content }
				</td>
			</tr>
		</table>
	</c:otherwise>
</c:choose>


</body>
</html>