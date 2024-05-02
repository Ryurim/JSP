<%@page import="common.ConnectPool"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC Connection 테스트</title>
</head>
<body>
<h2>기본 생성자 연결 테스트</h2>
<%
JDBConnect jdbc1 = new JDBConnect(); // 생성 하자마자 바로 커넥션이 됨!

out.print("jdbc1 : " + jdbc1 + "<br>");
		
jdbc1.close();

%>
<br><hr><br>
<h2>사용자 정의 생성자 1 연결 테스트</h2>
<%
String driver = application.getInitParameter("Driver");
String url = application.getInitParameter("URL");
String dbId = application.getInitParameter("dbId");
String dbPwd = application.getInitParameter("dbPwd");

JDBConnect jdbc2 = new JDBConnect(driver, url, dbId, dbPwd);

out.print("jdbc2 : " + jdbc2 + "<br>");

jdbc2.close();

%>
<br><hr><br>
<h2>사용자 정의 생성자 2 연결 테스트</h2>
<%
//제일 심플하네! 한글자라도 덜 치려고 이거 사용함
JDBConnect jdbc3 = new JDBConnect(application);
out.print("jdbc3 : " + jdbc3 + "<br>");

jdbc3.close();

%>

<br><hr><br>
<h2>DB Connection Pool 연결 테스트</h2>
<%
ConnectPool pool = new ConnectPool();
pool.close();
%>
</body>
</html>