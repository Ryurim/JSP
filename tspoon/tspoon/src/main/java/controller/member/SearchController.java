package controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;
import member.MemberDTO;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;


public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/member/search_id.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("iname");
		String tel = request.getParameter("tel");
		
		MemberDAO dao = new MemberDAO();
		
		List<MemberDTO> idList = dao.searchId(name, tel);
		dao.close();
		
		request.setAttribute("idList", idList);
		
		if (!idList.isEmpty()) {
			request.getRequestDispatcher("/member/search_id_02.jsp").forward(request, response);
		}
		else {
			request.setAttribute("errMsg", "비밀번호를 확인해 주세요");
			request.getRequestDispatcher("/member/search_id_01.jsp").forward(request, response);
		}
		
	}

}
