package controller.oneboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import oneboard.OneboardDAO;

import java.io.IOException;

/**
 * Servlet implementation class WriteOneboardController
 */
public class WriteOneboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/mypage/oneboard.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String id = String.valueOf(session.getAttribute("id"));
		String select1 = request.getParameter("select1");
		String select2 = request.getParameter("select2");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		content = (content != null ? content.replace("\r\n", "<br>") : "");
		content = (content != null ? content.replace(" ", "&nbsp;") : "");
		
		OneboardDAO dao = new OneboardDAO();
		
		int result = dao.writeBoard(id, title, content, select1, select2);
		System.out.println(result);
		
		if (result > 0) {
			response.sendRedirect("/tspoon/oneboard/board.do");
		}
		else {
			response.sendRedirect("/tspoon/oneboard/boardWrite.do");
		}
	}

}
