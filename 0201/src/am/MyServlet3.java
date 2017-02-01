package am;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MyServlet3")
public class MyServlet3 extends HttpServlet {

	private static final long serialVersionUID = 1L;
       
    public MyServlet3() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//응답한글처리
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		//요청한글처리
		request.setCharacterEncoding("utf-8");
		
		String v1 = request.getParameter("var1");
		String v2 = request.getParameter("var2");
		
		out.println("<h1>"+v1+"<h1>");
		out.println("<h2>"+v2+"<h2>");
		out.close();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
