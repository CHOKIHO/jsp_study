<%@page import="org.apache.log4j.Logger"%>
<%@page import="mybatis.dao.MemoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	static Logger logger = Logger.getLogger("addMemo_actiontag.jsp");
%>
<%
	//요청한글처리
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="memo" class="mybatis.vo.MemoVO" scope="page">
	<jsp:setProperty name="memo" property="title" />
	<jsp:setProperty name="memo" property="content" param="memo"/>
	<jsp:setProperty name="memo" property="pwd" />
	<jsp:setProperty name="memo" property="writer" />
	<jsp:setProperty name="memo" property="ip" />
</jsp:useBean>


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
	
	logger.info("title="+memo.getTitle());
	logger.info("memo="+memo.getContent());
	logger.info("pwd="+memo.getPwd());
	logger.info("writer="+memo.getWriter());
	logger.info("ip="+memo.getIp());
	
	
	boolean flag = MemoDAO.add(memo.getTitle(), memo.getContent(), memo.getPwd(), memo.getWriter(), memo.getIp());
%>
</body>
</html>