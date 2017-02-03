<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function send(form) {
		if (form.f_name.value.trim().length <1) {
			alert("폴더명 입력하세요");
			form.f_name.focus();
			return;
		}
		form.submit();
	}
	
</script>
</head>
<body>
	<h1>폴더 만들기</h1>
	<form action="ex2_mkdir.jsp" method="post">
	폴더명:<input type="text" name="f_name"/><br/>
	<input type="button" value="만들기" onclick="send(this.form)"/>
	</form>
</body>
</html>