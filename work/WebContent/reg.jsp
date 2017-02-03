<%@page import="mybatis.vo.MemVO"%>
<%@page import="mybatis.dao.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%
	//요청한글처리
	request.setCharacterEncoding("utf-8");
	//응답한글처리
	response.setContentType("text/html; charset=utf-8");
%>

<h1>회원가입</h1>
<hr/>

<table width=300>
<tr><td>
	<form action="reg_ok.jsp" method="post">
	  <div class="form-group">
	    <label for="exampleInputEmail1">id</label>
	    <input type="text" class="form-control" id="exampleInputId" placeholder="아이디" name="id">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">Password</label>
	    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="패스워드" name="pwd">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">이름</label>
	    <input type="text" class="form-control" id="exampleInputName" placeholder="이름" name="name">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">이메일</label>
	    <input type="text" class="form-control" id="exampleInputEmail" placeholder="이메일" name="email">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">전화번호</label>
	    <input type="text" class="form-control" id="exampleInputPhone" placeholder="전화번호" name="phone">
	  </div>
	  
	  <button type="button" class="btn btn-default" onclick="send(this.form)">회원가입</button>
	</form>
</td></tr>
</table>
</body>
</html>