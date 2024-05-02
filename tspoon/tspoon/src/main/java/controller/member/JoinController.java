package controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;
import member.MemberDTO;

import java.io.IOException;


public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/member/join.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		
		String name = request.getParameter("iname");
		String id = request.getParameter("idn");
		String pwd = request.getParameter("password");
		String pwd2 = request.getParameter("password2");
		String birthY = request.getParameter("birthY");
		String birthM = request.getParameter("birthM");
		String birthD = request.getParameter("birthD");
		String tel = request.getParameter("telnumber");
		String emailId = request.getParameter("emailId");
		String emailDomain = request.getParameter("emailDomain");
		String email = emailId + "@" + emailDomain;
		String interest = request.getParameter("interest");
		String grade = request.getParameter("grade");
		String sex = request.getParameter("rr");
		
		
		MemberDTO dto = new MemberDTO();
		dto.setName(name);
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setBirthY(birthY);
		dto.setBirthM(birthM);
		dto.setBirthD(birthD);
		dto.setTel(tel);
		dto.setEmail(email);
		dto.setInterest(interest);
		dto.setGrade(grade);
		dto.setSex(sex);
		
		MemberDAO dao = new MemberDAO();
		
		
		
		// 회원가입
		
		int idResult = dao.getIdCount(id);
		
		
		if (idResult > 0) {
			dao.close();
			request.setAttribute("idErr", "idErr");
			request.getRequestDispatcher("/member/join.jsp").forward(request, response);
		}
		
		
		else {
			result = dao.registMember(dto);
			dao.close();
			
			if (result > 0) {
				request.removeAttribute("idErr");
				response.sendRedirect("/tspoon/member/login.do");
			} else {
				request.removeAttribute("idErr");
				System.out.println("회원가입 실패");
				request.getRequestDispatcher("/member/join.jsp").forward(request, response);
			}
			
		}
		
		
		
	}

}
