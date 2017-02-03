<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<TITLE> New Document </TITLE>
<style type="text/css">
	a:link {text-decoration:none; color:#87aaec}
	a:visited {text-decoration:none; color:#87aaec}
	a:hover {text-decoration:none; color:orange}
	dt {float:left; width:200px;text-align:right}
	dd {font-size:8pt; width:300px; color:black}
	.tt1 {font-szie:8pt; font-weight:bold; color:white}
	.tt2 { font-size:8pt}
	.tt3 {font-size:8pt; font-weight:bold; color:green}
</style>


<script language="JavaScript">
	function send(ff)
	{

		if(ff.writer.value =="")
		{
			alert("이름을 입력하세요");
			ff.writer.focus();
			return;
		}
		if(ff.memo.value =="")
		{
			alert("최소한 몇자는 입력하셔야죠?");
			ff.memo.focus();
			return;
		}
		ff.submit();
	}

</script>
</HEAD>

<BODY>
	<img src="images/memo.gif">
	<hr noshade color="green">

	<form name="f" method="post" action="addMemo.jsp">
		<fieldset>
		<dl>
			<dt>Name:</dt>
			<dd>
				<input type="text" name="writer" style="border:1 solid #A3D4F7">
			</dd>
			<dt>Pwd:</dt>
			<dd>
				<input type="password" name="pwd" style="border:1 solid #A3D4F7">
			</dd>
			<dt>Memo:</dt>
			<dd>
				<input type="text" name="memo" style="border:1 solid #A3D4F7" size="50" maxlength="15">
			</dd>
			<dd colspan="2" align="center">
				<input type="button" value="남기기" onClick="send(this.form)" style="border:1 solid  #A3D4F7; cursor:pointer" class="tt3">&nbsp;&nbsp;
				<input type="reset" value="다시쓰기" style="border:1 solid  #A3D4F7; cursor:pointer" class="tt3">
			</dd>
		</dl>
		</fieldset>
		<p>
		<dl width="100%">
			<dd width="50%">
				<img src="images/sp.gif">&nbsp;<label class="tt3">Memo 내용은 20자 이내로 하세요!</label>
			</dd>
			<dd align="right" width="50%">
				<input type="text" style="border:0" value="<%=request.getRemoteAddr()%>" name="ip" size="15" readonly="readonly" class="tt2">
			</dd>
		</dl>
	</form>
</BODY>
</HTML>
