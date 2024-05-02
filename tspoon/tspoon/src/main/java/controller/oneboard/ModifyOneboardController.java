package controller.oneboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import oneboard.OneboardDAO;
import oneboard.OneboardDTO;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Servlet implementation class ModifyOneboardController
 */
public class ModifyOneboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		OneboardDTO dto = new OneboardDTO();
		OneboardDAO dao = new OneboardDAO();
		
		dto = dao.boardView(idx);
		dao.close();
		
		String content = "";
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("idx", dto.getIdx());
		map.put("id", dto.getId());
		map.put("title", dto.getTitle());
		content = dto.getContent();
		content = (content != null ? content.replace("<br>", "\r\n") : "");
		content = (content != null ? content.replace("&nbsp;", " ") : "");
		map.put("content", content);
		map.put("regDate", dto.getRegDate());
		map.put("select1", dto.getSelect1());
		map.put("select2", dto.getSelect2());
		map.put("answerIdx", dto.getAnswerIdx());
		
		request.setAttribute("boardView", map);
		request.getRequestDispatcher("/mypage/oneboard_04.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String select1 = request.getParameter("select1");
		String select2 = request.getParameter("select2");
		
		int result = 0;
		OneboardDAO dao = new OneboardDAO();
		result = dao.boardModify(title, content, select1, select2, idx);
		dao.close();
			
		if (result > 0) {
			response.sendRedirect("/tspoon/oneboard/boardView.do?idx=" + idx);
		}
		else {
			request.getRequestDispatcher("/mypage/oneboard_01.jsp").forward(request, response);
		}
	}

}
