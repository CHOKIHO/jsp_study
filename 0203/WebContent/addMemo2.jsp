<%@page import="org.apache.log4j.Logger"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="mybatis.dao.MemoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	static Logger logger = Logger.getLogger("addMemo2.jsp");
%>
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

	//MultipartRequest는 생성자에서 파일저장위치가 필요함 (HttpSession 우회)
	//String cPath = request.getParameter("cPath");
	
	String path = application.getRealPath("/upload/");

    int maxPostSize = 10 * 1024 * 1024; // 10MB
    MultipartRequest multi = new MultipartRequest(request, path, maxPostSize, "utf-8", new DefaultFileRenamePolicy());

	String title = multi.getParameter("title");
	String content = multi.getParameter("content");
	String writer = multi.getParameter("writer");
	String pwd = multi.getParameter("pwd");
	String ip = multi.getParameter("ip");
	String file = multi.getOriginalFileName("file");
	
	logger.info("title="+title);
	logger.info("content="+content);
	logger.info("writer="+writer);
	logger.info("pwd="+pwd);
	logger.info("ip="+ip);
	logger.info("file="+file);
	
	
	/* 파일업로드 이후 DB 저장용 */
	//저장된 파일 
	File f = multi.getFile("file");
	
	// 중복 처리 전의 파일 이름 ()안은 input업로드 파일의 이름
	String o_Name = multi.getOriginalFileName("file");    

	//db업데이트 처리
	boolean flag = MemoDAO.add2(title, content, pwd, writer, ip, file);

%>

</body>
</html>