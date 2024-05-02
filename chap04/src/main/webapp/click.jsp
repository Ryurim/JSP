<%@page import="chap04.CookieUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Enumeration"%>
<%@page import="chap04.CookieUtil" %>
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

//이전 쿠키 저장



String param = request.getParameter("param");
String referer = request.getHeader("referer");


String strP = CookieUtil.getCookieInfo(request, "param");
String strR = CookieUtil.getCookieInfo(request, "referer");

List<String> pList = new ArrayList<String>();
List<String> rList = new ArrayList<String>();

if (strP != null && strP.equals(null)) {
	pList.add(strP);
}
if (strR != null && strR.equals(null)) {
	rList.add(strR); 
}


CookieUtil.setCookies(response, "", "/", 100, "param", param);
CookieUtil.setCookies(response, "", "/", 100, "referer", referer);




//response.sendRedirect("show.jsp");

/*
//만약 strP가 null이 아니라면? | 붙여서 추가해 주자
if (strP != null && strP.equals(null)) {
	//갯수가 3개가 넘어가면 삭제해야해
	if (pArr.length > 3) {
		pArr[0] = pArr[1];
		pArr[1] = pArr[2];
		pArr[2] = null;
	} else {
		strP = strP + "|" + strP;
	}
}


if (strR != null && strR.equals(null)) {
	//갯수가 3개가 넘어가면 삭제해야해
	if (rArr.length > 3) {
		rArr[0] = pArr[1];
		rArr[1] = pArr[2];
		rArr[2] = null;
	} else {
		strP = strP + "|" + strP;
	}
}







/*
if(!beforeP.equals(null) && beforeP != null) {
	if(referer != null && !referer.equals(null)) {
		String[] pArr = beforeP.split("|");
		String[] rArr = beforeR.split("|");
		if (pArr.length > 3) {
			pArr.shift();
		}
		beforeP = beforeP +"|"+ referer;
	}
}
*/



%>
</body>
</html>