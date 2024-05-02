<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="ko">


<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/mypage/message_03.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
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
           <!--  <span class="btnSide"><a href="#">좌측메뉴 펼침</a></span>
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
                    <span class="btnWrite02"><a href="/tspoon/message/msgWrite.do">쪽지쓰기</a></span>
                   <!--  <span class="btnPra"><a href="../report/message_praise.html">칭찬하기</a></span> -->
                </div>
                <!--//학생 선택-->
                <!--쪽지 컨텐츠 박스//-->
                <div class="msgBox">
                    <!--쪽지탭//-->
                    <ul class="msgTab">
                        <li><a href="/tspoon/message/msg.do" target="_self">받은 쪽지함</a></li>
                        <li class="on"><a href="/tspoon/message/msgSend.do" target="_self">보낸 쪽지함</a></li>
                    </ul>
                    <!--//쪽지탭-->
                    <!--보낸 쪽지 리스트//-->
                    <form id="frm" action="/tspoon/message/msgSendDelete.do">
                    <ul class="msgList">
                        <li class="status">
                            <input type="checkbox"  id="chkAll" name="chkAll"  />
                            <label for="chkAll"><span></span>선택</label>
                            <button class="btn" id="btnDelete" name="btnDelete" value="btnDelete">삭제</button>
                        </li>
                        
                         <ul class="msgList">
                    	<c:forEach var="list" items="${msgList }">
                    		<li class="noRead">
	                            <input type="checkbox"  id="${list.idx }" name="checkbox" value="${list.idx }"  />
	                            <label for="${list.idx }"><span></span>선택</label>
	                            <a href="/tspoon/message/msgSendView.do?idx=${list.idx }" target="_self">
	                                <p class="name">${list.receiveName }</p>
	                                <c:if test="${list.readCnt > 0 }"></c:if>
	                                <c:choose>
	                                	<c:when test="${list.readCnt > 0 }">
	                                		<span class="noRead">${list.title }<!-- <u class="file">첨부파일</u> --></span>
	                                	</c:when>
	                                	<c:otherwise>
	                                		<span class="title">${list.title }<!-- <u class="file">첨부파일</u> --></span>
	                                	</c:otherwise>
	                                </c:choose>
	                                <span class="date">${list.receiveDate.substring(0, 11) }</span>
	                            </a>
	                        </li>
                    	
                    	</c:forEach>
                    	<c:if test="${empty msgList }">
                    	<br><br>
                    		보낸 쪽지가 없습니다.
                    	</c:if>
                    </ul>
                    </form>
                    <!-- <button class="btnMore">더보기</button> -->
                    <!--//쪽지 리스트-->
					<div id="paging" style="width:max-content; margin:0 auto">${params.paging }</div>
                        <!-- <li class="noRead">
                            <input type="checkbox"  id="c1" name=""  />
                            <label for="c1"><span></span>선택</label>
                            <a href="message_01.html" target="_self">
                                <p class="name">홍길동</p>
                                <span class="title">읽지않은경우 클래스 noRead</span><u class="file">첨부파일</u>
                                <span class="date">2019.08.20</span>
                            </a>
                        </li>
                        <li class="noRead">
                            <input type="checkbox"  id="c2" name=""  />
                            <label for="c2"><span></span>선택</label>
                            <a href="#" target="_self">
                                <p class="name">홍길동</p>
                                <span class="title">긴경우 한줄 자릅니다 자르기자르기자르기자르기</span><u class="file">첨부파일</u>
                                <span class="date">2019.08.20</span>
                            </a>
                        </li>
                        <li class="noRead">
                            <input type="checkbox"  id="c2" name=""  />
                            <label for="c2"><span></span>선택</label>
                            <a href="#" target="_self">
                                <p class="name">홍길동</p>
                                <span class="title">긴경우 한줄 자릅니다 자르기자르기자르기자르기</span><u class="file">첨부파일</u>
                                <span class="date">2019.08.20</span>
                            </a>
                        </li>
                        <li class="noRead">
                            <input type="checkbox"  id="c2" name=""  />
                            <label for="c2"><span></span>선택</label>
                            <a href="#" target="_self">
                                <p class="name">홍길동</p>
                                <span class="title">긴경우 한줄 자릅니다 자르기자르기자르기자르기</span>
                                <span class="date">2019.08.20</span>
                            </a>
                        </li>
                        <li class="noRead">
                            <input type="checkbox"  id="c2" name=""  />
                            <label for="c2"><span></span>선택</label>
                            <a href="#" target="_self">
                                <p class="name">홍길동</p>
                                <span class="title">긴경우 한줄 자릅니다 자르기자르기자르기자르기</span>
                                <span class="date">2019.08.20</span>
                            </a>
                        </li>
                    </ul>
                    <button class="btnMore">더보기</button> -->
                    <!--//보낸 쪽지 리스트-->


                </div>
                <!--//쪽지 컨텐츠 박스-->
            </div>
            <!--//쪽지 전체-->
        </div>
        <!--//컨텐츠 본문-->
    </div>
    <!--//웹영역 전체-->
    <script>
	    let frm = document.querySelector("#frm");
    	let chkAll = document.querySelector("#chkAll");
    	
    	//체크박스 전체 선택/해제 
    	chkAll.addEventListener("click", (e) =>  {
    		var check = document.querySelectorAll("input[type ='checkbox']");
    		
    		check.forEach((checkbox) => {
    		    checkbox.checked = chkAll.checked;
    		  });
    	});
		
    	//삭제 버튼 눌렀을 때 
	    document.querySelector("#btnDelete").addEventListener("click", (e) => {
	    	var check = document.querySelectorAll("input[type ='checkbox']:checked"); 
	    	console.log(check);
	    	if (check.length == 0) {
	    		alert("하나 이상 선택하세요.");
	    		e.preventDefault();
	    		return false;
	    	} else {
	    		let deleteOk = confirm("삭제 하시겠습니까?");
		     	if (deleteOk) {
		     		
		     			console.log(check);
		     			frm.submit();
		     		
		     	}
		     	else {
		     		e.preventDefault();
		     		return false;
		     	}
	    	}
	    	
	    	
	    	
			
		});
    
    </script>
</body>

<!-- Mirrored from test-tclassdesign.milkt.co.kr/html/mypage/message_03.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 01 May 2023 01:22:08 GMT -->
</html>
