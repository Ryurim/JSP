package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model2.bbs.BbsDAO;
import model2.bbs.BbsDTO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import common.CommonUtil;


public class ModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Map<String, Object> params = new HashMap<String, Object>();
		
		BbsDAO dao = new BbsDAO();
		int idx = Integer.parseInt(request.getParameter("idx"));
		BbsDTO bbsView = dao.bbsView(idx);
		dao.close();
		
		int read_cnt = 0;
		String user_id = "";
		String reg_date = "";
		String title = "";
		String content = "";
		if (bbsView != null) {
			read_cnt = bbsView.getRead_cnt();
			user_id = bbsView.getUser_id();
			reg_date = bbsView.getReg_date().toString();
			title = bbsView.getTitle();
			content = bbsView.getContent();
			content = (content != null ? content.replace("<br>", "\r\n") : "");
			content = (content != null ? content.replace("&nbsp;", " ") : "");
		}
		
		params.put("idx", idx);
		params.put("read_cnt", read_cnt);
		params.put("user_id", user_id);
		params.put("reg_date", reg_date);
		params.put("title", title);
		params.put("content", content);
		
		request.setAttribute("params", params);
		
		request.getRequestDispatcher("modify.jsp").forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		int idx = Integer.parseInt(request.getParameter("idx").trim());
	
		
		
		//idx = Integer.parseInt(request.getParameter("idx"));

		String user_id = request.getParameter("user_id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		
		
		BbsDTO dto = new BbsDTO();
		dto.setIdx(idx);
		dto.setUser_id(user_id);
		dto.setTitle(title);
		dto.setContent(content);

		BbsDAO dao = new BbsDAO();
		int result = dao.bbsModify(dto);
		dao.close();

		System.out.println(result);
		if (result > 0) {
			response.sendRedirect("list.do");

		} else {
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('글 수정 시 에러가 발생하였습니다.')");
			writer.println("window.location.replace('list.do')");
			writer.println("</script>");
		}
		
	
		
	}

}
