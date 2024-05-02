<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
<script>
function check_form(frm) {
	if (frm.title.value == "") {
		alert("제목을 입력하세요.");
		frm.title.focus();
		return false;
	}
	if (frm.file.value == "") {
		alert("파일을 선택하세요.");
		return false;
	}
}
</script>

<h2>파일 업로드</h2>

<span style="color:red;">${errMsg}</span>
<form name="frm" id="frm" method="post" enctype="multipart/form-data" action="./FileUpload2.do" onsubmit="return check_form(this);">
<!-- multipart/form-data 이거 쓰면 file 에서는 request.getParameter() 쓸 수 없어.  -->
<!-- 그래서 request.getPart() 쓰는거야. fileStream 처리해 주는 애임 -->
<!-- () 사이에 들어가는 이름은 file 태그의 속성값 이름 (name) -->
	<label>제목 : <input type="text" name="title" id="title" value="" maxlength="100"/></label><br>
	<label>카테고리 : </label>
	<label for="category_0">사진</label><input type="checkbox" name="category" id="category_0" value="사진" checked/>
	<label for="category_1">그림</label><input type="checkbox" name="category" id="category_1" value="그림" />
	<label for="category_2">음악</label><input type="checkbox" name="category" id="category_2" value="음악" />
	<label for="category_3">악기</label><input type="checkbox" name="category" id="category_3" value="악기" />
	<br>
	첨부파일 : <input type="file" name="file" id="file" multiple/>
	
	<br><br>
	<input type="submit" value="전송하기"/>
</form>

</body>
</html>