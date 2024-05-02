<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/mypage/oneboard_04.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
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
			<div class="oneBoardWrap ">
				<!--탭//-->
				<ul class="boardTab">
					<li class="on"><a href="/tspoon/oneboard/boardWrite.do" target="_self">1:1 문의글 작성</a></li>
					<li><a href="/tspoon/oneboard/board.do" target="_self">내가 작성한 글</a></li>
				</ul>
				<!--//탭-->
				<!--문의 작성//-->
				<form id="frm" class="boardBox" action="/tspoon/oneboard/boardModify.do" method="post">
					<em	class="notice">필수 입력항목</em>
					<ul class="boardWrite">
						<li class="selList">
							<select id="ss1" name="select1"">
								<option value="" disabled="disabled" >선택</option>
								<option value="밀크T초등" id="01" <c:if test="${boardView.select1 eq '밀크T초등'}"> selected </c:if> >밀크T초등</option>
								<option value="밀크T중등" <c:if test="${boardView.select1 eq '밀크T중등'}"> selected </c:if>>밀크T중등</option>
								<option value="T CLASS"  <c:if test="${boardView.select1 eq 'T CLASS'}"> selected </c:if>>T CLASS</option>
							</select>
							<select id="ss1" name="select2">
								<option value="" disabled="disabled" >선택</option>
								<option value="학습/평가" <c:if test="${boardView.select2 eq '학습/평가'}"> selected </c:if> >학습/평가</option>
								<option value="결제" <c:if test="${boardView.select2 eq '결제'}"> selected </c:if>>결제</option>
								<option value="회원정보" <c:if test="${boardView.select2 eq '회원정보'}"> selected </c:if>>회원정보</option>
								<option value="탭장애" <c:if test="${boardView.select2 eq '탭장애'}"> selected </c:if>>탭장애</option>
								<option value="기타" <c:if test="${boardView.select2 eq '기타'}"> selected </c:if>>기타</option>
							</select>
							<!-- <select id="ss1">
								<option value="" disabled="disabled" selected="selected">선택</option>
								<option value="01">선택2-1</option>
								<option value="02">선택2-2</option>
							</select> -->
						</li>
						<input type="hidden" name="idx" value="${boardView.idx }"/>
						<li>
							<input type="text" id="iname" name="title" placeholder="제목" value="${boardView.title }" />
						</li>
						<script >
						//itxtArea 영역 반응형 리사이징
						$(document).ready(function(){
							$(window).resize(resizeContents);
							resizeContents();
						});
						function resizeContents() {
							$(".itxtArea").height($(window).height()-460);//
						}
						</script>
						<li class="itxtArea">
							<textarea id="textzone" class="itxtArea" name="content" placeholder="내용 작성">${boardView.content } </textarea>
						</li>
						<!-- <li class="uploadFile">
							<label for="uploading" class="btnUpload">이미지 첨부</label><input type="file" id="uploading">
							<span class="fileName">첨부파일이 없습니다.</span>
							<button type="button" class="del">삭제하기</button>
						</li> -->
					</ul>
					<!-- <p class="info">이미지 파일만 (JPG, JPEG, PNG) 가능하며,<br>용량은 2MB까지 등록됩니다.</p> -->

					<!-- <button class="button blue big mt_20" onclick="location.href='oneboard_01.html' ">등록</button> -->
					<ul class="btnList mt_30"><!-- 수정일때 -->
						<li><button id="btnReset" class="button gray big">취소</button></li>
						<li><button id="btnRegist" class="button blue big">등록</button></li>
					</ul>
				</form>
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
	<script>
		
	</script>
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/mypage/oneboard_04.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>
<script>
	$(document).ready(function(){
		//이미지 첨부
		$('#uploading').change(function(e){

			var fileValue = $('#uploading').val().split("\\");
			var fileName = fileValue[2]

			$('.fileName').text(fileName)
			$('li.uploadFile').addClass('ok');
		});
		//삭제하기
		$('.del').on('click',function(){
			$('#uploading').val("");
			$('.fileName').text("첨부파일이 없습니다.");
			$('li.uploadFile').removeClass('ok');
		});
	});
	
	document.querySelector("#btnRegist").addEventListener("click", (e) => {
		document.querySelector("#frm").submit();
	});
	document.querySelector("#btnReset").addEventListener("click", (e) => {
		document.querySelector("#frm").reset();
	});
	
</script>
