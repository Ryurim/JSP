package controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import common.CookieUtil;


public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		session.removeAttribute("idx");
		session.removeAttribute("id");
		session.removeAttribute("name");
		session.removeAttribute("pwd");
		session.removeAttribute("sex");
		session.removeAttribute("tel");
		session.removeAttribute("email");
		session.removeAttribute("interest");
		session.removeAttribute("grade");
		session.removeAttribute("birthY");
		session.removeAttribute("birthM");
		session.removeAttribute("birthD");
		
		CookieUtil.setDeleteCookie(response, "", "/", 0, "id", "");
		CookieUtil.setDeleteCookie(response, "", "/", 0, "pwd", "");
		CookieUtil.setDeleteCookie(response, "", "/", 0, "saveid", "");
		
		
		request.getRequestDispatcher("/main/index_logout.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
