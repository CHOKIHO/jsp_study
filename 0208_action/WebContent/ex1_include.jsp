<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	h1 { color:blue; }
</style>
</head>
<body>
	<div>
		<h1>첫번째 include 페이지</h1>
	</div>
	<div>
		<jsp:include page="ex1.jsp"></jsp:include>
	</div>
	<div>
		<%@include file="ex1.jsp" %>
		<%=str %>
	</div>
	
</body>
</html>