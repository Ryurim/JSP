package controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;

import java.io.IOException;

/**
 * Servlet implementation class ModifyPwdController
 */
public class ModifyPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		request.getRequestDispatcher("/member/search_pw_03.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println(id);
		String newPwd = request.getParameter("newPwd");
		System.out.println(newPwd);
		
		int result = 0;
		MemberDAO dao = new MemberDAO();
		result = dao.modifyPwd(id, newPwd);
		
		if (result > 0) {
			request.getRequestDispatcher("/member/login.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/member/login.jsp").forward(request, response);
		}
	}

}
