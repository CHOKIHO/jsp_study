<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//요청한글처리
	request.setCharacterEncoding("utf-8");
	
	String cPath = request.getParameter("cPath");
	String f_name = request.getParameter("f_name");
	
	File f = new File("/members/"+cPath+"/"+f_name);
	
	f.delete();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Delete 처리</title>
<script type="text/javascript">
	function gogo() {
		document.forms[0].submit();
	}
</script>
</head>
<body onload="gogo()">
	<form action="myDisk.jsp" method="post">
		<input type="hidden" name="cPath" value="<%=cPath%>"/></form>
</body>
</html>