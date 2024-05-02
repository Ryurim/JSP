<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/main/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:14:14 GMT -->
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
            <h1>T SPOON</h1>
            <span class="btnSide"><a href="#" onClick="openNav()">전체메뉴 열기</a></span>
        </div>
        <!--//해더영역-->
        <!--전체메뉴//-->
        <div id="mySidenav" class="sidenav" >
            <!--전체메뉴 해더//-->
            <div class="navHeader">
                <span class="closebtn"><a href="javascript:void(0)" onClick="closeNav()">전체메뉴 닫기</a></span>
                <h2>T SPOON</h2>
                <span class="setBtn"><a href="#none" onClick="alert('환경설정 APP');return false;">환경설정</a></span>
            </div>
            <!--//전체메뉴 해더-->
            <!--전체메뉴 컨텐츠//-->
            <div class="navContent">
                <!--미 로그인 시//-->
                <div class="userStatus_02">
                    <p class="photo"><img src="/tspoon/ext/cdndata.milkt.co.kr/ele/tspoon/Images/common/img_profile_noimg.png" alt="" /></p>
                    <button class="btnLogin">로그인</button>
                </div>
                <!--//미 로그인 시-->
                <!-- 로그인 상태
                <div class="userStatus">
                    <p class="photo"><img src="//cdndata.milkt.co.kr/ele/tspoon/Images/common/img_profile_tmp.png" alt="내 프로필 이미지" /></p>
                    <p class="name">홍길동</p>
                    <button class="btnLogOut">로그아웃</button>
                </div>
                 -->
                <!-- <div class="menuStyle_01 nochild">
                    <ul>
                        <li><a>쪽지<span>+99</span></a></li>
                        <li><a>1:1<br>게시판</a></li>
                        <li><a href="" target="_self">자녀<br>등록</a></li>
                        <li><a>결제<br>정보</a></li>
                        <li><a>전용교재<br>배송정보</a></li>
                    </ul>
                </div> -->
                <div class="menuStyle_02">
                  <h3>T알쓸신잡</h3>
                  <ul>
                    <li class="ico_edu"><a href="#" target="_self">교육정보</a></li>
                    <li class="ico_info"><a href="#" target="_self">밀크T정보</a><span class="translation">다국어 지원</span></li>
                    <!-- <li class="ico_che"><a href="" target="_self">메디컬 콘서트</a></li>
        						<li class="ico_health"><a href="" target="_self">건강정보</a></li> -->
                    <li class="ico_bnh"><a href="#" target="_self">뷰티앤헬스</a></li>
        						<li class="ico_shop"><a href="#" target="_self">T SHOP</a></li>
                    <li class="ico_food"><a href="#" target="_self">학교급식</a></li>
                    <li class="ico_note"><a href="#" target="_self">학교알림장</a></li>
        						<li class="ico_map"><a href="#" target="_self">학원추천</a></li>
                  </ul>
                </div>
                <!--<div class="menuStyle_02 nochild">
                    <h3>학습리포트</h3>
                    <ul>
                        <li class="ico_day"><a>출석현황</a></li>
                        <li class="ico_sc"><a>학습계획표</a></li>
                        <li class="ico_progress"><a>학습현황</a></li>
                        <li class="ico_jindo"><a>진도조정요청</a></li>
                    </ul>
                </div>-->
                <!-- 배너 영역// -->
                <div class="menu_bnr">
                	<a href="#"><img src="/tspoon/ext/cdndata.milkt.co.kr/ele/tspoon/Images/common/menu_bnr_200514.jpg" alt="코로나19 이후 경제전망"></a>
                </div>
                <!-- //배너 영역 -->
                <div class="menuStyle_03">
                    <h3>T플레이</h3>
                    <ul>
                        <li class="ico_tv"><a href="#" target="_self"><span>밀크TV</span></a></li>
                        <li class="ico_game"><a href="#" target="_self"><span>밀크T게임</span></a></li>
                        <li class="ico_ai"><a href="#" target="_self"><span>AI 평가</span></a></li>
                        <li class="ico_story"><a href="#" target="_self"><span>말하는 동화책</span></a></li>
                        <li class="ico_dictation"><a href="#" target="_self"><span>AI 받아쓰기</span></a></li>
                        <li class="ico_trial"><a href="#" target="_self"><span>밀크T 맛보기</span></a></li>
                    </ul>
                </div>
            </div>
            <!--//전체메뉴 컨텐츠-->

        </div>
        <!--//전체메뉴-->
        <!--컨텐츠 본문//-->
        <div id="contentMain">
            <!--메인 전체//-->
            <div class="mainWrap">
                <div class="swiper-container-main">
                    <div class="swiper-wrapper">
                        <!--왼쪽 학부모 컨텐츠메뉴//-->
                        <div class="swiper-slide leftWrap">
                            <h3><img src="/tspoon/ext/cdndata.milkt.co.kr/ele/tspoon/Images/common/main_top_left.png" alt="엄마를 위한 알찬 정보만 모아둔 밀크T 특별 콘텐츠!"></h3>
                            <ul>
                                <li class="menu_eduInfo"><a href="#">교육정보</a></li>
								<li class="menu_milktInfo"><a href="#">밀크T 정보</a></li>
								<li class="menu_foodInfo"><a href="#">학교급식</a></li>
								<li class="menu_classNotice"><a href="#">학교알림장</a></li>
								<!---li class="menu_"><a href="#">말하는 동화책</a></li><!-- 200409추가 -->
								<li class="menu_mall"><a href="#">T SHOP</a></li>
								<!-- <li class="menu_medical"><a href="#">메디컬 콘서트</a></li>
								<li class="menu_healthInfo"><a href="#">건강정보</a></li> -->
                <li class="menu_bnh"><a href="#">뷰티앤헬스</a></li>
								<li class="menu_academy"><a href="#">학원추천</a></li>
								<li class="menu_ai"><a href="#">AI평가</a></li>
                <li class="menu_dictation"><a href="#">도전! AI 받아쓰기</a></li>
                            </ul>
                        </div>
                        <!--//왼쪽 학부모 컨텐츠메뉴-->




                        <!--메인 비쥬얼 영역//-->
                        <div class="swiper-slide">
                            <p style="width:86%;border:2px solid red;padding:200px 0;text-align:center;margin:0 auto;background:#fafafa">
                                로그인 상관없이 > 가이드팝업
                            </p>
                        </div>
                        <!--//메인 비쥬얼 영역-->





                        <!--우측 학생 컨텐츠//-->
                        <div class="swiper-slide rightWrap">
                            <h3><img src="/tspoon/ext/cdndata.milkt.co.kr/ele/tspoon/Images/common/main_top_right.png" alt="아이를 위한 즐겁고 재미있는 밀크T 특별 콘텐츠!"></h3>
                            <ul>
                                <li><a href="#">밀크TV<span>영상으로 더 즐거운 학습</span></a></li>
                                <li><a href="#">밀크게임<span>게임으로 더 쉽고 재미있게</span></a></li>
                                <li><a href="#">말하는 동화책<span>오디오북으로 더 흥미진진하게</span></a></li>
                                <li><a href="#">밀크T 맛보기<span>우리 아이 학습을 미리 확인</span></a></li>
                            </ul>
                        </div>
                        <!--//우측 학생 컨텐츠-->
                    </div>
                </div>
                <script>
                //스와이프 영역
                var swiper = new Swiper('.swiper-container-main', {
                    //effect : 'fade',
                    autoHeight  : true,
                    spaceBetween:0,
                    centeredSlides: false,
                    initialSlide:1,
                    loop: false,
                });
                </script>



            </div>
            <!--//메인 전체-->
        </div>
        <!--//컨텐츠 본문-->

        <!-- 시작하기 팝업// -->
        <div class="start_popup">
          <!-- Swiper -->
          <div class="swiper-container-startPop">
            <div class="swiper-wrapper">
              <div class="swiper-slide"><img src="/tspoon/ext/cdndata.milkt.co.kr/ele/tspoon/Images/common/main/start_popup/start_popup01_v2.png" alt="T-class"></div>
              <div class="swiper-slide"><img src="/tspoon/ext/cdndata.milkt.co.kr/ele/tspoon/Images/common/main/start_popup/start_popup02_v2.png" alt="T-class"></div>
              <div class="swiper-slide"><img src="/tspoon/ext/cdndata.milkt.co.kr/ele/tspoon/Images/common/main/start_popup/start_popup03_v2.png" alt="T-class"></div>
              <div class="swiper-slide"><img src="/tspoon/ext/cdndata.milkt.co.kr/ele/tspoon/Images/common/main/start_popup/start_popup04_v2.png" alt="last"></div>
            </div>
            <a href="#none" onClick="$('.start_popup').fadeOut(300);" class="btn_skip" style="color:#fff;">SKIP</a>
            <a href="#none" onClick="$('.start_popup').fadeOut(300);" class="btn_start"><img src="/tspoon/ext/cdndata.milkt.co.kr/ele/tspoon/Images/common/main/start_popup/start_popup_btn.png" alt="시작하기"></a>
            <!-- Add Pagination -->
            <div class="swiper-pagination swiper-pagination-startPop"></div>
          </div>

          <!-- Initialize Swiper -->
          <script>
            var swiper = new Swiper('.swiper-container-startPop', {
              pagination: {
                el: '.swiper-pagination-startPop',
              },
              on: {
                /* skip or 시작하기 버튼 */
                slideChangeTransitionEnd: function(){
                  var lastSlide = this.activeIndex;
                  if(lastSlide == '3'){
                    $('.btn_skip').hide();
                    $('.btn_start').css('display','inline-block');
                  } else {
                    $('.btn_start').css('display','none');
                    $('.btn_skip').show();
                  }
                },
              },
            });
          </script>

        </div>
        <!-- //시작하기 팝업 -->
    </div>
    <!--//웹영역 전체-->
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/main/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:14:49 GMT -->
</html>
