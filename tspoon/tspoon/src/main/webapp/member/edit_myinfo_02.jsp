<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/edit_myinfo_02.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
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
        <!-- 해더영역//-->
        <div id="header">
            <h1>개인정보수정</h1>
            <jsp:include page="/common/menu_login.jsp"/>
           <!--  <span class="btnSide"><a href="#">좌측메뉴 펼침</a></span>
        </div> -->
        <!--컨텐츠 본문//-->
        <div id="content">
            <!--개인정보 수정 전체//-->
            <div  class="editPageWrap">
                <div  class="tabPassWordWrap">
                    <div class="editPage">
                        <div class="tabPassWord">
                            <img src="/tspoon/ext/cdndata.milkt.co.kr/ele/tspoon/Images/common/tabpassword.jpg" alt="밀크T탭 학부모 비밀번호 설정">
                            <a href="#"></a>
                        </div>

                        <!--아이디및 비밀번호입력//-->
                        <div class="formBox noEdit mt_10 memberChange"><!--수정불가 noEdit 추가-->
                            <input type="text" class="itxt" id="iname" name="iname" placeholder="이름" disabled="disabled" value="홍길동" />
                            <label class="title" for="iname">이름</label>
                            <button class="btn">자녀 정보가 다른가요?</button>
                            <span class="txtSub">*영문, 숫자, 특수문자 조합 가능합니다.</span>
                        </div>
                       <div class="formBox pwChange mt_60">
                            <input type="password" class="itxt" id="password" placeholder="비밀번호 (영문, 숫자, 특수문자 조합 10~16자리)" />
                            <label class="title" for="password">비밀번호</label>
                        </div>
                        <div class="formBox" >
                            <input type="password" class="itxt" id="password2" placeholder="비밀번호 재 입력" />
                            <label class="title" for="password2">비밀번호 재 입력</label>
                        </div>
                        <!--//아이디및 비밀번호입력-->

                        <button class="button blue big mt_40" onclick="location.href='/tspoon/main/index.do' ">설정 완료</button>
                    </div>
                </div>
            </div>
            <!--//개인정보 수정  전체-->
        </div>
        <!--//컨텐츠 본문-->
    </div>
    <!--//웹영역 전체-->
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/member/edit_myinfo_02.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>
