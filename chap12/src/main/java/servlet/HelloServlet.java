/**
 * 
 */
package servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * 
 */
public class HelloServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
		throws ServletException, IOException 
	{
		req.setAttribute("msg", "안녕하세요 GET~~~");
		req.getRequestDispatcher("./HelloServlet.jsp").forward(req, resp);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException 
		{
			req.setAttribute("msg", "안녕하세요 POST~~~");
			req.getRequestDispatcher("./HelloServlet.jsp").forward(req, resp);
		}
	
}
