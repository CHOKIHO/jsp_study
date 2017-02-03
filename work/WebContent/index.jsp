<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">

	function send(f) {
		
		if (f.id.value.trim().length < 1) {
			alert("아이디를 입력하세요");
			f.id.focus();
			return;
		}

		if (f.pwd.value.trim().length < 1) {
			alert("패스워드를 입력하세요");
			f.pwd.focus();
			return;
		}
		
		f.submit();
		
	}	

</script>
</head>
<body>

<h1>로그인</h1>
<hr/>

<table width=300>
<tr><td>
	<form action="login.jsp" method="post">
	  <div class="form-group">
	    <label for="exampleInputEmail1">id</label>
	    <input type="text" class="form-control" id="exampleInputId" placeholder="Id" name="id">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">Password</label>
	    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="pwd">
	  </div>
	  <button type="button" class="btn btn-default" onclick="send(this.form)">로그인</button>
	  <button type="button" class="btn btn-default" onclick="javascript:location.href='reg.jsp'">회원가입</button>
	</form>
</td></tr>
</table>


</body>
</html>