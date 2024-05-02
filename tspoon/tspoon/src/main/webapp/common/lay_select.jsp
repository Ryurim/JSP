<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/common/lay_select.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:28:11 GMT -->
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
            <h1>학습리포트</h1>
            <span class="btnSide"><a href="#">좌측메뉴 펼침</a></span>
        </div>
        <!--//해더영역-->
        <!--컨텐츠 본문//-->
        <div id="content">
            <!--학습리포트 전체//-->
            <div class="reportWrap" style="background:#fff;padding:0 7%">
                <button class="button blue big mt_100 openMask">자녀선택 레이어</button>
            </div>
            <!--//학습리포트 전체-->
        </div>
        <!--//컨텐츠 본문-->
        <!--자녀선택레이어//-->
        <script>
        function wrapWindowByMask(){
            //화면의 높이와 너비를 구한다.
            var maskHeight = $(document).height();  
            var maskWidth = $(window).width();  

            //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
            $('#mask').css({'width':maskWidth,'height':maskHeight});  

            //애니메이션 효과 - 일단 0.5초동안 까맣게 됐다가 80% 불투명도로 간다.
            $('#mask').fadeIn(500);      
            $('#mask').fadeTo("slow",0.4);    
            $('.window').show();
        }

        $(document).ready(function(){
            //검은 막 띄우기
            $('.openMask').click(function(e){
                e.preventDefault();
                wrapWindowByMask();
            });

            //닫기 버튼을 눌렀을 때
            $('.window .close').click(function (e) {  
                //링크 기본동작은 작동하지 않도록 한다.
                e.preventDefault();  
                $('#mask, .window').hide();  
            });       

            //검은 막을 눌렀을 때
            $('#mask').click(function () {  
                $(this).hide();  
                $('.window').hide();  
            });      
        });
        </script>
        <div id="mask"></div>
        <div class="window laySelect">
            <h3>자녀선택<h3>
            <ul>
                <li class="star"><input type="radio"  id="r1" name="rr"  /><label for="r1">김밀크 (jennyyy)<span></span></label></li>
                <li><input type="radio"  id="r2" name="rr" /><label for="r2">김초등 (milkt20060706)<span></span></label></li>
                <li><input type="radio"  id="r3" name="rr" /><label for="r3">검정영역닫기 (1236)<span></span></label></li>
            </ul>
            <a href="#" class="link">지금 밀크T 자녀를 등록해 보세요   &gt;</a>
            <button class="button blue big mt_20">확인</button>
        </div>
        <!--//자녀선택레이어-->
    </div>
    <!--//웹영역 전체-->
    
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/common/lay_select.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:28:11 GMT -->
</html>
