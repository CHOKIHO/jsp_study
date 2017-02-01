package pm;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MyServlet4")
public class MyServlet4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyServlet4() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//요청한글처리
		request.setCharacterEncoding("utf-8");

		String fn[] = request.getParameterValues("fn");

		//응답한글처리
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		for (int i=0;i<fn.length;i++) {
			out.println("<h2>"+fn[i]+"</h2>");
		}
		out.close();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
