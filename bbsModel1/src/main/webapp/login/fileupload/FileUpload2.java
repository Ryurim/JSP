package fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class FileUpload
 */
@WebServlet("/FileUpload2.do")
@MultipartConfig(
		maxFileSize = 1024*1024*1,
		maxRequestSize = 1024*1024*10
		)
public class FileUpload2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
		try {
			//String directory = getServletContext().getRealPath("/Upload2");
			String directory = "D:\\java4\\JSP\\chap13\\src\\main\\webapp\\Upload";
			System.out.println("directory : " + directory);
			
			ArrayList<String> arrFileName = FileUtil.uploadFile2(req, directory);
			
			for (String orgFileName : arrFileName) {
				String savedFileName = FileUtil.renameFile(directory, orgFileName);
				
				//DB 저장하기
				registFile(req, orgFileName, savedFileName);
			}
			
//			파일 하나만 저장할 때
//			String orgFileName = FileUtil.uploadFile1(req, directory);
//			String savedFileName = FileUtil.renameFile(directory, orgFileName);
//			
//			//DB 저장하기
//			registFile(req, orgFileName, savedFileName);
			
			
			//페이지 이동
			resp.sendRedirect("./fileList.jsp");
			
		} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
				
				req.setAttribute("errMsg", "파일 업로드 오류");
				req.getRequestDispatcher("file.jsp").forward(req, resp);
		}
		
		doGet(req, resp);
	}
	
	
	private void registFile(HttpServletRequest req, String orgFileName, String sFileName) {
		String title = req.getParameter("title");
		String[] arrCategory = req.getParameterValues("category");
		StringBuffer cb = new StringBuffer();
		if (arrCategory == null) {
			cb.append("선택 항목 없음");
		}
		else {
			for (String s : arrCategory) {
				cb.append(s + ", ");
			}
		}
		System.out.println("파일 외 폼값 : " + title + "\n" + cb.toString());
		
		FileDTO dto = new FileDTO();
		dto.setTitle(title);
		dto.setCategory(cb.toString());
		dto.setOrgFile(orgFileName);
		dto.setSaveFile(sFileName);
		
		FileDAO dao = new FileDAO();
		dao.registFile(dto);
		dao.close();
	}

}
