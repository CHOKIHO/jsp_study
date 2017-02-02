package am;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.vo.MemVO;

@WebServlet("/LoginNext")
public class LoginNext extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginNext() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//요청한글처리
		request.setCharacterEncoding("utf-8");
		//응답한글처리
		response.setContentType("text/html; charset=utf-8");
		
		//응답
		PrintWriter out = response.getWriter();
		
		//HttpSession 확인
		HttpSession session = request.getSession(true);
		
		Object obj = session.getAttribute("mem_vo");
		
		if (obj !=null) {
			out.println( ((MemVO)obj).getName() + "님 환영합니다.");	
			out.println("<input type='button' value='로그아웃' onclick='javascript:location.href=\"LogOutServlet\"'>");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
