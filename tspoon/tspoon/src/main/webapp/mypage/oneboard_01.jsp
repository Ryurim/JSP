<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/mypage/oneboard_01.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
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
			<!-- 23-02-01 수정 --><h1>1:1 친절 상담</h1>
			<jsp:include page="/common/menu_login.jsp"/>
			<!-- <span class="btnSide"><a href="#">좌측메뉴 펼침</a></span>
		</div> -->
		<!--//해더영역-->
		<!--컨텐츠 본문//-->
		<div id="content" class="pb_0">
			<!--1:1게시판 전체//-->
			<div class="oneBoardWrap">
				<!--탭//-->
				<ul class="boardTab">
					<li><a href="/tspoon/oneboard/boardWrite.do" target="_self">1:1 문의글 작성</a></li>
					<li class="on"><a href="/tspoon/oneboard/board.do" target="_self">내가 작성한 글</a></li>
				</ul>
				<!--//탭-->
				<!--문의 작성//-->
				<div class="boardBox">
					<ul class="boardList">
						<c:forEach var="list" items="${boardList }">
							<li>
							<a href="/tspoon/oneboard/boardView.do?idx=${list.idx }" target="_self">
								<p class="title_01">${list.select1 }</p>
								<span class="title_02">${list.title }</span>
								<span class="date">${list.regDate.substring(0,11) }</span>
							</a>
							<c:if test="${list.answerIdx > 0 }"> <p class="status">답변<br>완료</p></c:if>
							<c:if test="${list.answerIdx eq 0 }"> <p class="status ready">답변<br>대기</p> </c:if>
							
						</li>
						</c:forEach>
						<c:if test="${empty boardList }">
						<br><br>
						 등록된 문의글이 없습니다.
						</c:if>
						<!-- 첨부파일 있는 경우 <span class="title_02 file"> 추가 -->
						<!--  
						<li>
							<a href="oneboard_02.html" target="_self">
								<p class="title_01">밀크T아이</p>
								<span class="title_02 file">문의하고싶어요.</span>
								<span class="date">2019.08.20</span>
							</a>
							
						</li>
						<li>
							<a href="oneboard_02.html" target="_self">
								<p class="title_01">밀크T초등</p>
								<span class="title_02 file">탭에 있는 메뉴가 너무 많아서 불편해요</span>
								<span class="date">2019.08.20</span>
							</a>
							<p class="status ready">답변<br>대기</p>
						</li>
						<li>
							<a href="oneboard_03.html" target="_self">
								<p class="title_01">밀크T초등</p>
								<span class="title_02">긴경우 한줄 자릅니다 자르기자르기자르기자르기</span>
								<span class="date">2019.08.20</span>
							</a>
							<p class="status">답변<br>완료</p>
						</li>
						<li>
							<a href="oneboard_03.html" target="_self">
								<p class="title_01">밀크T초등</p>
								<span class="title_02 file">탭에 있는 메뉴가 너무 많아서 불편해요</span>
								<span class="date">2019.08.20</span>
							</a>
							<p class="status">답변<br>완료</p>
						</li>
						<li>
							<a href="oneboard_03.html" target="_self">
								<p class="title_01">밀크T중학</p>
								<span class="title_02">긴경우 한줄 자릅니다 자르기자르기자르기자르기</span>
								<span class="date">2019.08.20</span>
							</a>
							<p class="status">답변<br>완료</p>
						</li>
						<li>
							<a href="oneboard_03.html" target="_self">
								<p class="title_01">밀크T중학</p>
								<span class="title_02">긴경우 한줄 자릅니다 자르기자르기자르기자르기</span>
								<span class="date">2019.08.20</span>
							</a>
							<p class="status">답변<br>완료</p>
						</li> -->
					</ul>
					<!-- <button class="btnMore">더보기</button> -->
					<div id="paging" style="width:max-content; margin:0 auto">${params.paging }</div>
				</div>
				<!--//문의 작성-->
				<!--안내//-->
				<div class="boardFooter">
					<p>
					1:1 친절상담은 문의 접수일로부터 평일 기준 24시간 이내
					답변을 받으실 수 있습니다. <strong>결제, 환불/취소, 배송문의</strong>는 담당
					관리선생님 또는 아래의 고객센터로 문의 주시기 바랍니다.
					</p>
					<ul>
						<li><strong>유아</strong><span>1522-6002</span></li>
						<li><strong>초등</strong><span>1577-1533</span></li>
						<li><strong>중고등</strong><span>1522-5533</span></li>
					</ul>
				</div>
				<!--//안내-->
				
			</div>
			<!--//1:1게시판 전체-->
		</div>
		<!--//컨텐츠 본문-->
	</div>
	<!--//웹영역 전체-->
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/mypage/oneboard_01.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>
