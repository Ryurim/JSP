<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces = "true"%>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

out.println(String.format("아이디 : %s, 비밀번호 : %s", id, pwd));

String driver = application.getInitParameter("Driver"); //web.xml이 context 정보. application은 web/context/server.xml에 접근 가능
//getInitParameterNames : Names는 파라미터명 지정하지 않을 때, array 혹은 list 혹은 collection으로 리턴 되는 애들이 복수임
String url = application.getInitParameter("URL");
String dbId = application.getInitParameter("dbId");
String dbPwd = application.getInitParameter("dbPwd");

// 이 안에 상속, super, 의존성 주입 다 들어가 있어
MemberDAO dao = new MemberDAO(driver, url, dbId, dbPwd);
MemberDTO dto = dao.getMemberInfo(id, pwd);
dao.close(); // dao에서 어떻게 close를 호출할 수 있어? super의 생성자를 호출했기 때문에


if (dto != null && dto.getMemberId() != null) { // pwd가 맞지 않으면 애초에 dto 객체는 null이야! 이거 추가 안해주면 오류 나는 엔진도 있음
	session.setAttribute("UserId", dto.getMemberId());	//모든 페이지에서 사용하려고 session 객체 사용하는것!
	session.setAttribute("UserName", dto.getName());
	session.setAttribute("UserPwd", dto.getPwd());
	response.sendRedirect("login.jsp");
	
	
} else {
	request.setAttribute("errMsg", "로그인 오류"); //request 객체에 errMsg 이름으로 "로그인 오류" 속성값 저장. 여기선 왜 session 안쓰고 request를 써?
											   //login.jsp 로 리다이렉트 시키고 다른 페이지로 넘어가면 이건 사라져!
											   //실패한 정보를 이 페이지에서만 쓰고 말려고 request 객체 사용하는것!
	request.getRequestDispatcher("login.jsp").forward(request, response); // 2. forward()에다가 request, response 객체를 담아서 같이 보내는 거야. 사라지기 때문에!
	//response.sendRedirect("login.jsp");	// 1. sendRedirect 하면 request 객체의 정보는 사라져. 왜? 페이지가 바뀌니까!
	//request, response의 scope는 한 쌍 
}
%>