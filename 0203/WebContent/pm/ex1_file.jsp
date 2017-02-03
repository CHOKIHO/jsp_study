<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	//요청한글처리
	request.setCharacterEncoding("utf-8");


	
	String path = application.getRealPath("/");
	
	String dir = request.getParameter("dir");
	
	if (dir==null) {
		dir="";
	}
	
	File f = new File(path.concat(dir));
	
	//String[] names = f.list();
	File[] names = f.listFiles();

%>	
<h2><%=path%></h2>
<ul>
<%
	//for (String s : names) {
	for (File file : names) {
		if (file.isDirectory()) {
%>
		<li>
		<a href="ex1_file.jsp?dir=<%=file.getName()%>"><%=file.getName()%></a>
		</li>
<%
		} else {
%>
		<li>
		<%=file.getName()%>
		</li>
<%			
		}
	}
%>		
</ul>
</body>
</html>