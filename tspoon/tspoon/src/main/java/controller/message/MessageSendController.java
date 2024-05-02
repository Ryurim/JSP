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
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.BbsPage;

/**
 * Servlet implementation class MessageSendController
 */
public class MessageSendController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String id = String.valueOf(session.getAttribute("id"));
		
		List<MessageDTO> list = new Vector<MessageDTO>();
		MessageDAO dao = new MessageDAO();
		int cntMsg = dao.cntSendMsg(id);
		int readMsg = dao.readMsg(id);
		

		//페이징 파라미터 설정
		Map<String, Object> params = new HashMap<>();
		int total_count = cntMsg;
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
		
		
		
		list = dao.sendMsgList(id, params);
		dao.close();
		
		request.setAttribute("msgList", list);
		request.setAttribute("cntMsg", cntMsg);
		request.setAttribute("readMsg", readMsg);
		request.setAttribute("params", params);
		
		request.getRequestDispatcher("/mypage/message_03.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
