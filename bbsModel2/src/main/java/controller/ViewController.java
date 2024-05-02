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


public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = CommonUtil.parseInt(request.getParameter("idx"));
		BbsDTO bbsView = new BbsDTO();


		if (idx > 0) {
			BbsDAO dao = new BbsDAO();
			bbsView = dao.bbsView(idx);
			dao.close(); //여기서 안닫으면 BbsDAO에서 커넥션 맺은 후 거기에 일일히 다 쳐서 닫아야해. if(rs != null) rs.close() 이런거
		}  else {
			PrintWriter writer = response.getWriter();
			writer.println("<script>");
			writer.println("alert('접근 정보가 올바르지 않습니다.')");
			writer.println("window.location.replace('list.jsp')"); //히스토리가 남지 않게 하는 방법. null이 들어간게 보이지 않게 하는 방법임
			writer.println("</script>");
		}
		
		int read_cnt = 0;
		String user_id = "";
		String reg_date = "";
		String title = "";
		String content = "";
		if (bbsView != null) {
			read_cnt = bbsView.getRead_cnt();
			user_id = bbsView.getUser_id();
			reg_date = (bbsView.getReg_date() != null ? bbsView.getReg_date().toString() : "");
			title = bbsView.getTitle();
			content = bbsView.getContent();
			content = (content != null ? content.replace("\r\n", "<br>") : "");
			content = (content != null ? content.replace(" ", "&nbsp;") : "");
		}
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("idx", idx);
		params.put("read_cnt", read_cnt);
		params.put("user_id", user_id);
		params.put("reg_date", reg_date);
		params.put("title", title);
		params.put("content", content);
		
		
		request.setAttribute("params", params);
		
		request.getRequestDispatcher("/bbs/view.jsp").forward(request,  response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
