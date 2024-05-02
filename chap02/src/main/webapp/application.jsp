<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - application</title>
</head>
<body>
<h2>Application 내장객체</h2>
<ul>
<!-- 
웹 서비스 당 하나만 생성되는 어플리케이션 객체. 웹 서버 당 X 
웹 서비스를 전담하는 애
어플리케이션 객체 안에 다른 객체들이 있어
톰캣이 죽으면? 다 죽어
어플리케이션이 장애가 발생해? 하나만 죽으면 나머지 어플리케이션들은 상관없이 잘 돌아가
-->
	<li>웹서버의 설정 정보를 가져올 때</li>
	<li>웹서버의 설정 파일에 저장한 정보를 가져올 때</li>
	<li>웹서버의 특정 폴더나 파일의 물리적 경로를 가져올 때</li>
</ul>

application 내장 객체 <br>
<!-- 초기화 변수 "INIT_PARAM"은 webapp -> web-inf -> web.xml 에서 갖고오는 거야. xml 파일 안에 선언해서 사용 가능 -->
초기화 변수 : <%=application.getInitParameter("INIT_PARAM") %><br>
<!-- 물리적 경로는 언제 쓸까? 파일 업로드 할 때. 업로드 디렉토리의 실제 물리적 경로 얻어올 때 사용! 공통으로 전체 파일 갖고있는 애 경로 저장해 놓으면 한꺼번에 관리하기 편해! -->
물리적 경로 : <%=application.getRealPath("/chap02") %><br><br>

선언부에서 사용 <br>
<%!
public String getApplication() {
	return this.getServletContext().getRealPath("/chap02");
}

public String getApplication(ServletContext sc) {
	return sc.getRealPath("/chap02");
}
%>

this 사용 Application : <%=getApplication() %><br>
내장객체 전달 : <%=getApplication(application) %>


</body>
</html>