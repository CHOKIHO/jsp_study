<%@page import="mybatis.vo.MemVO"%>
<%@page import="mybatis.dao.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//요청한글처리
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	MemVO vo = MemDAO.login(id, pwd);
	
	if (vo != null) {
		
		//HttpSession 저장
		session.setAttribute("login_vo", vo);
		
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
<div id="fail">ID, 비밀번호가 잘못되었습니다.
	<input type="button" value="확인" onclick="javascript:location.href='index.jsp'"/>
</div>
</body>
</html>
<%
	}
%>
