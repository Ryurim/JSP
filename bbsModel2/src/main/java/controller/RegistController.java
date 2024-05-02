package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model2.bbs.BbsDAO;
import model2.bbs.BbsDTO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import common.CommonUtil;

/**
 * Servlet implementation class RegistController
 */
public class RegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/bbs/regist.jsp").forward(request,  response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String user_id = request.getParameter("user_id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		BbsDTO dto = new BbsDTO();
		
		dto.setUser_id(user_id);
		dto.setTitle(title);
		dto.setContent(content);

		BbsDAO dao = new BbsDAO();
		int result = dao.bbsRegist(dto);
		dao.close();
		
		Map<String, Object> params = new HashMap<>();
		
		params.put("user_id", user_id);
		params.put("title", title);
		params.put("content", content);
		params.put("result", result);
		
		
		request.setAttribute("params", params);
		response.sendRedirect("list.do");
//		
//		
//		request.getRequestDispatcher("/bbs/view.jsp").forward(request,  response);

	}

}
