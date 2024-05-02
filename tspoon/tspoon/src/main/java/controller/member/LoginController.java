package controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.MemberDAO;
import member.MemberDTO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import common.CookieUtil;


public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession();
		String saveid = CookieUtil.getCookieInfo(request, "saveid");
		
		if (saveid != null && saveid.equals("Y")) {
			String id = CookieUtil.getCookieInfo(request, "id");
			String pwd = CookieUtil.getCookieInfo(request, "pwd");
			
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.getMemberInfo(id, pwd);
			dao.close();
			
			if (dto != null && dto.getId() != null) {
				session.setAttribute("idx", dto.getIdx());
				session.setAttribute("name", dto.getName());
				session.setAttribute("id", dto.getId());
				session.setAttribute("pwd", dto.getPwd());
				session.setAttribute("sex", dto.getSex());
				session.setAttribute("tel", dto.getTel());
				session.setAttribute("email", dto.getEmail());
				session.setAttribute("interest", dto.getInterest());
				session.setAttribute("grade", dto.getGrade());
				session.setAttribute("birthY", dto.getBirthY());
				session.setAttribute("birthM", dto.getBirthM());
				session.setAttribute("birthD", dto.getBirthD());
			}
			
			response.sendRedirect("/tspoon/main/index.do");
		}
		
		else {
			request.getRequestDispatcher("/member/login.jsp").forward(request,  response);
		}
		//doPost(request, response);
	}

	// 로그인 시도 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("idn");
		String pwd = request.getParameter("password");
		String saveid = request.getParameter("saveid");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMemberInfo(id, pwd);
		
		dao.close();
		
		// 로그인 시 회원 정보 세션 저장
		HttpSession session = request.getSession();
		if (dto != null && dto.getId() != null) {
			session.setAttribute("idx", dto.getIdx());
			session.setAttribute("name", dto.getName());
			session.setAttribute("id", dto.getId());
			session.setAttribute("pwd", dto.getPwd());
			session.setAttribute("sex", dto.getSex());
			session.setAttribute("tel", dto.getTel());
			session.setAttribute("email", dto.getEmail());
			session.setAttribute("interest", dto.getInterest());
			session.setAttribute("grade", dto.getGrade());
			session.setAttribute("birthY", dto.getBirthY());
			session.setAttribute("birthM", dto.getBirthM());
			session.setAttribute("birthD", dto.getBirthD());
			
			// 로그인 저장 체크 시 쿠키에 저장
			if (saveid != null && saveid.equals("Y")) {
				if (id != null && !id.isEmpty()) {
					CookieUtil.setCookies(response, "", "/", 60*60*24, "id", id);
					CookieUtil.setCookies(response, "", "/", 60*60*24, "pwd", pwd);
					CookieUtil.setCookies(response, "", "/", 60*60*24, "saveid", saveid);
//					
//					request.setAttribute("id", CookieUtil.getCookieInfo(request, id));
//					request.setAttribute("pwd", CookieUtil.getCookieInfo(request, pwd));
				}
				
			}
			// 해제 시 쿠키에서 삭제
			else {
				CookieUtil.setDeleteCookie(response, "", "/", 0, "id", "");
				CookieUtil.setDeleteCookie(response, "", "/", 0, "pwd", "");
				CookieUtil.setDeleteCookie(response, "", "/", 0, "saveid", "");
			}
			
			request.removeAttribute("loginErrMsg");
			response.sendRedirect("/tspoon/main/index.do");
		}
		
		else {
			request.setAttribute("loginErrMsg", "아이디 또는 비밀번호가 적절하지 않거나 등록된 아이디가 아닙니다.");
			request.getRequestDispatcher("/member/login.jsp").forward(request, response);
		}
		
		
		
	}

}
