<%@page import="mybatis.dao.MemoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function init() {
		
		//호출창 갱신
		opener.location.reload();
		
		//현재창 닫기
		window.close();
	}
</script>
</head>
<body onload="init()">
<%
	//요청한글처리
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String pwd = request.getParameter("pwd");
	String content = request.getParameter("memo");
	String ip = request.getParameter("ip");
	
	boolean flag = MemoDAO.add(" ", content, pwd, writer, ip);

%>
</body>
</html>