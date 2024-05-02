package controller.message;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import message.MessageDAO;

import java.io.IOException;

/**
 * Servlet implementation class DeleteMessageController
 */
public class DeleteMessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String delete = request.getParameter("btnDelete");
		String read = request.getParameter("btnRead");
		String receiveId = request.getParameter("receiveId");
		
		String[] checkbox = request.getParameterValues("checkbox");

		for (String s : checkbox) {
			System.out.println(s);
		}

		MessageDAO dao = new MessageDAO();
		int deleteResult = 0;
		int readResult = 0;
		
		if (delete != null && !delete.equals("")) {
			for (int i=0; i<checkbox.length; i++) {
				int idx = Integer.parseInt(checkbox[i]);
				deleteResult  = dao.msgDelete(idx);
				
			}
			dao.close();
			if (deleteResult > 0) {
				//request.getRequestDispatcher("/mypage/message.jsp").forward(request, response);
				response.sendRedirect("/tspoon/message/msg.do");
			}
			else {
		
				response.sendRedirect("/tspoon/message/msg.do");
		
			}
			
		}
		
		if (read != null && !read.equals("")) {
			for (int i=0; i<checkbox.length; i++) {
				int idx = Integer.parseInt(checkbox[i]);
				dao.updateReadCnt(idx, receiveId);
				
			}
			dao.close();
			response.sendRedirect("/tspoon/message/msg.do");
		}
			
		
	
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
