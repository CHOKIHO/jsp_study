package am;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/t2")
public class MyServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init(ServletConfig config) throws ServletException {

		//최초실행시에만 수행
		System.out.println("init()");
	}

	public void destroy() {

		//서버종료시 수행
		System.out.println("destroy()");
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//요청시마다 수행
		System.out.println("service()");
		
		//요청방식에따라 doGet(), doPost() 호출
		String method = request.getMethod();
		
		System.out.println("method="+method);
		
		if (method.equals("POST")) {
			doPost(request, response);
		} else {
			doGet(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("doGet()");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("doPost()");
	}
}
