<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send() {
		
		//sendRedirect
		document.forms[0].submit();
	}
</script>
</head>
<body>
	<h1>forward 연습</h1>
	<form action="ex3_forward.jsp" method="post">
		이름:<input type="text" name="s_name"/>
		<input type="hidden" name="v1" value="100"/><br/>
		<input type="button" value="보내기" onclick="send()"/><br/>	
	</form>
</body>
</html>