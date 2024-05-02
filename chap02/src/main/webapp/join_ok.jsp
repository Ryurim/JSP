<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	
	
	
	//response 이용해서 페이지 이동
	if (id.equals("test1234")) {
		response.sendRedirect("welcome.jsp?id=" + id); 
		// url의 정보가 바뀜. 이동과 동시에 url 정보 같이 변경
		// http://localhost:8080/chap02/welcome.jsp
	}
	//request 이용해서 페이지 이동
	else {
		request.getRequestDispatcher("join.jsp?loginErr=1").forward(request, response);
		// 해당 url로 화면을 이동 시키되 join_ok의 url 정보는 바꾸지 않아.
		// http://localhost:8080/chap02/join_ok.jsp?id=test1234wer&pwd=test1234....
		// request 서블릿이 이 역할을 할겨..
	}
	
	// 언제 쓰고, 동작성이 어떤지 알고 있어야 해
	
	%>
</body>
</html>