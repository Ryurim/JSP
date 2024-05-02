<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/search_id.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
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
            <h1>아이디 찾기</h1>
            <jsp:include page="/common/menu.jsp"/>
            <!-- <span class="btnSide"><a href="#">좌측메뉴 펼침</a></span>
        </div> -->
        <!--//해더영역-->
        <!--컨텐츠 본문//-->
        <div id="content">
            <!--아이디찾기 전체//-->
            <form  class="idSerachWrap" method="post" action="/tspoon/member/search.do">
                <h2>T SPOON , 밀크T 아이디 찾기가 가능합니다.<br>등록한 이름과 휴대폰 번호를 입력하세요.</h2>
                <div class="formBox mt_40">
                    <input type="text" class="itxt" id="iname" name="iname" placeholder="이름" />
                    <label class="title" for="iname">이름</label>
                </div>
               <div class="formBox">
                    <input type="tel" class="itxt" id="tel" name="tel" placeholder="휴대폰 번호" />
                    <label class="title" for="tel">휴대폰 번호</label>
                </div>
                <button class="button blue big" >아이디 찾기</button>
            </form>
            <!--//아이디찾기 전체-->
        <!--//컨텐츠 본문-->
    </div>
    <!--//웹영역 전체-->
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/search_id.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>
