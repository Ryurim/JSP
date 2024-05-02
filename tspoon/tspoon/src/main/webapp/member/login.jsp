<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import = "common.CookieUtil" %>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
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
            <h1>로그인</h1>
            <jsp:include page="/common/menu.jsp"/>
            <!-- <span class="btnSide"><a href="#">좌측메뉴 펼침</a></span>
        </div> -->
        <!--//해더영역-->
        <!--컨텐츠 본문//-->
        <form id="content" action="/tspoon/member/login.do" method="post">
            <!--로그인 전체//-->
            <div  class="loginWrap">
                <h2>T SPOON, 밀크T 학부모 아이디로<br/>로그인 하실 수 있습니다.</h2>
                 <c:if test="${not empty loginErrMsg}">
					<span style="color: red; font-size: 10px; font-weight: bold;">${loginErrMsg}</span>
				</c:if> 
                <div class="formBox">
                    <input type="text" class="itxt" id="idn" name="idn" placeholder="아이디"  value="<%=CookieUtil.getCookieInfo(request, "id") %>" />
                    <label class="title" for="idn" >아이디</label>
                </div>
               <div class="formBox">
                    <input type="password" class="itxt" id="password" name="password" placeholder="비밀번호" value="<%=CookieUtil.getCookieInfo(request, "pwd") %>" />
                    <label class="title" for="password" >비밀번호</label>
                </div>
                
                <div class="saveLog">
                    <input type="checkbox"  id="saveid" name="saveid" value="Y" <%= (CookieUtil.getCookieInfo(request, "saveid")).equals("Y") ? "checked" : ""%>  />
                    <label for="saveid"><span></span>로그인 상태 유지</label>
                </div>
               <button id="btnRegist" class="button blue big">로그인</button>
               
               <ul class="bottomMenu">
                    <li><a href="/tspoon/member/search.do" target="_self">아이디 찾기</a></li>
                    <li><a href="/tspoon/member/searchPwd.do" target="_self">비밀번호 찾기</a></li>
                    <li><a href="/tspoon/member/join.do" target="_self">가입하기</a></li>
               </ul>

               <p class="btn_privacyPolicy"><a href="#">개인정보 처리방침 &gt;</a></p>

               <!-- <a href="#" class="button white big"  style="padding:20px 0;font-size:1rem;text-align:center;position:absolute;left:0;bottom:10px;width:90%;margin-left:5%;">쿠키 삭제 클릭(추후 오픈시에는 삭제예정)</a>
 -->

            </div>
            <!--//로그인 전체-->
        </form>
        <!--//컨텐츠 본문-->
    </div>
    <!--//웹영역 전체-->
    <script>
    	document.querySelector("#btnRegist").addEventListener("click", (e) => {
	        const frm = document.querySelector("#content");
	        const id = document.querySelector("#idn");
	        const pwd = document.querySelector("#password");
	
	        if (id.value.length == 0 || pwd.value.length == 0) {
	            alert("아이디 또는 비밀번호는 필수 항목입니다.");
	            e.preventDefault();
	            return false;
	        
	  /*      else {
	        	if ("${not empty LoginErrMsg}") {
	    			alert("아이디 또는 비밀번호가 적절하지 않거나 등록된 아이디가 아닙니다.");
	    			 */
	    		} else { 
	
	            	frm.submit();
	    		}
	       /*  } */
			
	    });
    
    </script>
    
    
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>
