<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	//선언부 (멤버변수,멤버메서드 정의) - 전역변수
	int cnt=5;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Server Page</title>
</head>
<body>
<%--
		스크립트릿 주석(소스보기 안보임)
 --%>
<!-- 
		HTML 주석 (소스보기)
 -->
<%
	//스크립트릿 - 자바코딩 가능 - 지역변수
	int sum = cnt + 10;
	//out.println(sum);
%>

합:<%=sum %>

</body>
</html>