<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//요청한글처리
	request.setCharacterEncoding("utf-8");
	
	String cPath = request.getParameter("cPath");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Folder 만들기</title>
<script type="text/javascript">
	function send(frm) {
		frm.submit();
	}
</script>
</head>
<body>
	<div id="wrap">
		<form action="newFolder_ok.jsp" method="post">
			<label for="f_name">폴더명:</label>
			<input type="text" id="f_name" name="f_name"/><br/>
			<input type="hidden" name="cPath" value="<%=cPath%>"/>
			<input type="button" value="만들기" onclick="send(this.form)"/><br/>
		</form>
	</div>
</body>
</html>