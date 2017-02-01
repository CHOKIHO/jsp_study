package pm;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MyServlet7")
public class MyServlet7 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyServlet7() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String type = request.getParameter("type");
		
		if (type == null || type.equals("login")) {	
			response.sendRedirect("pm/ex3_login.html");
		
		} else if (type.equals("greet")) {

			//페이지이동
			//response.sendRedirect("MyServlet7_1");

			RequestDispatcher rd = request.getRequestDispatcher("MyServlet7_1");
			rd.forward(request, response);

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
