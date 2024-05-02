<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL - 폼값 전송</title>
</head>
<body>

<h2>폼값 처리</h2>

<form name="frm" id="frm" method="post" action="form_ok.jsp">
	이름 : <input type="text" name="name" id="name" value=""><br>
	성별 : <input type="radio" name="sex" id="sex_0" value="남자"> 남자
			&nbsp;<input type="radio" name="sex" id="sex_1" value="여자"> 여자 <br>
	최종학력 : <select name="grade" id="grade">
		<option value="초등학교">초등학교</option>
		<option value="중학교">중학교</option>
		<option value="고등학고">고등학교</option>
		<option value="대학교">대학교</option>
	</select><br>
	관심사항 : <label>정치<input type="checkbox" name="interest" id="interest_0" value="정치"></label>
		<label>경제<input type="checkbox" name="interest" id="interest_1" value="경제"></label>
		<label>과학<input type="checkbox" name="interest" id="interest_2" value="과학"></label>
		<label>연예<input type="checkbox" name="interest" id="interest_3" value="연예"></label>
		<label>스포츠<input type="checkbox" name="interest" id="interest_4" value="스포츠"></label>
	<br><br>
	
	<input type="submit" value="전송">
</form>
</body>
</html>