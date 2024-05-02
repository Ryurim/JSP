<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL - 매개변수</title>
</head>
<body>

<h2>영역별 조회</h2>
<ul>
	<li>Person 객체 -> 이름 : ${person.getName() }, 나이 : ${person.getAge() }, 성별 : ${person.getSex() }</li>
	<li>Person 객체 -> 이름 : ${person.name }, 나이 : ${person.age }, 성별 : ${person.sex }</li>
	<li>Person 객체 -> 성별 : ${person.sex }</li> 
	<!-- 
		private 인데 어떻게 필드명으로 접근가능?? : 게터세터가 존재하면 해당 필드가 private 이라고 해도 그 필드와 매칭되어있는 게터와 세터를 알아서 찾아서 그거로 보여줌!
		게터 세터가 private 이면 오류발생!
	 -->
	
	<li>String -> ${requestScope.str }</li>
	<li>Integer -> ${intNo }</li>
</ul>

<h2>매개변수 조회</h2>
<ul>
	<li>${param.num1 + param["num2"] }</li>
	<li>${param.num1 + param['num2'] }</li>
</ul>

</body>
</html>