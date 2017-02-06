<%@page import="java.sql.Date"%>
<%@page import="java.io.File"%>
<%@page import="mybatis.vo.MemVO"%>
<%@page import="mybatis.dao.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	//전화번호 처리
	public String makeString(String[] ar, String delim) {
	
		StringBuffer sb = new StringBuffer();
		
		for (int i=0;i<ar.length;i++) {
			sb.append(ar[i]);
			
			if (i<ar.length-1) {
				sb.append(delim);
			}
		}
		
		return sb.toString();
}
%>
<%
	//요청한글처리
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	
	String[] phone = request.getParameterValues("phone");
	String cellphone = makeString(phone,"-");
	
	String email = request.getParameter("email");
	String addr  = request.getParameter("addr");

	//DB저장
	boolean check = MemDAO.addMember(id, pwd, name, email, cellphone);
	
	
	if (check) {
		MemVO vo = new MemVO();
		vo.setId(id);
		vo.setName(name);
		vo.setEmail(email);
		vo.setPhone(cellphone);
		
		//현재 날짜구하기
		Date now = new Date(System.currentTimeMillis());
		
		vo.setReg_date(now.toString());
		
		//HttpSession 저장
		session.setAttribute("login_vo", vo);
		
		//특정위치(members)에 해당 id 폴더생성
		String path = application.getRealPath("/members/"+id);
		//out.println("-----------------------------"+path);
		
		File f = new File(path);
		
		if (!f.exists()) {
			f.mkdirs();
		}
		
		//페이지이동
		response.sendRedirect("index.jsp");
		
	} else { 

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="fail">가입 실패
	<input type="button" value="확인" onclick="javascript:location.href='index.jsp'"/>
</div>
</body>
</html>
<%
	}
%>
