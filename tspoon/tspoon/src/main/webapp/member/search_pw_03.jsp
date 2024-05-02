<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/search_pw_03.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
    <meta name="format-detection" content="telephone=no, address=no" />
    <title>T 클래스</title>
    <script src="/tspoon/include/js/jquery-3.4.1.min.js"></script>
    <script src="/tspoon/include/js/ui.js"></script>
    <script src="/tspoon/include/js/chart.js"></script>
    <script src="/tspoon/include/js/swiper.js"></script>
    <script src="/tspoon/include/js/aos.js"></script>
    <link rel="stylesheet" type="text/css" href="/tspoon/include/css/common.css" />
    <link href="/tspoon/include/css/aos.css" rel="stylesheet">
</head>
<body>
    <!--웹영역 전체//-->
    <div id="wrap" class="wrap">
        <!--해더영역//-->
        <div id="header">
            <h1>비밀번호 변경</h1>
            <jsp:include page="/common/menu.jsp"/>
            <!-- 
            <span class="btnSide"><a href="#">좌측메뉴 펼침</a></span>
        </div> -->
        <!--//해더영역-->
        <!--컨텐츠 본문//-->
        <div id="content">
            <!--비밀번호 변경 전체//-->
            <form  class="pwSearchWrap" id="frm" action="/tspoon/member/modifyPwd.do" method="post">
                <h2><strong>아이디</strong></h2>
                <div class="idList">
                    <ul>
                        <li>${id }</li>
                    </ul>
                </div>
                <p class="txt_01 mt_20">새로운 비밀번호로 변경하세요.</p>
                <div class="formBox mt_50" >
                	<input type="hidden" name="id" value="${id }"/> 
                    <input type="password" class="itxt" id="password" name="newPwd" placeholder="비밀번호 (영문, 숫자, 특수문자 조합 10~16자리)" />
                    <label class="title" for="password">비밀번호</label>
                    <span class="txtSub" id="pwdChk" style="display:none;">비밀번호를 정확하게 입력하세요.</span>
                </div>
                <div class="formBox" >
                    <input type="password" class="itxt" id="password2" placeholder="비밀번호 재 입력" />
                    <label class="title" for="password2">비밀번호 재 입력</label>
                    <span class="txtSub" id="pwd2Chk" style="display:none;">비밀번호가 일치하지 않습니다.</span>
                </div>
                <button class="button blue big mt_40" id="btnRegist">확인</button>
            </form>
            <!--//비밀번호 변경 전체-->
        </div>
        <!--//컨텐츠 본문-->
    </div>
    <!--//웹영역 전체-->
	<script>


    
    document.querySelector("#btnRegist").addEventListener("click", (e) => {
    	
        let pwd = document.querySelector("#password");
        let pwd2 = document.querySelector("#password2");
        
        let pwdChk = document.querySelector("#pwdChk");
        let pwd2Chk = document.querySelector("#pwd2Chk");
        
        
        let frm = document.querySelector("#frm");
        
        
        e.preventDefault();
        
        if (pwd == null || pwd.value.length == 0 ) {
        	return false;
        }
    	
        	
        	 // 비밀번호 벨리데이션 체크 
       	 if (!(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{10,16}$/.test(pwd.value))) {
       		 pwdChk.style.display = "block";
       		 pwd.focus();
       		 return false;
       	 }
       	 
       	 // 비밀번호 재입력 확인 
       	 if (!(pwd.value === pwd2.value)) {
       		 pwd2Chk.style.display = "block";
       		 pwd2.focus();
       		 return false;
       	 }
       	 
       	 else {
       		 alert("변경된 비밀번호로 로그인 하세요.");
       		 frm.submit();
       	 }
    });
    
	
	</script>
</body>


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/search_pw_03.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>
