package controller.oneboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import oneboard.OneboardDAO;
import oneboard.OneboardDTO;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.BbsPage;


public class OneboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String id = String.valueOf(session.getAttribute("id"));
		
		
		
		List<OneboardDTO> list = new Vector<OneboardDTO>();
		OneboardDAO dao = new OneboardDAO();
		
		int cntboard = dao.boardCnt(id);
		
		
		
		//페이징 파라미터 설정
		Map<String, Object> params = new HashMap<>();
		int total_count = cntboard;
		int total_page = 1;
		int page_no = 1;
		int page_size = 10;
		int page_skip_cnt = 5;
		int page_block_size = 5;
		int page_block_start = 1;
		int page_block_end = 1;
				
		page_no = (request.getParameter("page_no") != null ? Integer.parseInt(request.getParameter("page_no")) : 1);
		page_skip_cnt = (page_no-1)*page_size;
				
		params.put("page_no", page_no);
		params.put("page_size", page_size);
		params.put("page_skip_cnt", page_skip_cnt);
		total_page = (int)Math.ceil(total_count/(double)page_size);
		page_block_size = 10;
		page_block_start = (int)Math.floor((page_no-1)/(double)page_size)*page_size + 1;
		page_block_end = (int)Math.ceil((page_no/(double)page_size))*page_size;
		page_block_end = (page_block_end > total_page ? total_page : page_block_end);
	
		params.put("total_count", total_count);
		params.put("total_page", total_page);			
		params.put("page_block_size", page_block_size);
		params.put("page_block_start", page_block_start);
		params.put("page_block_end", page_block_end);
				
		String pagingArea = BbsPage.pagingArea(total_page, page_no, page_block_start, page_block_end, "/tspoon/message/msgSend.do?" );
		params.put("paging", pagingArea);
				
		list = dao.boardList(id, params);
		dao.close();
				
		request.setAttribute("boardList", list);
		request.setAttribute("params", params);
		
		request.getRequestDispatcher("/mypage/oneboard_01.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HttpSession session = request.getSession();
//		
//		String id = String.valueOf(session.getAttribute("id"));
//		String select1 = request.getParameter("select1");
//		String select2 = request.getParameter("select2");
//		String title = request.getParameter("title");
//		String content = request.getParameter("content");
//		content = (content != null ? content.replace("\r\n", "<br>") : "");
//		content = (content != null ? content.replace(" ", "&nbsp;") : "");
//		
//		OneboardDAO dao = new OneboardDAO();
//		
//		int result = dao.writeBoard(id, title, content, select1, select2);
//		
//		if (result > 0) {
//			response.sendRedirect("/mypage/oneboard_01.jsp");
//		}
//		else {
//			response.sendRedirect("/tspoon/oneboard/boardWrite.do");
//		}
		doGet(request, response);
		
		
	}

}
