<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="fileupload.FileDTO"%>
<%@page import="fileupload.FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 리스트</title>
</head>
<body>
	<h2>파일 목록 보기</h2>
	<a href="file.jsp">파일목록1</a>
	
	<%
	FileDAO dao = new FileDAO();
	List<FileDTO> fileLists = dao.fileList();
	dao.close();
	%>
	
	<table border="1">
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>카테고리</th>
			<th>원본 파일</th>
			<th>저장 파일</th>
			<th>작성일</th>
			<th>파일 다운로드</th>
		</tr>
		<%
		if (fileLists != null) {
			for (FileDTO list : fileLists) {
		%>
		<tr>
			<td><%=list.getIdx() %></td>
			<td><%=list.getTitle() %></td>
			<td><%=list.getCategory() %></td>
			<td><%=list.getOrgFile() %></td>
			<td><%=list.getSaveFile() %></td>
			<td><%=list.getReg_date() %></td>
			<td><a href="download.jsp?
			orgFile=<%=URLEncoder.encode(list.getOrgFile(), "UTF-8") %>
			&saveFile=<%=URLEncoder.encode(list.getSaveFile(), "UTF-8") %>">다운로드</a></td>
		</tr>
		<%	} 
		} else {
		%>
		<tr>
			<td colspan = "6">등록된 파일이 존재하지 않습니다</td>
		</tr>
		<%} %>
	</table>
</body>
</html>