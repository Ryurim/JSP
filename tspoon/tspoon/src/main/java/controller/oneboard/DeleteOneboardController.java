package controller.oneboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import oneboard.OneboardDAO;
import oneboard.OneboardDTO;

import java.io.IOException;

/**
 * Servlet implementation class DeleteOneboardController
 */
public class DeleteOneboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") != null ? Integer.parseInt(request.getParameter("idx")) : 0;
		
		int result = 0;
		OneboardDAO dao = new OneboardDAO();
		result = dao.boardDelete(idx);
		dao.close();
		
		if (result > 0) {
			response.sendRedirect("/tspoon/oneboard/board.do");
		}
		else {
			response.sendRedirect("/tspoon/oneboard/board.do");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
