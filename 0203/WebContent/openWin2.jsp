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

</head>
<body>

	<form name="f" method="post" action="addMemo2.jsp" encType="multipart/form-data">
	  <div class="form-group">
	    <label for="exampleInputTitle">제목</label>
	    <input type="text" class="form-control" id="exampleInputTitle" placeholder="제목을 입력하세요" name="title">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputContent">내용</label>
	    <textarea class="form-control" rows="3" name="content"></textarea>
	  </div>
	  <div class="form-group">
	    <label for="exampleInputPassword1">암호</label>
	    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="암호" name="pwd">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputWriter">작성자</label>
	    <input type="text" class="form-control" id="exampleInputWriter" placeholder="작성자를 입력하세요" name="writer">
	  </div>
	  <div class="form-group">
	    <label for="exampleInputFile">파일 업로드</label>
	    <input type="file" id="exampleInputFile" name="file">
	  </div>
	  <input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>"/>
	  <button type="submit" class="btn btn-default">제출</button>
	</form>

</body>
</html>