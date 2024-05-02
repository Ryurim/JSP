<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>response - 내장객체 : Out</title>
</head>
<body>
<%
//out은 버퍼에 있는거 출력

out.print("텍스트 입니다.");
//위에거가 html에 전달되어서 저장되기 전에 지워버려
out.clearBuffer();

out.print("<h2>out 내장 객체</h2>");

out.print("출력 버퍼크기 : " + out.getBufferSize() + "<br>");
out.print("남은 버퍼크기 : " + out.getRemaining() + "<br>");

//강제로 출력
out.flush();
out.print("flush 후 버퍼 크기 : " + out.getRemaining() + "<br>");

//clearBuffer, flush는 보통 네트워크 통신할 때 사용! 버퍼가 다 차면 전송 뭐 요럴때 사용

out.print(1);
out.print(false);
out.print('가');
%>
<!-- 
스크립틀릿과 out의 차이점? 언제 스크립틀릿을 쓰고 언제 out을 쓸까?
스크립틀릿은 서블릿의 out임
스크립트에서 출력을 하고싶으면 out 쓰는거야. html 안에서는 out, 로직 안에서는 스크립틀릿 사용
 -->
<br><br><%=1 %>
</body>
</html>