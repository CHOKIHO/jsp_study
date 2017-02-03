<%@page import="mybatis.vo.MemVO"%>
<%@page import="mybatis.dao.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
<H1>내용</H1>
<hr/>
<%
	//요청한글처리
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	MemVO mem = MemDAO.login(id, pwd);
	
	if (mem !=null) {
%>
	<%=mem.getName()%>님 환영합니다.
	
<table width=300>
<tr><td>
	<form action="login.jsp" method="post">
	  <button type="button" class="btn btn-default" onclick="javascript:location.href='logout.jsp'">로그아웃</button>
	</form>
</td></tr>
</table>
<%				
	} else {
%>		
	아이디와 비밀번호가 일치하지 않습니다.
<table width=300>
<tr><td>
	<form action="login.jsp" method="post">
	  <button type="button" class="btn btn-default" onclick="javascript:location.href='index.jsp'">처음으로</button>
	</form>
</td></tr>
</table>

<% 
	}
%>
</body>
</html>