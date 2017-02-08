<%@page import="ex5.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String makeString(String[] ar, String delim){
		StringBuffer sb = new StringBuffer();
		for(int i=0; i<ar.length; i++){
			sb.append(ar[i]);
			
			if(i < ar.length-1)
				sb.append(delim);
		}
		return sb.toString();
	}
%>
<%
	request.setCharacterEncoding("utf-8");
	
	/*
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
	
		String[] phone = request.getParameterValues("phone");
		String[] hobby = request.getParameterValues("hobby");
	
		String gender = request.getParameter("gender");
		
		MemVO vo = new MemVO();
		
		vo.setName(name);
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setPhone(phone);
		vo.setHobby(hobby);
		vo.setGender(Integer.parseInt(gender));
	*/
%>

<!--requeest파라미터로 받을때만....파일업로드 안됨.-->
<jsp:useBean id="vo" class="ex5.MemVO" scope="page">
	<jsp:setProperty name="vo" property="*" />
</jsp:useBean>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2><%=vo.getName() %></h2>
	<h2><%=vo.getId() %></h2>
	<h2><%=makeString(vo.getPhone(), "-") %></h2>
	<h2><%=makeString(vo.getHobby(), ",") %></h2>
	<h2><%=vo.getGender() +100 %></h2>

	
</body>
</html>