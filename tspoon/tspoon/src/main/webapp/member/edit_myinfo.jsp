<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/edit_myinfo.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
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
            <!--개인정보수정 전체//-->
            <form  class="editMyinfoWrap" action="/tspoon/member/edit.do" method="post">
                <h2>본인 확인을 위해 비밀번호를 입력해 주세요.</h2>
                <div class="formBox mt_50 noEdit"><!--수정불가 noEdit 추가-->
                    <input type="text" class="itxt" id="idn" name="idn" placeholder="아이디" disabled="disabled" value="${sessionScope.id }"  />
                    <input type="hidden" name="id" value="${sessionScope.id }"/>
                    <label class="title" for="idn">아이디</label>
                </div>
               <div class="formBox" >
                    <input type="password" class="itxt" id="password" name="pwd" placeholder="비밀번호" />
                    <label class="title" for="password">비밀번호</label>
                    <c:if test="${not empty errMsg }"><span class="txtSub">비밀번호를 정확하게 입력하세요.</span></c:if>
                    
                </div>
                <button class="button blue big mt_40" >확인</button>
                <p class="subLink mt_50"><a href="/tspoon/member/searchPwd.do" target="_self">비밀번호 찾기</a></p>
            </form>
            <!--//개인정보수정  전체-->
        </div>
        <!--//컨텐츠 본문-->
    </div>
    <!--//웹영역 전체-->
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/edit_myinfo.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>
