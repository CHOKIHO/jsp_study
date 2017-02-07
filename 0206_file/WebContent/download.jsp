<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//요청한글처리
	request.setCharacterEncoding("utf-8");
	
	String cPath = request.getParameter("cPath");
	String f_name = request.getParameter("f_name");
	
	String path = application.getRealPath("/members/"+cPath+"/"+f_name);
	File f = new File(path);
	
	if (f.exists()) {
		long f_size = f.length();
		
		byte[] buf = new byte[1024];
		int size = -1;

		//스트림선언
		BufferedInputStream bis = null;
		FileInputStream fis = null;
		
		BufferedOutputStream bos = null;
		ServletOutputStream fos = null;	
		
		try {
			
			//화면 대화창 보이기 (http프로토콜의 헤더값 변경)

		    // page의 ContentType등을 동적으로 바꾸기 위해 초기화시킴
			response.reset();
			response.setContentType("application/octet-stream");
			
			//response.setContentType("application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment;filename="+ new String(f_name.getBytes(), "utf-8"));
		
			fis = new FileInputStream(f);
			bis = new BufferedInputStream(fis);
			
			//PrinterWriter out; (다운로드후 서버오류가 발생을 방지)
			out.clear();
			out = pageContext.pushBody();
			fos = response.getOutputStream();
			bos = new BufferedOutputStream(fos);
			
			while ( (size = bis.read(buf)) != -1 ) {
				bos.write(buf, 0, size);
				bos.flush();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
				if (fis != null ) fis.close();
				if (bis != null ) bis.close();
				if (fos != null ) fos.close(); 
				if (bos != null ) bos.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Download 처리</title>
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