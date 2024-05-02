package controller.oneboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import oneboard.AnswerDAO;
import oneboard.AnswerDTO;
import oneboard.OneboardDAO;
import oneboard.OneboardDTO;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Servlet implementation class ViewOneboardController
 */
public class ViewOneboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		OneboardDTO dto = new OneboardDTO();
		OneboardDAO dao = new OneboardDAO();
		AnswerDTO answerDto = new AnswerDTO();
		
		dto = dao.boardView(idx);
		answerDto = dao.answerView(idx);
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
		
		if (answerDto != null) {
		map.put("answerTitle", answerDto.getTitle());
		map.put("answerContent", answerDto.getContent());
		map.put("answerRegDate", answerDto.getRegDate());
		}
		
		request.setAttribute("boardView", map);
		
		
		request.getRequestDispatcher("/mypage/oneboard_02.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
