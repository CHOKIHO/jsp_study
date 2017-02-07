<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//요청한글처리
	request.setCharacterEncoding("utf-8");
	
	String cPath = request.getParameter("cPath");
	String f_name = request.getParameter("f_name");
	String txt = request.getParameter("txt");
	String content = request.getParameter("content");
	
	String path = application.getRealPath("/members/"+cPath+"/" + f_name + txt);
	
	File f = new File(path);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New File 처리</title>
<script type="text/javascript">
	function gogo() {
		document.forms[0].submit();
	}
</script>
</head>
<body onload="gogo()">

	<form action="myDisk.jsp" method="post">
		<input type="hidden" name="cPath" value="<%=cPath%>"/>
		<% if (f.exists()) { %>
		<input type="hidden" name="chk" value="0"/>
		<% } %>
	</form>
<%
	if (!f.exists())  {
		FileOutputStream fos = null;
		
		try {
			fos = new FileOutputStream(f);
			PrintWriter pw = new PrintWriter(fos);
			pw.write(content);
			pw.flush();
			pw.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				if (fos != null) fos = null;
			}
			catch(Exception e) {
				
			} finally {
				
			}
		}
	}
%>
</body>
</html>