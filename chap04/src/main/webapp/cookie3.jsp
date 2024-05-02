  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>쿠키로 팝업 창 제어</title>
</head>
<body>
<h2>팝업 메인</h2>

<%

String popCheck = "block";

Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie c : cookies) {
		String cookieName = c.getName();
		String cookieVal = c.getValue();
		out.print(String.format("쿠키이름 : %s => 쿠키값 : %s<br>", cookieName, cookieVal));
		
		if (cookieName.equals("popup_close")) {
			popCheck = "none";
		}
	}
}
%>

<div id="popup" style="border:solid 1px red; display: ">
	<h2>공지사항 팝업</h2>
	<div>
		<form name="frmPopup" id="frmPopup">
			<input type="checkbox" name="popup_flag" id="popup_flag" value="Y"> 하루동안 열지 않음
			<input type="button" id="closePopup" value="닫기">
		</form>
	</div>
</div>

<div id="popup2" style="display : none;">
	<h2>공지사항 팝업창 열기</h2>
	<div>
		<input type="button" id="openPopup" value="팝업창 보이기">
	</div>
</div>

<script>
document.querySelector("#closePopup").addEventListener("click", function(e){
	const frm = document.getElementById("frmPopup");
	const pop_flag = document.querySelector("#popup_flag").checked;
	console.log("pop_flag : " + pop_flag);
	
	//if(pop_flag == true) {
		frm.action = "cookie4.jsp";
		frm.submit();
	//}

	
}, false);

document.querySelector("#openPopup").addEventListener("click", function(e){
	document.getElementById("popup").style.display = "block";
	document.getElementById("popup2").style.display = "none";
		
}, false);
</script>

</body>
</html>
