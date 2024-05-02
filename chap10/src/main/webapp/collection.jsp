<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="member.Person"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL - 컬렉션</title>
</head>
<body>

<h2>List</h2>
<%
List<Object> oList = new ArrayList<Object>();
oList.add("미션임파서블");
oList.add(new Person("탐크루즈", 54, "남자"));
pageContext.setAttribute("USA", oList);
%>
<ul>
	<li>0번째 요소 : ${USA[0] }</li>
	<li>1번째 요소 : ${USA[1].name }</li>
	<li>1번째 요소 : ${USA[1].age }</li>
	<li>1번째 요소 : ${USA[1].sex }</li>
	<li>2번째 요소 : ${USA[2] }</li> 
	<!-- 
		없는값 부르면 out of Bound 나와야 하는데 그런거 없이 그냥 아무값도 안나옴!
		예외처리를 지가 해준다 그래서 더 위험해,,
	 -->
</ul>


<h2>맵컬렉션</h2>
<%
Map<String, String> map = new HashMap<String, String>();
map.put("KOR", "한글");
map.put("ENG", "영어");
pageContext.setAttribute("LANG", map);
%>
<ul>
	<li>KEY : ${LANG["KOR"] }, ${LANG['KOR'] }, ${LANG.KOR }</li>
	<li>KEY : ${LANG["ENG"] }, ${LANG['ENG'] }, ${LANG.ENG }</li> 
</ul>

</body>
</html>