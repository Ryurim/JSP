package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class DirectPrintServlet
 */
public class DirectPrintServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.getWriter().append("Served at: ").append(req.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter out = resp.getWriter(); //getWriter() : html 쓰는 역할을 하는애
		out.println("<html>");
		out.println("<head><title>DirectPrintServlet</title></head>");
		out.println("<body>");
		out.println("<h2>서블릿에서 직접 출력</h2>");
		out.println("<p>jsp로 이동 안함</p>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}

}
