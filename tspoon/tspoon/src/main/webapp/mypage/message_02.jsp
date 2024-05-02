<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/mypage/message_02.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
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
            <h1>쪽지</h1>
            <jsp:include page="/common/menu_login.jsp"/>
            <!-- <span class="btnBack"><a href="#">뒤로가기</a></span>
        </div> -->
        <!--//해더영역-->
        <!--컨텐츠 본문//-->
        <div id="content">
            <!--쪽지 전체//-->
            <div class="msgWrap ele"> <!-- 학생별 클래스명 추가 초:ele / 중:mid / 고:high -->
                <!--학생 선택//-->
                <div class="childStatus">
                  <div class="profileWrap">
                    <p class="photo">
                      <img src="/tspoon/ext/cdndata.milkt.co.kr/ele/tspoon/Images/common/img_profile_tmp.png" alt="내 프로필 이미지" />
                      <span></span>
                    </p>
                  </div>
                    <select>
                        <option value=""  selected="selected">${sessionScope.name }</option>
                    </select>
                    <span class="btnWrite"><a href="/tspoon/message/msgWrite.do">쪽지쓰기</a></span>
                </div>
                <!--//학생 선택-->
                <!--쪽지 컨텐츠 박스//-->
                <form class="msgBox" id="frm" action="/tspoon/message/msgWrite.do" method="post">
                    <!--쪽지 쓰기//-->
                    <ul class="msgWrite">
                        <li class="selList">
                            <label for="touser">받는사람</label>
                            <select id="touser" name="receiveId">
                            	<option value="" disabled="disabled" selected="selected">다른 유저 아이디</option>
                            	<c:forEach var="list" items="${receiveList}" >
                            		<option name="receiveID" value="${list.id }">${list.id }</option>
                            		
                            	</c:forEach>
                            	
                                <!-- 
                                <option value="">관리선생님1</option>
                                <option value="02">관리선생님2</option>
                                <option value=""></option> -->
                                
                            </select>
                            
                            
                        </li>
                        <li class="titleWrite">
                        	
                            <input type="text" class="itxt" id="iname" name="title" placeholder="제목" />
                            <!-- <div class="btnFile">
                                <label for="fileupload">업로드</label>
                                <input type="file" name="pic" id="fileupload" >
                            </div> -->
                        </li>
                       <!--  <li class="fileList">
                             <span class="file"><u>첨부파일명이길면자름첨부파일명이길면자름첨부파일명이길면자름.jpg</u><a href="#">삭제</a></span>
                        </li> -->
                        <script >
                        //itxtArea 영역 반응형 리사이징
                        $(document).ready(function(){
                            $(window).resize(resizeContents);
                            resizeContents();
                        });
                        function resizeContents() {
                            $(".itxtArea").height($(window).height()-473);
                        }
                        </script>
                        <li class="itxtArea">
                            <textarea id="textzone" class="itxtArea" name="content" placeholder="내용 작성" value=""></textarea>
                            
                        </li>
                    </ul>
                    <button class="button blue big mt_40" id="btnRegist">보내기</button>
                    <!--//쪽지 쓰기-->


                </form>
                <!--//쪽지 컨텐츠 박스-->
            </div>
            <!--//쪽지 전체-->
        </div>
        <!--//컨텐츠 본문-->
    </div>
    <!--//웹영역 전체-->
    <script>
    document.querySelector("#btnRegist").addEventListener("click", (e) => {
    	let receiveId = document.querySelector("#touser");
		let title = document.querySelector("#iname");
		let content = document.querySelector("#textzone");
		let frm = document.querySelector("#frm");
		
		e.preventDefault();
		
		
		if (receiveId == null || receiveId.value.length == 0) {
			alert("보낼 대상을 선택하세요.");
			return false;
		} 
		
		if (title == null || title.value.length == 0) {
			alert("제목을 입력하세요.");
			title.focus();
			return false;
		}
		
		if (content == null || content.value.length == 0) {
			alert("쪽지 내용을 입력하세요. ");
			content.focus();
			return false;
		}
		
		
		
		else {
			alert("정상적으로 쪽지가 발송되었습니다.");
			frm.submit();
		}
	});
    </script>
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/mypage/message_02.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>
