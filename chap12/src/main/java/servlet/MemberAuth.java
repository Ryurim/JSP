package servlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import member.MemberDAO;
import member.MemberDTO;

import java.io.IOException;

/**
 * Servlet implementation class MemberAuth
 */
public class MemberAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	MemberDAO dao; //여기에 만들어 공통변수로 만들어 놓으면 다 공유 가능! 리소스 절약 가능
	
	@Override
	public void init() throws ServletException {
		ServletContext application = this.getServletContext();
		
		String driver = application.getInitParameter("Driver");
		String url = application.getInitParameter("URL");
		String dbId = application.getInitParameter("dbId");
		String dbPwd = application.getInitParameter("dbPwd");
		
		dao = new MemberDAO(driver, url, dbId, dbPwd);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String admin_id = this.getInitParameter("ADMIN_ID"); //web.xml에서 갖고오는거
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		MemberDTO dto = dao.getMemberInfo(id, pwd);
		String name = dto.getName();
		if (name != null) {
			req.setAttribute("authMsg", name + " 님 로그인하셨습니다.");
		} else {
			if (admin_id.equals(id)) {
				req.setAttribute("authMsg", admin_id + " 는 관리자 계정입니다.");
			} else {
				req.setAttribute("authMsg", id + "는 회원이 아닙니다.");
			}
		}
		req.getRequestDispatcher("./member.jsp").forward(req, resp);
	}
	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

	@Override
	public void destroy() {
		dao.close();	//여기서 해주는게 아니라 값 할당하면 끝나게 해줘야해
	}
}