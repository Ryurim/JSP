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
// 서버쪽에서 벨리데이터 체크
String bbs_idx = request.getParameter("idx");

int idx = 0;
idx = (bbs_idx != null && !bbs_idx.isEmpty() ? Integer.parseInt(bbs_idx) : 0); 

//idx = Integer.parseInt(request.getParameter("idx"));

String user_id = request.getParameter("user_id");
String title = request.getParameter("title");
String content = request.getParameter("content");

BbsDTO dto = new BbsDTO();
dto.setIdx(idx);
dto.setUser_id(user_id);
dto.setTitle(title);
dto.setContent(content);

BbsDAO dao = new BbsDAO();
int result = dao.bbsModify(dto);
dao.close();

if (result > 0) {
	response.sendRedirect("list.do");

} else {
	out.println("<script>");
	out.println("alert('글 수정 시 에러가 발생하였습니다.')");
	out.println("window.location.replace('list.jsp')");
	out.println("</script>");
}
%>

</body>
</html>