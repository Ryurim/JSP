<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/join.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
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
            <h1>가입하기</h1>
            <jsp:include page="/common/menu.jsp"/>
            <!-- <span class="btnSide"><a href="#">좌측메뉴 펼침</a></span>
        </div> -->
        <!--//해더영역-->
        <!--컨텐츠 본문//-->
        <div id="content">
            <!--가입하기 전체//-->
            <form  class="joinWrap" id="frm" action="/tspoon/member/join.do" method="post">
                <h2>T SPOON ID로<br/>밀크T 모든 사이트를 모두 이용하실 수 있습니다.</h2>
                <!--아이디및 비밀번호입력//-->
                <!--수정불가한 입력값은 noEdit 클래스추가-->
                <!--<div class="formBox noEdit">
                    <input type="text" class="itxt" id="iname" name="iname" placeholder="이름" disabled="disabled" value="불러온 수정불가 영역표시" />
                    <label class="title" for="iname">이름</label>
                </div>
                -->
                <h3 class="condition">필수 정보</h3>
                <div class="formBox">
                    
                    <input type="text" class="itxt" id="iname" name="iname" placeholder="이름"/>
                    <label class="title" for="iname">이름</label>
                    <span class="txtSub" style="display:none;" id="nameChk" >이름을 입력해주세요.</span>
                </div>
                <div class="formBox">
                    <input type="text" class="itxt" id="idn" name="idn" placeholder="아이디" />
                    <label class="title" for="idn">아이디</label>
                    <span class="txtSub" id="idChk"><c:if test="${not empty requestScope.idErr }"> 이미 등록된 아이디 입니다.</c:if></span>
                </div>
               <div class="formBox" >
                    <input type="password" class="itxt" id="password" name="password" placeholder="비밀번호 (영문, 숫자, 특수문자 조합 10~16자리)" />
                    <label class="title" for="password">비밀번호</label>
                    <span class="txtSub" style="display:none;" id="pwdChk">비밀번호를 정확하게 입력하세요.</span>
                </div>
                <div class="formBox" >
                    <input type="password" class="itxt" id="password2" name="password2" placeholder="비밀번호 재 입력" />
                    <label class="title" for="password2">비밀번호 재 입력</label>
                    <span class="txtSub" style="display:none;" id="pwd2Chk">비밀번호가 일치하지 않습니다.</span>
                </div>
                <!--//아이디및 비밀번호입력-->
                <!--생일 생년월일//-->
                <div class="formBox birthday" >
                     <label class="title year" for="selectborn1">생년</label>
                     <select class="year" id="selectborn1" name="birthY">
                        <option value="" disabled="disabled" selected="selected">생년</option>
                        <c:forEach var="i" begin="1950" end="2000" step="1">
                        	<option value="${i }">${i}</option>
                        </c:forEach>
                    </select>
                    <label class="title month" for="selectborn2">월</label>
                    <select class="month" id="selectborn2" name="birthM">
                        <option value="" disabled="disabled" selected="selected">월</option>
                        <c:forEach var="i" begin="1" end="12" step="1">
                        	<option value="${i}">${i}</option>
                        </c:forEach>
                    </select>
                    <label class="title day" for="selectborn3">일</label>
                    <select class="day"  id="selectborn3" name="birthD">
                        <option value="" disabled="disabled" selected="selected">일</option>
                      		<c:forEach var="i" begin="1" end="31" step="1">
		                        	<option value="${i }">${i}</option>
		                    </c:forEach>
                    </select>
                    <span class="txtSub" style="display:none;" id="birthChk">만 14세 미만은 회원 가입이 불가합니다.</span>
                </div>
                <!--//생일 생년월일-->
                <!--휴대폰 인증번호//-->
                <div class="formBox pNumber_01" >
                    <input type="tel" class="itxt" id="telnumber" name="telnumber" placeholder="휴대폰 번호" maxlength="14" />
                    <label class="title" for="telnumber">휴대폰 번호</label>
                    <!-- <button class="btn">인증번호</button> -->
                    <span class="txtSub" style="display:none;" id="telChk">휴대폰 번호를 정확하게 입력하세요.</span>
                </div>
                <!-- <div class="formBox pNumber_02" >
                    <input type="tel" class="itxt" id="telnumber" placeholder="인증번호 입력" maxlength="14" />
                    <label class="title" for="telnumber">인증 번호</label>
                    <span class="time">03:00</span>
                    <button class="btn">확인</button>
                    <span class="txtSub">인증번호가 카카오톡 알림톡으로 발송되었습니다. </span>
                </div> -->
                <!--//휴대폰 인증번호-->
                <!--이메일-->
                <div class="formBox eMail" id="emailSelect" >
                    <input type="text" class="itxt" id="email" name = "emailId" placeholder="이메일 주소"  />
                    <label class="title" for="email">이메일 주소</label>
                    <span class="txt">@</span>
                    <select id="email" name="emailDomain" onchange="typeEmail(this)">
                        <option value="00" disabled="disabled" selected="selected">선택</option>
                        <option value="daum.net">daum.net</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="naver.com">naver.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="yahoo.co.kr">yahoo.co.kr</option>
                        <option value="hotmail.com">hotmail.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="99">직접입력</option>
                    </select>
                    <span class="txtSub" style="display:none;"  id="emailChk">이메일을 입력하세요.</span>
                </div>
                <div class="formBox eMail" id="typing" style="display:none;" style="display:none;">
                    <input type="text" class="itxt" id="email" name = "emailId" placeholder="이메일 주소"  />
                    <label class="title" for="email">이메일 주소</label>
                    <span class="txt">@</span>
                    <input type="text" class="itxtMail" id="email" name="emailDomain" placeholder="직접입력"  />
                    <span class="txtSub" style="display:none;"  id="emailChk">이메일을 입력하세요.</span>
                </div> 
                
                <!--이메일-->
                <!--관심분야선택
                <div class="formBox atten" >
                    <label class="title" for="atten">관심분야 선택</label>
                    <select id="atten">
                        <option value="" disabled="disabled" selected="selected">관심분야 선택</option>
                        <option value="01">유/초등</option>
                        <option value="02">중/고등</option>
                    </select>
                </div>
                관심분야선택-->
                <!--학년//-->
                <div class="formBox changeid">
                    <label class="title year" for="interest">관심분야</label>
                    <select class="year" id="interest" name="interest" onchange="changeSelect(this)">
                        <option value="" selected="selected">관심분야 선택</option>
                        <option value="유아" >유아</option>
                        <option value="초등" >초등</option>
                        <option value="중학" >중학</option>
                        <option value="고등" >고등</option>
                    </select>
                    <label class="title year" for="grade"></label>
                    <select class="year01" id="grade" name="grade">
                        <option value="" disabled="disabled" selected="selected">학년</option>
                        
                    </select>
                 
                </div>
                <!--//학년-->
                <h3 class="condition">선택 사항</h3>
                <!--성별구분//-->
                <div class="formBox sexSelect">
                    <span class="title" >성별</span>
                    <input type="radio"  id="r1" name="rr" value="남" /><label for="r1"><span></span>남자</label>
                    <input type="radio"  id="r2" name="rr" value = "여"/><label for="r2"><span></span>여자</label>
                    <!-- <span class="txtSub">성별을 선택해주세요.</span> -->
                </div>
                <!--//성별구분-->
                <!--이용약관 동의//-->
                <div class="agreeBox ">
                    <dl>
                        <dt>
                            <input type="checkbox"  id="checkall" name=""  />
                            <label for="checkall"><span></span>통합 이용약관, 개인정보수집 및 이용, 위치정보이용약관 (선택), 프로모션  전화 및 SMS 안내수신 (선택), 개인정보 제 3자 제공동의 (선택),에모두 동의 합니다.</label>
                        </dt>
                        <dd>
                            <input type="checkbox"  id="cc1" name=""  />
                            <label for="cc1"><span></span>통합 이용약관 (필수)</label>
                            <span class="moreBtn"><a href="#none" onclick="javascript:alert('어드민등록한거 새창 열림')">전문보기</a></span>
                        </dd>
                        <dd>
                            <input type="checkbox"  id="cc2" name=""  />
                            <label for="cc2"><span></span>개인정보 수집·이용 동의 (필수)</label>
                            <span class="moreBtn"><a href="#none" onclick="javascript:alert('어드민등록한거 새창 열림')">전문보기</a></span>
                        </dd>
                        <dd>
                            <input type="checkbox"  id="cc3" name=""  />
                            <label for="cc3"><span></span>위치정보 이용약관 (선택)</label>
                            <span class="moreBtn"><a href="#none" onclick="javascript:alert('어드민등록한거 새창 열림')">전문보기</a></span>
                        </dd>
                        <dd>
                            <input type="checkbox"  id="cc4" name=""  />
                            <label for="cc4"><span></span>마케팅 활용동의 (선택)</label>
                            <span class="moreBtn"><a href="#none" onclick="javascript:alert('어드민등록한거 새창 열림')">전문보기</a></span>
                            <!-- <ul class="moreChk">
                                <li><input type="checkbox" id="agreeEmail" name="agreeEmail"><label for="agreeEmail"><span></span>이메일</label></li>
                                <li><input type="checkbox" id="agreeSms" name="agreeSms"><label for="agreeSms"><span></span>SMS</label></li>
                                <li><input type="checkbox" id="agreePhone" name="agreePhone"><label for="agreePhone"><span></span>전화</label></li>
                            </ul> -->
                        </dd>
                        <dd>
                            <input type="checkbox"  id="cc5" name=""  />
                            <label for="cc5"><span></span>제3자 제공동의 (선택)</label>
                            <span class="moreBtn"><a href="#none" onclick="javascript:alert('어드민등록한거 새창 열림')">전문보기</a></span>
                        </dd>
                        <dd class="disabled">
                            <input type="checkbox"  id="cc6" name=""  />
                            <label for="cc6"><span></span>천재교육 이용약관 동의 (선택)</label>
                            <span class="moreBtn"><a href="#none" onclick="javascript:alert('어드민등록한거 새창 열림')">전문보기</a></span>
                        </dd>
                    </dl>
                </div>
				<p class="txt_02 center">※ 데이터 집계 작업으로 인해 자녀 등록이 불가능한 경우, 5분 후에 이용 부탁드립니다.</p>
                <!--//이용약관 동의-->
                <button id="btnRegist" class="button blue big bold">가입하기</button>
            </form>
            <!--//가입하기 전체-->
        </div>
        <!--//컨텐츠 본문-->
    </div>
    <!--//웹영역 전체-->
    <script>
    	let name = document.querySelector("#iname");
        let id = document.querySelector("#idn");
        let pwd = document.querySelector("#password");
        let pwd2 = document.querySelector("#password2");
        let birthY = document.querySelector("#selectborn1");
        let birthM = document.querySelector("#selectborn2");
        let birthD = document.querySelector("#selectborn3");
        let tel = document.querySelector("#telnumber");
        let email = document.querySelector("#email");
        let interest = document.querySelector("#interest");
        let grade = document.querySelector("#grade");
        let emailSelect = document.querySelector("#emailSelect");
        let typing = document.querySelector("#typing");
        let frm = document.querySelector("#frm");
        
        // 밸리데이션체크 준비 
       let nameChk = document.querySelector("#nameChk");
       let idChk = document.querySelector("#idChk");
       let pwdChk = document.querySelector("#pwdChk");
       let pwd2Chk = document.querySelector("#pwd2Chk");
       let birthChk = document.querySelector("#birthChk");
       let telChk = document.querySelector("#telChk");
       let emailChk = document.querySelector("#emailChk");

       // 이름 체크
       name.addEventListener("keyup", ()=> {
    	   noSpaceForm(name);
    	   characterCheck(name);
    	   numberCheck(name);
       });
		name.addEventListener("change", () => {
    	   noSpaceForm(name);
    	   characterCheck(name);
    	   numberCheck(name);
       });
		
       
       //공백체크
       function noSpaceForm(obj) { // 공백사용못하게
		    var regExp = /\s/;  // 공백체크
		    if(regExp.test(obj.value)) { //공백 체크
		        alert("이름에는 공백을 사용할수 없습니다.");
		        obj.focus();
		        obj.value = obj.value.replace(/\s| /gi,''); // 공백제거
		        return false;
		    }
		} 
       
    	// 특수문자 입력 방지
       function characterCheck(obj){
	       var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 
	       // 허용할 특수문자는 여기서 삭제하면 됨
	       // 지금은 띄어쓰기도 특수문자 처리됨 참고하셈
	       if( regExp.test(obj.value) ){
	       	alert("이름에 특수문자를  없습니다.");
	        obj.focus();
	       	obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
	       	}
       }
    	
    	//숫자 입력 방지
    	function numberCheck(obj) {
    		var regExp = /\d/;
    		if (regExp.test(obj.value)) {
    			alert("이름에 숫자를 넣을 수 없습니다.");
    			 obj.focus();
    			obj.value = obj.value.substring(0, obj.value.length - 1);
    		}
    	}
    	
    	//한글 잘 써넣기 
    	function hanCheck(obj) {
    		var regExp = /[ㄱ-ㅎㅏ-ㅣ]/gi;
    		if (regExp.test(obj.value)) {
    			alert("정규 한글 표현만 가능합니다.");
    			obj.value = obj.value.substring(0, obj.value-length - 1);
    		}
    	}
    	
   		var regularHanCheck = /[ㄱ-ㅎ|ㅏ-ㅣ]/gi;
   		var hanCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힇]/;
   		var expCheck = /[~!@#\#$%<>^&*]/;
   		var numCheck = /[0-9]/;
   		var engCheck = /[a-zA-Z]/;
    	
   
    	
    	
    	
    	
    	
       
       document.querySelector("#btnRegist").addEventListener("click", (e) => {
    	   let name = document.querySelector("#iname");
           let id = document.querySelector("#idn");
           let pwd = document.querySelector("#password");
           let pwd2 = document.querySelector("#password2");
           let birthY = document.querySelector("#selectborn1");
           let birthM = document.querySelector("#selectborn2");
           let birthD = document.querySelector("#selectborn3");
           let tel = document.querySelector("#telnumber");
           let email = document.querySelector("#email");
           let interest = document.querySelector("#interest");
           let grade = document.querySelector("#grade");
           let radio = document.querySelectorAll("input[type='radio']");
           let cc1 = document.querySelector("#cc1");
           let cc2 = document.querySelector("#cc2");
           
           
    	   e.preventDefault();
    	   
    	 //이름 비어있을 때
    	   if (name == null || name.value.length == 0) {
    		   nameChk.style.display = "block";
    		   name.focus();
    		   return false;
    	   }
    	 //아이디 비어있을 때 
    	   if (id == null || id.value.length == 0) {
    		   idChk.style.display = "block";
    		   id.focus();
    		   return false;
    	   }
    	 
    	 //비밀번호 비어있을 때 
    	 if (pwd == null || pwd.value.length == 0) {
    		 alert("비밀번호를 입력하세요. ");
    		 pwd.focus();
    		 return false;
    	 }
    	 
    	 
    	 //비밀번호 재입력 비어있을 때
    	if (pwd2 == null || pwd2.value.length == 0) {
    		alert("비밀번호 재입력을 확인해 주세요.");
    		pwd2.focus();
    		return false;
    	}
    	 // 생년월일 비어있을 때 
    	 if (birthY == null || birthY.value.length == 0) {
    		alert("생년월일을 선택해 주세요.");
    		 birthY.focus();
    		 return false;
    	 }
    	 if (birthM == null || birthM.value.length == 0) {
     		alert("생년월일을 선택해 주세요.");
    		 birthM.focus();
    		 return false;
    	 }
    	 if (birthD == null || birthD.value.length == 0) {
     		alert("생년월일을 선택해 주세요.");
    		 birthD.focus();
    		 return false;
    	 }
    	 // 휴대번호 비어있을 때
    	 if (tel == null || tel.value.length == 0) {
    		 telChk.style.display = "block";
    		 tel.focus();
    		 return false;
    	 }
    	 
    	 // 이메일 비어있을 때
    	 if (email == null || email.value.length == 0) {
    		 emailChk.style.display = "block";
    		 email.focus();
    		 return false;
    	 }
    	 
    	 //관심분야 비어있을 때
    	 if (interest == null || interest.value.length == 0) {
     		alert("관심사항을 선택해 주세요.");
    		 interest.focus();
    		 return false;
    	 }
    	 
    	 // 학년 비어있을 때 
    	 if (grade == null || grade.value.length == 0) {
     		alert("학년을 선택해 주세요.");
    		 grade.focus();
    		 return false;
    	 }
    	 //성별 체크
    	 var cnt = 0;
    	 for (var i=0; i<radio.length; i++) {
    		 if (radio[i].checked == true) {
    			 cnt++;
    		 }
    	 }
    	 if (cnt < 1) {
     		alert("성별을 선택해 주세요.");
    		 return false;
    	 }
    	 
    	 //필수항목 체크 
    	 if (!cc1.checked || !cc2.checked) {
     		alert("필수 항목을 체크해 주세요.");
    		 return false;
    	 }  
    	  
    	 // 이름 정규 한글 표현 
    	 if (regularHanCheck.test(name.value)) {
 			alert("이름은 정규 한글 표현만 가능합니다.");
 			return false;
 		}
    	 
    	 //이름 영문 또는 한글만 가능
    	 if (engCheck.test(name.value) && hanCheck.test(name.value)) {
    		 alert("이름은 영어 또는 한글 둘 중 하나만 사용 가능합니다.");
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
    		alert("T ClASS 회원가입이 완료되었습니다.");
    	   	frm.submit();
    	   }
    	  
       }, false);
       
       
        
        
        
        
        
        
        //약관 전체선택
        let chkAll = document.querySelector("#checkall");
        chkAll.addEventListener("click", (e) => {
			var check = document.querySelectorAll("input[type ='checkbox']");
    		check.forEach((checkbox) => {
    		    checkbox.checked = chkAll.checked;
    		  });
        });
        
        // 이메일 직접입력 선택했을 시 
        function typeEmail(el) {
            if (el.value == 99) {
                emailSelect.style.display="none";
                typing.style.display = "block";
            }
        }
        
        // 셀렉트 옵션 변경
        const selectArr = ["유아", "초등", "중학", "고등"];

        const optionArr = [
    		["7세 이하"],
    		["1학년", "2학년", "3학년", "4학년", "5학년", "6학년"],
    		["중1", "중2", "중3"],
    		["고1", "고2", "고3"]
    	];

        function changeSelect(el) {
            for (var i=0; i<selectArr.length; i++) {
                if (el.value == selectArr[i]) {
                    $("select#grade option").remove();
                    $("select#grade").append("<option value='' disabled='disabled' selected='selected'>학년</option>");
                    for (var j=0; j<optionArr[i].length; j++) {
                        var option = document.createElement("option");
                        option.value = optionArr[i][j];
                        option.text = optionArr[i][j];
                        console.log(option.value);
                        console.log(option);
                        console.log(grade);
                        grade.appendChild(option);
                    }
                }
            }
        }

        

    </script>
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/join.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>

