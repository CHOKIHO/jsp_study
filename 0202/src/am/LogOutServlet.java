package am;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogOutServlet")
public class LogOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LogOutServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//요청한글처리
		request.setCharacterEncoding("utf-8");
		//응답한글처리
		response.setContentType("text/html; charset=utf-8");
		
		//응답
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession(false);
		
		if (session != null && session.getAttribute("mem_vo") != null) {
			session.removeAttribute("emp_vo");
			out.println("로그아웃 되었습니다.");
		} else {
			out.println("로그인이 되어 있지 않습니다.");
		}
		
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
