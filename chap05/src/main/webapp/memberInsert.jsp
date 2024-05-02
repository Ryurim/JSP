<%@page import="common.ConnectPool"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커넥션 테스트 - 회원 등록</title>
</head>
<body>
<%
/*
String memberId = "test10";
String name = "테스트회원10";
String pwd = "1234";

//String sql = "INSERT INTO tbl_member(memberId, name, pwd, regDate)"; 이거보단 스트링빌더 써
StringBuilder sb = new StringBuilder();
sb.append("INSERT INTO tbl_member(memberId, name, pwd, regDate)"); //컬럼 이름 정확해야해!
sb.append("VALUES(?, ?, ?, now())");

JDBConnect jdbc = new JDBConnect(); //커넥션을 열었어요

//?에 값 대입
PreparedStatement psmt = jdbc.conn.prepareStatement(sb.toString());
//db의 타입과 맞아야해
psmt.setString(1, memberId);
psmt.setString(2, name);
psmt.setString(3, pwd);

//psmt.executeQuery()//셀렉트 해올 때
//insert, update, delete는 executeUpdate() -> 리턴타입이 숫자타입. 영향받은 행 수가 리턴됨. 실패할 경우 -1 리턴됨
int result = psmt.executeUpdate();

out.print(String.format("%d 개의 행이 입력되었습니다.", result));

jdbc.close();	//커넥션을 열었으면 반드시 닫아주세요.

*/

String mI = "";
String nm = "";
String pd = "1234";

JDBConnect jdbc = new JDBConnect();
StringBuilder sb = new StringBuilder();

sb.append("INSERT INTO tbl_member(memberId, name, pwd, regDate)");
sb.append("VALUES(?, ?, ?, now())");

for (int i=11; i<=15; i++) {
	mI = "test" + i;
	nm = "테스트회원" + i;
	
	
	PreparedStatement psmt = jdbc.conn.prepareStatement(sb.toString());
	
	psmt.setString(1, mI);
	psmt.setString(2, nm);
	psmt.setString(3, pd);
	
	int result = psmt.executeUpdate();
	out.print(String.format("%d 개의 행이 입력되었습니다.<br>", result));
}

jdbc.close();




%>
</body>
</html>