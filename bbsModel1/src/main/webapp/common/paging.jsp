<%@page import="model1.bbs.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// 게시물 수 : total_count
// 전체 페이지 수 : total_page : ceil(total_count/page_size)
// 현재 페이지 번호 : page_no
// 페이지 사이즈 : page_size = 10
// 페이지 skip 사이즈 : (page-1)*page_size
// 1 --> 0
// 2 --> 10
// 3 --> 20

// 페이지 목록 블럭 사이즈 : page_block_size = 10
// 페이지 목록 블럭 시작 : page_block_start = page/page_block_size
// 페이지 목록 블럭 끝 : page_block_end = ceil(page/page_size)+1
// 페이지 블럭 출력 : 
// for page_block_start --> page_block_end

// 다음 페이지 --> true : total_page > page_block_end 
// 이전 페이지 --> true : page_block_start > 1
// 첫 페이지 : 1
// 끝 페이지 : total_page


// 10 : 1~10	--> 1
// 15 : 11~20	--> 1.5		ceil(page/page_size)+1		15/10 --> 1.5 : 2*10 + 1
// 18 : 11~20	--> 1.8		page/page_size				18/10 --> 1.8 : 2*10 + 1
// 20 : 11~20	--> 2		page/page_size				20/10 --> 2	  : 2+10 + 1
// 21 : 21~30	--> 2.1

// 현재 페이지

int total_count = 0;
int total_page = 0;
int page_no = 0;
int page_size = 10;
int page_skip_size = 0;
int page_block_size = 10;
int page_block_start = 1;
int page_block_end = 1;





%>
</body>
</html>