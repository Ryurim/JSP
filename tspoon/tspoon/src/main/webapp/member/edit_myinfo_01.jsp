<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/edit_myinfo_01.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
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
            <h1>개인정보수정</h1>
            <jsp:include page="/common/menu_login.jsp"/>
            <!-- <span class="btnSide"><a href="#">좌측메뉴 펼침</a></span>
        </div> -->
        <!--//해더영역-->
        <!--컨텐츠 본문//-->
        <div id="content">
            <!--개인정보 수정 전체//-->
            <div class="editPageWrap ">
                <form class="myProfile"  action="/tspoon/member/editInfo.do" method="post" enctype="multipart/form-data">
                    <p class="myPhoto"><img src="/tspoon/ext/cdndata.milkt.co.kr/ele/tspoon/Images/common/img_profile_tmp.png" alt="내 프로필 이미지" /></p>
                    <!--<p class="myPhoto"><img src="//cdndata.milkt.co.kr/ele/tspoon/Images/common/img_profile_noimg.png" alt="프로필 미설정" /></p>-->
                    <div class="btnFile">
                        <label for="fileupload">프로필 사진 설정</label>
                        <input type="file" name="pic" id="fileupload" value="pic" accept=".png, .jpeg, .jpg">                        
                    </div>
                    <!-- <a href="#" class="btnLogout">회원탈퇴</a> --><!-- #89500 티스푼 회원탈퇴 버튼 추가 22-08-31 -->
                </form>
                <form class="editPage"  id="frm" action="/tspoon/member/editInfo.do" method="post">
                    <!--아이디및 비밀번호입력//-->
                    <div class="formBox noEdit mt_40"><!--수정불가 noEdit 추가-->
                        <input type="text" class="itxt" id="iname" name="name" placeholder="이름" disabled="disabled" value="${memberList.name }" />
                        <label class="title" for="iname">이름</label>
                    </div>
                    <div class="formBox noEdit memberChange">
                        <input type="text" class="itxt" id="idn" name="idn" placeholder="아이디" disabled="disabled" value="${memberList.id }"  />
                        <input type="hidden" name="id" value="${memberList.id }"/>
                        <label class="title" for="idn">아이디</label>
                       <!--  <button class="btn">밀크T 아이디 전환</button> -->
                    </div>
                   <div class="formBox pwChange" >
                        <input type="password" class="itxt" id="password" name="pwd" disabled="true" placeholder="비밀번호 (영문, 숫자, 특수문자 조합 10~16자리)" />
                        <input type="hidden" name="pwd" value="${memberList.pwd }"/>
                        <label class="title" for="password">비밀번호</label>
                        <button class="btn" id="btnPwd">변경</button>
                         <span class="txtSub" id="pwdChk" style="display:none;">영문, 숫자, 특수문자 조합 10~16자리</span>
                    </div>
                    <div class="formBox" >
                        <input type="password" class="itxt" id="password2" name="pwd2" placeholder="비밀번호 재 입력" />
                        <label class="title" for="password2">비밀번호 재 입력</label>
                         <span class="txtSub" id="pwd2Chk" style="display:none;">비밀번호가 일치하지 않습니다.</span>
                    </div>
                    <!--//아이디및 비밀번호입력-->
                    <!--생일 생년월일//-->
                    <div class="formBox birthday noEdit" >
                         <label class="title year" for="selectborn1">생년</label>
                         <select class="year" id="selectborn1">
                            <option value="">생년</option>
                            <option  disabled="disabled" selected="selected">${memberList.birthY }</option>
                        </select>
                        <label class="title month" for="selectborn2">월</label>
                        <select class="month" id="selectborn2">
                            <option value="" >월</option>
                            <option disabled="disabled" selected="selected">${memberList.birthM }</option>
                        </select>
                        <label class="title day" for="selectborn3">일</label>
                        <select class="day"  id="selectborn3">
                            <option value="" disabled="disabled" selected="selected">일</option>
                            <option disabled="disabled" selected="selected">${memberList.birthD }</option>
                        </select>
                    </div>
                    <!--//생일 생년월일-->
                    <!--성별구분//-->
                    <div class="formBox sexSelect noEdit">
                        <span class="title" >성별</span>
                        <input type="radio"  id="r1" name="rr" onclick="return(false);" <c:if test="${memberList.sex eq '남' }"> checked </c:if> /><label for="r1"><span></span>남자</label>
                        <input type="radio"  id="r2" name="rr" onclick="return(false);"  <c:if test="${memberList.sex eq '여' }"> checked </c:if> /><label for="r2"><span></span>여자</label>
                    </div>
                    <!--//성별구분-->
                    <!--휴대폰 인증번호//-->
                    <div class="formBox pNumber_01" >
                        <input type="tel" class="itxt" id="telnumber" disabled="true" name="tel" placeholder="휴대폰 번호" maxlength="14" value="${memberList.tel }" />
                        <input type="hidden" name="tel" value="${memberList.tel }"/>
                        <label class="title" for="telnumber">전화번호</label>
                        <button class="btn" id="btnTel">변경</button>
                        <!-- <span class="txtSub">휴대폰 번호를 정확하게 입력하세요.</span> -->
                    </div>
                <!--     <div class="formBox pNumber_02" >
                        <input type="tel" class="itxt" id="telnumber" placeholder="인증번호 입력" maxlength="14" />
                        <label class="title" for="telnumber">인증 번호</label>
                        <span class="time">03:00</span>
                        <button class="btn">확인</button>
                        <span class="txtSub">인증번호가 카카오톡 알림톡으로 발송되었습니다. </span>
                    </div> -->
                    <!--//휴대폰 인증번호-->
                    <!--이메일//
                    <div class="formBox eMail" >
                        <input type="text" class="itxt" id="email" placeholder="이메일 주소"  />
                        <label class="title" for="email">이메일 주소</label>
                        <span class="txt">@</span>
                        <select id="email">
                            <option value="00" disabled="disabled" selected="selected">선택</option>
                            <option value="01">daum.net</option>
                            <option value="02">hanmail.net</option>
                            <option value="03">naver.com</option>
                            <option value="04">gmail.com</option>
                            <option value="05">yahoo.co.kr</option>
                            <option value="06">hotmail.com</option>
                            <option value="07">nate.com</option>
                            <option value="99">직접입력</option>
                        </select>
                    </div>
                    <div class="formBox eMail" >
                        <input type="text" class="itxt" id="email" placeholder="이메일 주소"  />
                        <label class="title" for="email">이메일 주소</label>
                        <span class="txt">@</span>
                        <input type="text" class="itxtMail" id="email" placeholder="직접입력"  />
                    </div>
                    이메일-->
                    <button class="button blue big mt_40" id="btnRegist" >확인</button>
                </form>
            </div>
            <!--//개인정보 수정  전체-->
        </div>
        <!--//컨텐츠 본문-->
    </div>
    <!--//웹영역 전체-->
    <script>
    	
    	document.querySelector("#btnPwd").addEventListener("click", (e) => {
    		e.preventDefault();
    		document.querySelector("#password").disabled = false;
    		 document.querySelector("#btnRegist").addEventListener("click", (e) => {
     	    	
        		 e.preventDefault();
        		 
        	        let pwd = document.querySelector("#password");
        	        let pwd2 = document.querySelector("#password2");
        	        
        	        let pwdChk = document.querySelector("#pwdChk");
        	        let pwd2Chk = document.querySelector("#pwd2Chk");
        	        
        	        
        	        let frm = document.querySelector("#frm");
        	        
        	        
        	       
        	    	
        	        	
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
        	       		 frm.submit();
        	       	 }
        	    });
    	});
    	document.querySelector("#btnTel").addEventListener("click", (e) => {
    		e.preventDefault();
    		document.querySelector("#telnumber").disabled = false;
    	});
    	
    	
    	
    </script>
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/edit_myinfo_01.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>
