package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.MemberDAO;
import member.MemberDTO;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Servlet implementation class LoginOkController
 */
public class LoginOkController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		Map<String, Object> params = new HashMap<String, Object>();
		
		MemberDAO dao = new MemberDAO();

		MemberDTO dto = dao.getMemberInfo(id, pwd);
		dao.close();

		HttpSession session = request.getSession();
		
		if (dto != null && dto.getMemberId() != null) {
			session.setAttribute("UserId", dto.getMemberId());
			session.setAttribute("UserName", dto.getName());
			session.setAttribute("UserPwd", dto.getPwd());
			
			response.sendRedirect("../bbs/list.do");
		}
		else {
			params.put("errMsg", "로그인 오류");
			request.setAttribute("params", params);
			
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Map<String, Object> params = new HashMap<String, Object>();
//		
//		params.put("errMsg", "로그인 오류");
//		request.setAttribute("params", params);
//		
		request.getRequestDispatcher("login.jsp").forward(request, response);
		
	}
		
	

}
