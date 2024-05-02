package controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;

import java.io.IOException;

/**
 * Servlet implementation class EditInfoController
 */
public class EditInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.getRequestDispatcher("/member/edit_myinfo_01.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result1 = 0;
		int result2 = 0;

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String tel = request.getParameter("tel");
		
		MemberDAO dao = new MemberDAO();
		
		result1 = dao.modifyPwd(id, pwd);
		result2 = dao.modifyTel(id, tel);
		dao.close();
		System.out.println(result1);
		
		if (result1 > 0 || result2 >0) {
			
			// 어디로 보내지??
			request.getRequestDispatcher("/main/index_login.jsp").forward(request, response);
		}
		else {
			response.sendRedirect("/tspoon/member/edit.do");
			
		}
		
	}

}
