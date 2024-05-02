package controller.message;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import message.MessageDAO;
import message.MessageDTO;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Servlet implementation class ViewMessageController
 */
public class ViewMessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		HttpSession session = request.getSession();
		String id = String.valueOf(session.getAttribute("id"));

		MessageDTO dto = new MessageDTO();
		MessageDAO dao = new MessageDAO();
		Map<String, Object> map = new HashMap<String, Object>();
		String content = "";
		
		dto = dao.viewMsg(idx);
		
		
		
		if (dto != null) {
			dao.updateReadCnt(idx, id);
			dao.close();
			map.put("title", dto.getTitle());
			map.put("sendName", dto.getSendName());
			map.put("receiveDate", dto.getReceiveDate());
			content = dto.getContent();
			content = (content != null ? content.replace("<br>", "\r\n") : "");
			content = (content != null ? content.replace("&nbsp;", " ") : "");
			map.put("content", content);
			map.put("receiveDate", dto.getReceiveDate());
			
			request.setAttribute("params", map);
			request.getRequestDispatcher("/mypage/message_01.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/mypage/messsage.jsp").forward(request, response);
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
