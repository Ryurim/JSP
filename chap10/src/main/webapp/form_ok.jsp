<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL - 폼 처리</title>
</head>
<body>

<h2>폼값 처리</h2>
<ul>
	<li>이름 : ${param.name }</li>
	<li>성별 : ${param.sex }</li>
	<li>학력 : ${param.grade }</li>
	<li>관심사항 : ${paramValues.interest[0] }
	${paramValues.interest[1] } 
	${paramValues.interest[2] } 
	${paramValues.interest[3] }
	${paramValues.interest[4] }</li>
	<li>관심사항 : ${paramValues.interest }</li>
	<li>관심사항 : <%=request.getParameterValues("interest") %>
	<li>관심사항 : <%=request.getParameterValues("interest")[0] %>
</ul>

</body>
</html>