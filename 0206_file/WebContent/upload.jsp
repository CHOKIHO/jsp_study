<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//요청한글처리
	request.setCharacterEncoding("utf-8");
	
	//MultipartRequest는 생성자에서 파일저장위치가 필요함 (HttpSession 우회)
	//String cPath = request.getParameter("cPath");
	String cPath = (String)session.getAttribute("cPath");
	
	String path = application.getRealPath("/members/"+cPath);
	
	/* 전송을 담당할 컴포넌트를 생성하고 파일 전송 완료됨
		-전송할 파일명을 가지고 있는 객체, 서버상의 절대경로, 최대 업로드될 파일 크기, 인코딩, 중복파일처리 */
	MultipartRequest mr = new MultipartRequest(request, path, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	
	/* 파일업로드 이후 DB 저장용 */
	//저장된 파일 
	File f = mr.getFile("file");
	
	// 중복 처리 전의 파일 이름 ()안은 input업로드 파일의 이름
	String o_Name = mr.getOriginalFileName("file");    
	
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
		<input type="hidden" name="cPath" value="<%=cPath%>"/>
	</form>
</body>
</html>