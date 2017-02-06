<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//세션  key 삭제
	session.removeAttribute("login_vo");

	//세션 자체를 삭제
	//session.invalidate();
	
	response.sendRedirect("index.jsp");

%>
