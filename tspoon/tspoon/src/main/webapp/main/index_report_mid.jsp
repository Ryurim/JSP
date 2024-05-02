<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/main/index_report_mid.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:19:15 GMT -->
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
            <h1>T CLASS</h1>
            <span class="btnSide"><a href="#" onclick="openNav()">전체메뉴 열기</a></span>
        </div>
        <!--//해더영역-->
        <!--전체메뉴//-->
        <div id="mySidenav" class="sidenav" >
            <!--전체메뉴 해더//-->
            <div class="navHeader">
                <span class="closebtn"><a href="javascript:void(0)" onclick="closeNav()">전체메뉴 닫기</a></span>
                <h2>T CLASS</h2>
                <span class="setBtn"><a href="#none" onclick="alert('환경설정 APP');return false;">환경설정</a></span>
            </div>
            <!--//전체메뉴 해더-->
            <!--전체메뉴 컨텐츠//-->
            <div class="navContent">
                <!--미 로그인 시//-->
                <!-- <div class="userStatus_02">
                    <p class="photo"><img src="//cdndata.milkt.co.kr/ele/tspoon/Images/common/img_profile_noimg.png" alt="" /></p>
                    <button class="btnLogin">로그인</button>
                </div> -->
                <!--//미 로그인 시-->
                <!-- 로그인 상태 -->
                <div class="userStatus">
                    <p class="photo"><img src="/tspoon/ext/cdndata.milkt.co.kr/ele/tspoon/Images/common/img_profile_tmp.png" alt="내 프로필 이미지" /></p>
                    <p class="name">홍길동</p>
                    <button class="btnLogOut">로그아웃</button>
                </div>

                <div class="menuStyle_01">
                    <ul>
                        <li class="menu_message"><a href="#">쪽지<span>+99</span></a></li>
						<!-- <li class="menu_board"><a href="#">1:1<br>게시판</a></li> -->
						<li class="menu_child"><a href="#">자녀<br>관리</a></li>
						<!-- <li class="menu_propose"><a href="#">부모마음<br>제안</a></li> -->
						<li class="menu_pay"><a href="#">결제<br>정보</a></li>
						<li class="menu_deliver"><a href="#">전용교재<br>배송정보</a></li>
                    </ul>
                </div>
                <div class="menuStyle_02">
                    <h3>T알쓸신잡</h3>
                    <ul>
                        <li class="ico_edu"><a href="#" target="_self">교육정보</a></li>
                        <!--<li class="ico_aud"><a href="" target="_self">오디오북</a></li>-->
                        <li class="ico_info"><a href="#" target="_self">밀크T정보</a><span class="translation">다국어 지원</span></li>
                        <!-- <li class="ico_che"><a href="" target="_self">메디컬 콘서트</a></li> -->
                        <li class="ico_univ"><a href="#" target="_self">대입정보</a></li>
                        <li class="ico_knowhow"><a href="#" target="_self">학습 노하우</a></li><!-- 2023-03-16 중고 자녀 있는 경우에만 추가 -->
                        <li class="ico_bnh"><a href="#" target="_self">뷰티앤헬스</a></li>
						<li class="ico_shop"><a href="#" target="_self">쇼핑몰</a></li>
                        <li class="ico_food"><a href="#" target="_self">학교급식</a></li>
                        <li class="ico_note"><a href="#" target="_self">학교알림장</a></li>
                        <li class="ico_map"><a href="#" target="_self">학원추천</a></li>
                    </ul>
                </div>
                <div class="menuStyle_02">
                    <h3>학습리포트</h3>
                    <ul>
                        <li class="ico_day"><a>출석현황</a></li>
                        <li class="ico_sc"><a>학습계획표</a></li>
                        <li class="ico_progress"><a>학습현황</a></li>
                        <!-- <li class="ico_jindo"><a>진도조정요청</a></li> -->
                    </ul>
                </div>
                <div class="menuStyle_03">
                    <h3>T플레이</h3>
                    <ul>
                        <li class="ico_tv"><a href="#" target="_self"><span>밀크TV</span></a></li>
                        <li class="ico_game"><a href="#" target="_self"><span>밀크T게임</span></a></li>
                        <li class="ico_ai"><a href="#" target="_self"><span>AI 평가</span></a></li>
                        <li class="ico_story"><a href="#" target="_self"><span>말하는 동화책</span></a></li>
						<li class="ico_dictation"><a href="#" target="_self"><span>AI 받아쓰기</span></a></li>
						<li class="ico_trial"><a href="#" target="_self"><span>밀크T 맛보기</span></a></li>
						<li class="ico_library"><a href="#" target="_self"><span>영어 도서관<br/>Story 듣기</span></a></li>
						<li class="ico_king"><a href="#" target="_self"><span>AI 왕.상.</span></a></li>
                    </ul>
                </div>
                <div class="menuStyle_02 noline">
					<h3>T고객센터</h3>
					<ul>
						<li class="ico_guide"><a href="#" target="_self">이용가이드</a></li>
						<li class="ico_service"><a href="#" target="_self">1:1 친절 상담</a></li>
						<li class="ico_heart"><a href="#" target="_self">부모마음 제안</a></li>
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
                                <li><a href="#">교육정보</a></li>
                                <li><a href="#">밀크T 정보</a></li>
                                <li><a href="#">학교급식</a></li>
                                <li><a href="#">학교알림장</a></li>
                                <li><a href="#">오디오북</a></li>
                                <li><a href="#">T CLASS 쇼핑몰</a></li>
                                <li><a href="#">메디컬 콘서트</a></li>
                                <li><a href="#">학원추천</a></li>
                                <li><a href="#">AI평가</a></li>
                            </ul>
                        </div>
                        <!--//왼쪽 학부모 컨텐츠메뉴-->
                        <!--메인 비쥬얼 영역//-->
                        <div class="swiper-slide">
                        <!--T리포트 전체//-->
                        <div class="reportWrap">
                            <!--학생 선택//-->
                            <div class="childStatus">
                                <p class="photo"><img src="/tspoon/ext/cdndata.milkt.co.kr/ele/tspoon/Images/common/img_profile_tmp.png" alt="내 프로필 이미지" /></p>
                                <select>
                                    <option value=""  selected="selected">김밀크</option>
                                    <option value="01">김밀코</option>
                                    <option value="02">김말이</option>
                                </select>
                            </div>
                            <!--//학생 선택-->
                            <!--출석 시간//-->
                            <!-- <p class="chool">미출석</p> -->
                            <p class="chool on">12시 50분</p>
                            <!--//출석 시간-->
                            <!--날짜(일)선택//-->
                            <p class="month"><span>2019.06</span><u></u></p>
                            <div class="daySwiper swiper-container">
                                <ul class="swiper-wrapper">
                                    <li class="swiper-slide"><a href="#none">1<span>목</span></a></li>
                                    <li class="swiper-slide"><a href="#none">2<span>금</span></a></li>
                                    <li class="swiper-slide"><a href="#none">3<span>토</span></a></li>
                                    <li class="swiper-slide"><a href="#none">4<span>일</span></a></li>
                                    <li class="swiper-slide on"><a href="#none">5<span>월</span></a></li>
                                    <li class="swiper-slide"><a href="#none">6<span>화</span></a></li>
                                    <li class="swiper-slide"><a href="#none">7<span>수</span></a></li>
                                    <li class="swiper-slide"><a href="#none">8<span>목</span></a></li>
                                    <li class="swiper-slide"><a href="#none">9<span>금</span></a></li>
                                    <li class="swiper-slide"><a href="#none">10<span>토</span></a></li>
                                    <li class="swiper-slide"><a href="#none">11<span>일</span></a></li>
                                    <li class="swiper-slide"><a href="#none">12<span>월</span></a></li>
                                    <li class="swiper-slide"><a href="#none">13<span>화</span></a></li>
                                    <li class="swiper-slide"><a href="#none">14<span>수</span></a></li>
                                    <li class="swiper-slide"><a href="#none">15<span>목</span></a></li>
                                    <li class="swiper-slide"><a href="#none">16<span>금</span></a></li>
                                    <li class="swiper-slide"><a href="#none">17<span>토</span></a></li>
                                    <li class="swiper-slide"><a href="#none">18<span>일</span></a></li>
                                    <li class="swiper-slide"><a href="#none">19<span>월</span></a></li>
                                    <li class="swiper-slide"><a href="#none">20<span>화</span></a></li>
                                    <li class="swiper-slide"><a href="#none">21<span>수</span></a></li>
                                    <li class="swiper-slide"><a href="#none">22<span>목</span></a></li>
                                    <li class="swiper-slide"><a href="#none">23<span>금</span></a></li>
                                    <li class="swiper-slide"><a href="#none">24<span>토</span></a></li>
                                    <li class="swiper-slide"><a href="#none">25<span>일</span></a></li>
                                    <li class="swiper-slide"><a href="#none">26<span>월</span></a></li>
                                    <li class="swiper-slide"><a href="#none">27<span>화</span></a></li>
                                    <li class="swiper-slide"><a href="#none">28<span>수</span></a></li>
                                    <li class="swiper-slide"><a href="#none">29<span>목</span></a></li>
                                    <li class="swiper-slide"><a href="#none">30<span>금</span></a></li>
                                    <li class="swiper-slide"><a href="#none">31<span>토</span></a></li>
                                </ul>
                            </div>
                            <script>
                                //스와이프 영역
                                var swiper = new Swiper('.swiper-container', {
                                    slidesPerView: 5,
                                    spaceBetween: 0,
                                    grabCursor: true,
                                    centeredSlides: false,
                                    initialSlide: 2, //1 일이 첫번째 위치일때 0, 2일이 첫번째위치일때 1 , 예를들어 오늘이 5일이면 3일을 맨앞으로두기 위해 2로 수정
                                    loop: true,
                                });
                            </script>
                            <!--//날짜(일)선택-->
                            <!--현황 컨텐츠//-->
                            <div class="cntStatus">
                                <!--주간 , 월간보기//-->
                                <button class="btnTool" >툴열기</button>
                                <div class="editLay">
                                    <button class="btnWeek">주간보기</button>
                                    <button class="btnMonth" >월간보기</button>
                                </div>
                                <!--//주간 , 월간보기-->
                                <!--학습현황//-->
                                <div class="studyStatus">
                                    <h3>학습현황</h3>
                                     <ul class="txtList">
                                        <li>
                                            <p>318</p>
                                            <span>수강시간<u> (분)</u></span>
                                        </li>
                                        <li>
                                            <p>86</p>
                                            <span>수강강의<u> (강)</u></span>
                                        </li>
                                     </ul>
                                 </div>
                                <!--//학습현황-->
                                <!--목표수강//-->
                                <div class="lectureList cntLine">
                                    <h3>목표수강 <strong>1</strong><span>2</span></h3>
                                    <p class="noData">조회기간 학습이력이 없습니다.</p>
                                    <ul>
                                        <li>
                                            <p class="title_01">사회<span>주혜령</span></p>
                                            <p class="title_02">[짤강] [15개정] 사회 2-1 : 개념 한입만</p>
                                            <p class="title_03">1강 인권의 의미와 특징</p>
                                            <p class="status">학습<br>전</p>
                                        </li>
                                        <li>
                                            <p class="title_01">영어<span>Lucy</span></p>
                                            <p class="title_02">중1-1 영어 : 동아이</p>
                                            <p class="title_03">1강 인권의 의미와 특징</p>
                                            <p class="status on">학습<br>완료</p>
                                        </li>
                                    </ul>
                                </div>
                                <!--//목표수강-->
                                <!--일반수강//-->
                                <div class="lectureList cntLine">
                                    <h3>일반수강 </h3>
                                    <p class="noData">조회기간 학습이력이 없습니다.</p>
                                    <ul>
                                        <li>
                                            <p class="title_01">사회<span>주혜령</span></p>
                                            <p class="title_02">[짤강] [15개정] 사회 2-1 : 개념 한입만</p>
                                            <p class="title_03">1강 인권의 의미와 특징</p>
                                            <p class="status on">학습<br>완료</p>
                                        </li>
                                        <li>
                                            <p class="title_01">영어<span>Lucy</span></p>
                                            <p class="title_02">중1-1 영어 : 동아이</p>
                                            <p class="title_03">1강 인권의 의미와 특징</p>
                                            <p class="status on">학습<br>완료</p>
                                        </li>
                                    </ul>
                                </div>
                                <!--//일반수강-->
                                <!--점수 차트//-->
                                <script>
                                $(document).ready(function(){
                                    $('.skillbar').skillBars({
                                        from: 0,
                                        speed: 1300,
                                        interval: 100,
                                        decimals: 0,
                                    });
                                });
                                </script>
                                <div class="barChart cntLine" data-aos="fade-up" >
                                    <h3>TEST 응시 이력</h3>
                                    <p class="noData">조회기간 학습이력이 없습니다.</p>
                                    <dl>
                                        <dt class="blue"><span>사회</span></dt>
                                        <dd>
                                            <p>개념TEST</p>
                                            <div class="skillbar" data-percent="100"><p class="skillbar-bar"></p><span class="skill-bar-percent"></span></div>
                                        </dd>
                                        <dt class="blue"><span>영어</span></dt>
                                        <dd>
                                            <p>단원TEST</p>
                                            <div class="skillbar" data-percent="88"><p class="skillbar-bar"></p><span class="skill-bar-percent"></span></div>
                                        </dd>
                                        <dt class="blue"><span>수학</span></dt>
                                        <dd>
                                            <p>개념TEST</p>
                                            <div class="skillbar" data-percent="90"><p class="skillbar-bar"></p><span class="skill-bar-percent"></span></div>
                                        </dd>
                                    </dl>
                                </div>
                                <!--//점수 차트-->

                            </div>
                            <!--//현황 컨텐츠-->
                        </div>
                        <!--//T리포트 전체-->
                        </div>
                        <!--//메인 비쥬얼 영역-->
                        <!--우측 학생 컨텐츠//-->
                        <div class="swiper-slide rightWrap">
                            <h3><img src="/tspoon/ext/cdndata.milkt.co.kr/ele/tspoon/Images/common/main_top_right.png" alt="아이를 위한 즐겁고 재미있는 밀크T 특별 콘텐츠!"></h3>
                            <ul>
                                <li><a href="#">밀크TV<span>영상으로 더 즐거운 학습</span></a></li>
                                <li><a href="#">밀크게임<span>게임으로 더 쉽고 재미있게</span></a></li>
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
    </div>
    <!--//웹영역 전체-->
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/main/index_report_mid.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:19:15 GMT -->
</html>
