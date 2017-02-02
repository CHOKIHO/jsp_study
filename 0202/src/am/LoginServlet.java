package am;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.dao.MemDAO;
import mybatis.vo.MemVO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//요청한글처리
		request.setCharacterEncoding("utf-8");
		//응답한글처리
		response.setContentType("text/html; charset=utf-8");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pw");
		
		MemVO vo = MemDAO.login(id, pwd);

		//응답
		PrintWriter out = response.getWriter();
		
		if (vo == null) {
			out.println("아이디, 비밀번호가 다릅니다.<br/>");
			out.println("<input type='button' value='이동' onclick='javascript:location.href=\"am/ex1_login.html\"'>");
		} else {
			out.println(vo.getName()+"님 반갑습니다.");
			
			//HttpSession 처리
			HttpSession session = request.getSession(true); //세션객체생성
			session.setAttribute("mem_vo", vo);
			
			out.println("<input type='button' value='이동' onclick='javascript:location.href=\"LoginNext\"'>");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
