<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
	<div id="head">
		<jsp:include page="ex2_menu.jsp"></jsp:include>
	</div>
	<div id="content">
		<h1>첫번째 페이지</h1>
		<input type="button" value="첫번째" onclick="javascript:location.href='ex2_include.jsp'"/>
	</div>

</body>
</html>