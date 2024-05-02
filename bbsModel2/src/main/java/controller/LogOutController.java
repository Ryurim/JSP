package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


public class LogOutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		session.removeAttribute("UserId");
		session.removeAttribute("UserName");
		session.removeAttribute("UserPwd");
		
//		
//		Map<String, Object> params = new HashMap<>();
//		params.put("UserId", null);
//		
//		session.setAttribute("params", params);
		
		response.sendRedirect("../bbs/list.do");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	
		session.removeAttribute("UserId");
		session.removeAttribute("UserName");
		session.removeAttribute("UserPwd");
		
//		
//		Map<String, Object> params = new HashMap<>();
//		
//		params.put("UserId", null);
//		session.setAttribute("params", params);
//		
		response.sendRedirect("../bbs/list.do");
	}

}
