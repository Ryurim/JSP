package controller.message;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import member.MemberDAO;
import member.MemberDTO;
import message.FileDTO;
import message.MessageDAO;

import java.io.IOException;
import java.util.List;
import java.util.Vector;

import common.FileUtil;

@MultipartConfig(
		maxFileSize = 1024*1024*1,
		maxRequestSize = 1024*1024*10
		)
public class WriteMessageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String id = String.valueOf(session.getAttribute("id"));
		System.out.println(id);
		List<MemberDTO> receiveList = new Vector<MemberDTO>();
		MessageDAO dao = new MessageDAO();
		
		receiveList = dao.memberList(id);
		dao.close();
		
		
		request.setAttribute("receiveList", receiveList);
		
		request.getRequestDispatcher("/mypage/message_02.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		
		
		MessageDAO dao = new MessageDAO();
		
		String sendId = String.valueOf(session.getAttribute("id"));
		String sendName = String.valueOf(session.getAttribute("name"));
		 
		String receiveId = request.getParameter("receiveId");
		String receiveName = dao.receiveName(receiveId);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		content = content != null ? content.replace("\r\n", "<br>") : "";
		content = content != null ? content.replace(" ", "&nbsp;") : "";
		
		int result = 0;
		result = dao.writeMsg(receiveId, sendId, title, content, receiveName, sendName);
		dao.close();
		
		if (result > 0) {
			System.out.println("writedo");
			response.sendRedirect("/tspoon/message/msgSend.do");
		}
		else {
			response.sendRedirect("tspoon/message/msg.do");
		}
		
		
	}
//	
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//			
//		try {
//			String directory = getServletContext().getRealPath("/Upload");
//			String orgFileName = FileUtil.uploadFile(req, directory);
//			String savedFileName = FileUtil.renameFile(directory, orgFileName);
//			
//			//DB 저장하기
//			registFile(req, orgFileName, savedFileName, resp);
//			
//			
//			//페이지 이동
//			//resp.sendRedirect("./fileList.jsp");
//			
//		} catch (Exception e) {
//				System.out.println(e.getMessage());
//				e.printStackTrace();
//				req.setAttribute("errMsg", "파일 업로드 오류");
//				req.getRequestDispatcher("file.jsp").forward(req, resp);
//		}
//		
//		
//	}
//	
//	
//	private void registFile(HttpServletRequest req, String orgFileName, String sFileNam, HttpServletResponse resp) {
//		
//		HttpSession session = req.getSession();
//
//		
//		
//		MessageDAO dao = new MessageDAO();
//		
//		String sendId = String.valueOf(session.getAttribute("id"));
//		String sendName = String.valueOf(session.getAttribute("name"));
//		 
//		String receiveId = req.getParameter("receiveId");
//		String receiveName = dao.receiveName(receiveId);
//		String title = req.getParameter("title");
//		String content = req.getParameter("content");
//		content = content != null ? content.replace("\r\n", "<br>") : "";
//		content = content != null ? content.replace(" ", "&nbsp;") : "";
//		
//		
//		StringBuffer cb = new StringBuffer();
//		
//		
//		System.out.println("파일 외 폼값 : " + title + "\n" + cb.toString());
//		
//		FileDTO dto = new FileDTO();
//		dto.setId(sendId);
//		dto.setOrgFile(orgFileName);
//		dto.setSaveFile(sFileNam);
//		dto.setReceiveId(receiveId);
//		
//		dao.registFile(dto);
//		int result = 0;
//		result = dao.writeMsg(receiveId, sendId, title, content, receiveName, sendName);
//		dao.close();
//		
//		try {
//		if (result > 0) {
//			resp.sendRedirect("/tspoon/message/msgSend.do");
//		}
//		else {
//			resp.sendRedirect("tspoon/message/msg.do");
//		}
//		}catch (Exception e) {
//			System.out.println("ㅗㅈㄱ지 보내기 실패 ");
//			e.printStackTrace();
//		}
//	}

}
