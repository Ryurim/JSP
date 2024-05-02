<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서블릿 어노테이션 맵핑</title>
</head>
<body>

<h2>어노테이션 매핑</h2>
<p>
	${msg}
	
	<a href="<%=request.getContextPath()%>/AnnotationMappingServlet.do">HelloServlet</a>
</p>

</body>
</html>