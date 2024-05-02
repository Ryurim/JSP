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
import java.util.Map;


public class SearchPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/member/search_pw.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("idn");
		String name = request.getParameter("iname");
		String tel = request.getParameter("tel");
		
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		Map<String, Object> map = new HashMap<String, Object>();
		
		dto = dao.searchPwd(id, name, tel);
		dao.close();
		
		
		
		
		if (dto != null) {
			
			map.put("id", dto.getId());
			map.put("pwd", dto.getPwd());
			map.put("name", dto.getName());
			map.put("birthY", dto.getBirthY());
			map.put("birthM", dto.getBirthM());
			map.put("birthD", dto.getBirthD());
			
			request.setAttribute("list", map);
			
			request.getRequestDispatcher("/member/search_pw_02.jsp").forward(request, response);
		}
		else {
			request.setAttribute("errMsg", "비밀번호를 확인해 주세요");
			request.getRequestDispatcher("/member/search_pw_01.jsp").forward(request, response);
		}
		
		
		
	}

}
