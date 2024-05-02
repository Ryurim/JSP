<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>회원 목록 조회</h2>

<%
//DB 연결
JDBConnect jdbc = new JDBConnect();

//회원 조회 쿼리
String sql = "SELECT memberId, name, pwd, jumin, addr1, addr2, birthday, jobCode, mileage, memberState, regDate, leaveDate, pwd_change_date from tbl_member";
//PreparedStatement pstmt = jdbc.conn.prepareStatement(sql);
//ResultSet rs = pstmt.executeQuery();

Statement stmt = jdbc.conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);

while(rs.next()) { //ResultSet은 엑셀에서 row 가져오는 애. (테이블의 한 줄) 다음 ResultSet이 있니? 없으면 null 반환. 근데 필드에서는 이렇게 넣어서 작업 하지 마,, 왜?
	String member_id = rs.getString(1); //첫번째 필드값을 넣을거야
	String name = rs.getString(2); //두번째 값을 줘
	String pwd = rs.getString(3);
	String jumin = rs.getString("jumin"); //컬럼명을 직접 줄 수 도 있어
	Date reg_date = rs.getDate("regDate");	//년 월 일만 보여주게
 	out.println(String.format("%s, %s, %s, %s, %s", member_id, name, pwd, jumin, reg_date) + "<br>");
	
}
jdbc.close(); // 필수 코드! 이거 안하면 서버 뻗을 수 있어
%>

</body>
</html>