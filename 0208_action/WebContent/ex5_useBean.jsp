<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>useBean 폼</h1>
	<form action="ex5_useBean2.jsp" method="post">
		<fieldset>
			<legend>useBean test</legend>

			<label for="name">이름:</label>
			<input type="text" id="name" name="name"/><br/>

			<label for="id">아이디:</label>
			<input type="text" id="id" name="id"/><br/>

			<label for="pwd">비밀번호:</label>
			<input type="password" id="pwd" name="pwd"/><br/>

			<label for="phone">전화번호:</label>
			<input type="text" id="phone" name="phone"/>-
			<input type="text" name="phone"/>-
			<input type="text" name="phone"/><br/>

			<label for="hobby">취미:</label>
			<input type="checkbox" id="hobby" name="hobby" value="독서"/>독서
			<input type="checkbox" name="hobby" value="영화"/>영화
			<input type="checkbox" name="hobby" value="음악"/>음악<br/>
			
			<label for="gender">성별:</label>
			<input type="radio" id="gender" name="gender" value="2"/>여자
			<input type="radio" id="gender" name="gender" value="1"/>남자<br/><br/>

			<button>보내기</button>

			
			
		</fieldset>
	</form>
</body>
</html>