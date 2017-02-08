<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("s_name");
	String yy = request.getParameter("year");
	String age = request.getParameter("age");
			
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function test(ff){
		ff.submit();
	}
</script>
</head>
<body>
<%
	if(name == null || yy == null || age == null){
%>
	<h1>포워드 연습</h1>
	<form action="ex4_forward.jsp" method="post">
		이름:<input type="text" name="s_name"/><br/>
		생년:<input type="text" name="year"/><br/>
		<input type="button" value="보내기"
			onclick="test(this.form)"/>
	</form>
<%
	}else{
%>
	<h1>받은 값: <%=name %>님은 <%=yy %>년생이므로 <%=age %>세입니다.</h1>
<%		
	}
%>	
</body>
</html>


