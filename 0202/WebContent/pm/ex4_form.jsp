<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Java Server Page - ex4</title>
<script type="text/javascript">

	function send(ff) {
		
		if (ff.id.value.trim().length < 1) {
			alert("아이디는 4글자 이상으로 입력하세요");
			ff.id.focus();
			return;
		}

		if (ff.pwd.value.trim().length < 1) {
			alert("패스워드는 4글자 이상으로 입력하세요");
			ff.pwd.focus();
			return;
		}
		ff.submit();
	}

</script>
</head>
<body>
	<h1>폼 파라메터 전송하기</h1>
	<hr>
	<form action="ex4_res.jsp" method="post">
		ID : <input type="text" name="id"/><br/>
		PW : <input type="password" name="pwd"/><br/>
		이름 : <input type="text" name="name"/><br/>
		이메일 : <input type="text" name="email"/><br/>
		전화번호 : <input type="text" name="phone"/><br/>
		<input type="button" value="회원가입" onclick="send(this.form)"/>		
	</form>

</body>
</html>