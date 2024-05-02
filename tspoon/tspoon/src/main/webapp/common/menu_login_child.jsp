<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/common/menu_login_child.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:14:14 GMT -->
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
			<h1>전체메뉴 로그인O/자녀등록O</h1>
			<span class="btnSide"><a href="#" onclick="openNav()">전체메뉴 열기</a></span>
		</div>
		<!--//해더영역-->
		<!--전체메뉴//-->
		<div id="mySidenav" class="sidenav" >
			<!--전체메뉴 해더//-->
			<div class="navHeader">
				<span class="closebtn"><a href="javascript:void(0)" onclick="closeNav()">전체메뉴 닫기</a></span>
				<h2><a href="../../index.html">T CLASS</a></h2>
				<span class="setBtn"><a href="#none" onclick="alert('환경설정 APP');return false;">환경설정</a></span>
			</div>
			<!--//전체메뉴 해더-->
			<!--전체메뉴 컨텐츠//-->
			<div class="navContent">
				<div class="userStatus">
					<p class="photo"><img src="/tspoon/ext/cdndata.milkt.co.kr/ele/tspoon/Images/common/img_profile_tmp.png" alt="내 프로필 이미지" /></p>
					<p class="name">홍길동</p>
					<button class="btnLogOut">로그아웃</button>
				</div>
				<div class="menuStyle_01">
					<ul>
						<li class="menu_message"><a href="#">쪽지<span>+99</span></a></li>
						<li class="menu_board"><a href="#">1:1<br>게시판</a></li>
						<li class="menu_child"><a href="#">자녀<br>관리</a></li>
						<li class="menu_propose"><a href="#">부모마음<br>제안</a></li>
						<li class="menu_pay"><a href="#">결제<br>정보</a></li>
						<li class="menu_deliver"><a href="#">전용교재<br>배송정보</a></li>
					</ul>
				</div>
				<div class="menuStyle_02">
					<h3>T알쓸신잡</h3>
					<ul>
						<li class="ico_edu"><a href="#" target="_self">교육정보</a></li>
						<!--<li class="ico_aud"><a href="" target="_self">오디오북</a></li>-->
						<li class="ico_info"><a href="#" target="_self">밀크T 정보</a><span class="translation">다국어 지원</span></li>
						<!-- <li class="ico_che"><a href="" target="_self">메디컬 콘서트</a></li> -->
						<li class="ico_univ"><a href="#" target="_self">대입정보</a></li>
						<li class="ico_bnh"><a href="#" target="_self">뷰티앤헬스</a></li>
						<li class="ico_shop"><a href="#" target="_self">쇼핑몰</a></li>
						<li class="ico_food"><a href="#" target="_self">학교급식</a></li>
						<li class="ico_note"><a href="#" target="_self">학교알림장</a></li>
						<li class="ico_map"><a href="#" target="_self">학원추천</a></li>
					</ul>
				</div>
				<div class="menuStyle_02">
					<h3>T리포트</h3>
					<ul>
						<li class="ico_day"><a href="#" target="_self">출석현황</a></li>
						<li class="ico_sc"><a href="#" target="_self">학습계획표</a></li>
						<li class="ico_progress"><a href="#" target="_self">학습현황</a></li>
						<li class="ico_jindo"><a href="#" target="_self">진도조정요청</a></li>
					</ul>
				</div>
				<div class="menuStyle_03">
					<h3>T플레이</h3>
					<ul>
						<li class="ico_tv"><a href="#" target="_self"><span>밀크TV</span></a></li>
						<li class="ico_game"><a href="#" target="_self"><span>밀크게임</span></a></li>
						<li class="ico_ai"><a href="#" target="_self"><span>AI 평가</span></a></li>
						<li class="ico_story"><a href="#" target="_self"><span>말하는 동화책</span></a></li>
						<li class="ico_dictation"><a href="#" target="_self"><span>AI 받아쓰기</span></a></li>
						<li class="ico_trial"><a href="#" target="_self"><span>밀크T 맛보기</span></a></li>
						<li class="ico_library"><a href="#" target="_self"><span>영어 도서관<br/>Story 듣기</span></a></li>
						<li class="ico_king"><a href="#" target="_self"><span>AI 왕.상.</span></a></li>
					</ul>
				</div>
				<div class="menuStyle_04">
					<h3>T학습설정</h3>
					<ul>
						<li class="ico_stopwatch"><a href="#" target="_self"><span>유아안심 학습설정</span></a></li>
					</ul>
				</div>
				<div class="menuStyle_04">
					<h3>엄마아빠콜</h3>
					<ul>
						<li class="ico_callParents"><a href="#" target="_self"><span>엄마아빠콜 실행</span></a></li>
					</ul>
				</div>
			</div>
			<!--//전체메뉴 컨텐츠-->
			<!--전체메뉴 푸터//-->
			<!-- <div class="navFooter">
				<h3>고객센터</h3>
				<ul>
					<li><span>밀크T 초등</span><strong>1577-1533</strong></li>
					<li><span>밀크T 중학</span><strong>1522-5533</strong></li>
					<li>평일 10:00~22:00</li>
					<li>토요일 10:00~20:00</li>
					<li>점심시간 12:00~13:00</li>
					<li>일요일/공휴일 휴무</li>
				</ul>
			</div> -->
			<!--//전체메뉴 푸터-->
		</div>
		<!--//전체메뉴-->
		<!--컨텐츠 본문//-->
		<div id="content">
			<!--자녀등록 전체//-->
			<div class="childWrap">
				<h2>

					햄버거 버튼을 눌러 확인 해 주세요
				</h2>

			</div>
			<!--//자녀등록 전체-->
		</div>
		<!--//컨텐츠 본문-->
	</div>
	<!--//웹영역 전체-->
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/common/menu_login_child.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:14:14 GMT -->
</html>
