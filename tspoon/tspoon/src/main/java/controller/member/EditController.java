package controller.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.ImgDTO;
import member.MemberDAO;
import member.MemberDTO;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/member/edit_myinfo.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		
		
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		ImgDTO imgDto = new ImgDTO();
		Map<String, Object> memberList = new HashMap<String, Object>();
		
		
		dto = dao.pwdInfo(id, pwd);
		dao.close();
		
		if (dto != null) {
			memberList.put("id", dto.getId());
			memberList.put("name", dto.getName());
			memberList.put("pwd", dto.getPwd());
			memberList.put("birthY", dto.getBirthY());
			memberList.put("birthM", dto.getBirthM());
			memberList.put("birthD", dto.getBirthD());
			memberList.put("sex", dto.getSex());
			memberList.put("tel", dto.getTel());
			
			request.setAttribute("memberList", memberList);
			
			request.getRequestDispatcher("/member/edit_myinfo_01.jsp").forward(request, response);
		}
		
		else {
			request.setAttribute("errMsg", "비밀번호를 확인해 주세요");
			request.getRequestDispatcher("/member/edit_myinfo.jsp").forward(request, response);
		}
		
		
		
	}

}
