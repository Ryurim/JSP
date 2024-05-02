<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul {
		list-style : none;
		padding-left : 0;
	}
</style>
</head>
<body>

<a href = "RequestInfo.jsp?param1=변수1&param2=변수2">클라이언트/서버 환경정보 조회</a>
<br><hr><br>
<%
String loginErr = request.getParameter("loginErr");
if (loginErr != null) {
	out.print("로그인 실패!");
}

String id = request.getParameter("id") != null ? request.getParameter("id"): "";
String pwd = request.getParameter("pwd") != null ? request.getParameter("pwd"): "";
String name = request.getParameter("name") != null ? request.getParameter("name"): "";
String sex = request.getParameter("sex") != null ? request.getParameter("sex"): "";
String date = request.getParameter("birth") != null ? request.getParameter("birth"): "";
String introduce = request.getParameter("text") != null ? request.getParameter("text"): "";
String favorite[] = request.getParameterValues("favo");

List<String> fav = (favorite != null && favorite.length > 0) ? Arrays.asList(favorite) : Arrays.asList("no");


%>

	<form name="frmJoin" id="frmJoin" action="join_ok.jsp">
		<ul>
			<li>
				<label for="id">아이디 : </label>
				<input type="text" id="id" name="id" value="<%=id %>" >
			</li>
			<li>
				<label for="pwd">비밀번호 : </label>
				<input type="password" id="pwd" name="pwd" value="<%=pwd %>" placeholder="특수문자는 !@#$%^&*()_-만 가능합니다.">
			</li>
			<li>
				<label for="name">이름 : </label>
				<input type="text" id="name" value="<%=name %>" name="name">
			</li>
			<li>
				<label>성별 : </label>
				<label>남<input type="radio" name="sex" id="sex_1" value="man"  <%if (sex.equals("man")) { %> checked <%} %>></label>
				<label>여<input type="radio" name="sex" id="sex_2" value="woman" <%if (sex.equals("woman")) { %> checked <%} %>></label>
			</li>
			<li>
				<label>생년월일 : </label>
				<input type="date"  name="birth"  value="<%=date %>" >
			</li>
			<li>
				<label>관심사항 : </label>
				<label>스포츠<input type="checkbox" name="favo" value="스포츠" <%if (fav.contains("스포츠")) {%> checked <%} %>></label>
				<label>경제<input type="checkbox" name="favo" value="경제" <%if (fav.contains("경제")) {%> checked <%} %>></label>
				<label>문학<input type="checkbox" name="favo" value="문학" <%if (fav.contains("문학")) {%> checked <%} %>></label>
				<label>연예<input type="checkbox" name="favo" value="연예" <%if (fav.contains("연예")) {%> checked <%} %>></label>
				<label>여행<input type="checkbox" name="favo" value="여행" <%if (fav.contains("여행")) {%> checked <%} %>></label>
			</li>
			<li>
				<label>자기소개</label>
				<textarea cols = "50" name="text" rows = "4" ><%if (introduce != null) { %> <%=introduce %> <%} %></textarea>
			</li>
			<li>
				<input type="submit" id="submit" value="회원가입">
				<input type="reset" value="초기화"> 
			</li>
		</ul>
	</form>
	
	
	<br><hr><br>
	<a href="RequestHeaderInfo.jsp">헤더 정보 조회하기</a>
	
	<script>
		
		let submit = document.querySelector("#submit");
		
		submit.addEventListener("click", (e)=> {
			//e.preventDefault(); 여기서 한번에 걸어줘도 돼.
			
			let id = document.querySelector("#id").value;
			let pwd = document.querySelector("#pwd").value;
			let name = document.querySelector("#name").value;
			let sex = document.querySelectorAll("input[name='sex']:checked").length;
			let birth = document.querySelector("input[type='date']").value;
			let check = document.querySelectorAll("input[type='checkbox']:checked").length;
			let text = document.querySelector("textarea").value;
			
		
			let idStart = 0;
			let idEngCnt = 0;
			let idNumCnt = 0;
			let idSpecCnt = 0;
			
			
			let pwdEngCnt = 0;
			let pwdNumCnt = 0;
			let pwdSpecCnt = 0;
			
			let engS = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h','i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
			let engL = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
			let numArr = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
			let specArr = ['!', '@', '#', '$', '%', '^', '&', '*','(', ')', '-', '_'];
			
			
			
			if (id.length < 4 || id.length > 20) {
				alert("아이디를 4자리 이상 20자리 이하로 입력해 주세요.");
				e.preventDefault();
				return false;
			}
			if (id.length >=4) {
				
				for (let i = 0; i<engS.length; i++) {
					if ((id.charAt(0) == engS[i]) || (id.charAt(0) == engL[i])) {
						idStart++;
					}
					
				}
				
				for (let i=0; i<id.length; i++) {
					for (let j=0; j<engS.length; j++) {
						if ((id.charAt(i) == engS[j]) || (id.charAt(i) == engL[j])) {
							idEngCnt++;
						}
					}
					for (let k=0; k<numArr.length; k++) {
						if (id.charAt(i) == numArr[k]) {
							idNumCnt++;
						}
					}
					for (let l=0; l<specArr.length; l++) {
						if (id.charAt(i) == specArr[l]) {
							idSpecCnt++;
						}
					}
				}
				
				if (idStart == 0) {
					alert("아이디 : 첫 글자는 영문으로 입력해 주세요.");
					e.preventDefault();
					return false;
				}
				
				if (idNumCnt == 0) {
					alert("아이디 : 숫자를 한자리 이상 입력해 주세요.");
					e.preventDefault();
					return false;
				}
				
				if (idSpecCnt != 0) {
					alert("아이디 : 특수문자를 사용할 수 없습니다.");
					e.preventDefault();
					return false;
				}
				
			}
			
			if (pwd.length <8 || pwd.length > 20) {
				alert("비밀번호를 8자리 이상 20자리 이하로 입력해 주세요.");
				e.preventDefault();
				return false;
			}
			if (pwd.length >= 8) {
				for (let i=0; i<pwd.length; i++) {
					for (let j=0; j<engS.length; j++) {
						if (pwd.charAt(i) == engS[j] || pwd.charAt(i) == engL[j]) {
							pwdEngCnt++;
						}
					}
					for (let k=0; k<numArr.length; k++) {
						if (pwd.charAt(i) == numArr[k]) {
							pwdNumCnt++;
						}
					}
					for (let l=0; l<specArr.length; l++) {
						if (pwd.charAt(i) == specArr[l]) {
							pwdSpecCnt++;
						}
					}
				}
				
				
				if (pwdEngCnt == 0) {
					alert("비밀번호 : 영문을 한글자 이상 입력해 주세요.");
					e.preventDefault();
					return false;
				}
				if (pwdNumCnt == 0) {
					alert("비밀번호 : 숫자를 한글자 이상 입력해 주세요.");
					e.preventDefault();return false;
				}
				if (pwdSpecCnt == 0) {
					alert("비밀번호 : 특수문자를 한글자 이상 입력해 주세요.");
					e.preventDefault();
					return false;
				}
			}
			if (name == "" || name == null || name == undefined) {
				alert("이름을 입력하세요.");
				e.preventDefault();
				return false;
			}
			if (sex == 0) {
				alert("성별을 선택해 주세요.");
				e.preventDefault();return false;
			}
			
			if (birth == "" || birth == null || birth == undefined) {
				alert("생년월일을 입력하세요.");
				e.preventDefault();
				return false;
			}
			if (birth != "") {
				let day = new Date(birth);
				let today = new Date();
				if (day.getTime() > today.getTime()) {
					alert("오늘보다 이전의 날짜를 선택하세요.");
					e.preventDefault();
					return false;
				}
			}
			
			if (check == 0) {
				alert("체크박스를 하나 이상 선택해 주세요.");
				e.preventDefault();
				return false;
			}
			
			
			if (text.length <50) {
				alert("자기소개는 40자 이상 입력해 주세요.");
				e.preventDefault();
				return false;
			}
			
			//else {
			//	submit.disabled = true; //더블클릭 되어서 값 두번 들어가는거 방지. 근데 계속 비활성화 인데?? 어디에 넣어야 되지? -> form에다가 액션을 건 경우에만 가능!
			//	return true;
			//}
			alert("재츌이 완료되었습니다.");
			return true;
		});
	
		function sex_check(param) {
			const sex_1 = document.querySelector("#sex_1");
			const sex_2 = document.querySelector("#sex_2");
			if (param != "") {
				(param == "man" ? sex_1.checked : sex_2.checked);
			}
		}
		sex_check('<%=sex %>');
	</script>
</body>
</html>