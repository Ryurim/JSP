package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model2.bbs.BbsDAO;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Servlet implementation class DeleteController
 */
public class DeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NumberFormatException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		//String user_id = request.getParameter("user_id");
		//String title = request.getParameter("title");
		//String content = request.getParameter("content");

		//BbsDTO dto = new BbsDTO();
		//dto.setIdx(idx);

		//dto.setUser_id(user_id);
		//dto.setTitle(title);
		//dto.setContent(content);

		BbsDAO dao = new BbsDAO();
		int result = dao.bbsDelete(idx);
		dao.close();
	
		Map<String, Object> params = new HashMap<>();
		params.put("result", result);
		
		request.setAttribute("params", params);

		//request.getRequestDispatcher("/bbs/list.do").forward(request,  response);
		response.sendRedirect("list.do");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
