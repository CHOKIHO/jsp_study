<%@page import="java.io.File"%>
<%@page import="mybatis.vo.MemVO"%>
<%@page import="mybatis.dao.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	int totalSize = 10*1024*1024; // 10M
	int useSize =0;
	
	public int countUseSize(File f){
		
		File[] list = f.listFiles();
		int size = 0;
		
		for(File s_file : list){
			if(s_file.isFile())
				size += s_file.length();
			else
				size += countUseSize(s_file);
		}
		
		return size;
	}
%>	
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	
	String cPath=null;
	Object obj = session.getAttribute("login_vo");
	
	if (obj == null) {
%>		
	<script type="text/javascript">
		location.href="index.jsp";
	</script>
<%		
	} else {
		
		MemVO vo = (MemVO)obj;
		
		//cPath
		cPath = request.getParameter("cPath");
		
		String path = null;
		
		if (cPath == null) {
			cPath = vo.getId();
			path = application.getRealPath("/members/"+cPath);
			useSize = countUseSize(new File(path));
		} else {
			path = application.getRealPath("/members/"+cPath);
		}
		
		File select_file = new File(path);
		session.setAttribute("cPath", cPath);
		
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>내 디스크</title>
<style type="text/css">
	table, div{
		width: 600px;
		border: 1px solid black;
		border-collapse: collapse;
	}
	th, td{
		border: 1px solid black;
	}
	.dt{
		background-color: #dedede;
		width: 25%;
		text-align: center;
	}
	.dt2{
		background-color: #dedede;
		width: 15%;
		text-align: center;
	}
	.dt3{
		background-color: #dedede;
		width: 60%;
		text-align: center;
	}
	.dt4{
		background-color: #dedede;
		width: 25%;
		text-align: center;
	}
	li.item{
		float:left;
		width: 160px;
		margin-bottom: 20px;
	}
	hr{
		clear: both
	}
	ul.menu{
		list-style: none;
	}
	li a{
		display: block;
		font-size: 22px;
		line-height: 35px;
		margin-right: 10px;
		color: #00b3dc;
		font-weight: bold;
		padding: 0 8px;
		border: 2px solid #00b3dc;
		text-decoration: none;
		text-align: center;
	}
	div#file_win{
		position: absolute;
		top: 100px;
		left: 500px;
		width: 350px;
		height: 100px;
		background-color:#ffffff;
		border-radius: 10px;
		border: 1px solid black;
		padding: 10px;
		padding-top: 30px;
		text-align: center;
		display: none;
	}
	.dd{ text-align:center }

	div#f_div{
		position: absolute;
		top: 100px;
		left: 400px;
		width: 550px;
		height: 470px;
		background-color:#ffffff;
		border-radius: 10px;
		border: 1px solid black;
		padding: 10px;
		padding-top: 30px;
		text-align: center;
		display: none;
	}
	
</style>

<script type="text/javascript">
	// 인자로 들어오는 폴더명으로 다시 현재 페이지(myDisk.jsp)를
	// 로드하도록 하는 함수
	function re(fname){
		// 현재 문서(document)에 이름이 myForm이라는 폼객체 내에
		// 이름이 cPath라는 객체의 값(value)으로 현재 위치값(cPath)과
		// 인자의 값을 더하여 지정한다.
		document.myForm.cPath.value = "<%=cPath%>/"+fname;
		document.myForm.action = "myDisk.jsp";
		document.myForm.submit();
	}
	
	function up(path){
		// path는 이동하고자 하는 폴더의 전제경로 ('maru/test')
		document.myForm.cPath.value = path;
		document.myForm.action = "myDisk.jsp";
		document.myForm.submit();
	}
	
	function newFolder(){
		document.myForm.action = "newFolder.jsp";
		document.myForm.submit();
	}
	
	// 파일을 올리기하기 위해 div를 보여주는 메서드
	function upload(){
		// 아이디가 "file_win"인 객체를 검색한다.
		var f_div = document.getElementById("file_win");
		
		f_div.style.display = "block";
	}
	
	//파일 올리기 div 숨기기 기능
	function noView(){
		var f_div = document.getElementById("file_win");
		
		f_div.style.display = "none";
	}

	//파일 만리기 div 숨기기 기능
	function noView2(){
		var f_div = document.getElementById("f_div");
		
		f_div.style.display = "none";
	}

	
	//파일 다운로드 기능
	function down(fname){
		// 파일을 다운로드할 수 있도록
		// 파일이 있는 경로(cPath)와 
		// 파일의 이름(fname)을 보내야 한다.
		document.myForm.f_name.value = fname;
		document.myForm.action = "download.jsp";
		document.myForm.submit();
	}
	
	//파일을 삭제 하는 기능
	function del(fname){
		// 우선 진짜 삭제 할 것인지를 물어보자!
		var cmd = confirm("삭제하시겠습니까?");// true아니면 false
		if(cmd){
			document.myForm.f_name.value = fname;
			document.myForm.action = "delete.jsp";
			document.myForm.submit();
		}
	}
	
	//파일 만들기
	function make() {
		var f_div = document.getElementById("f_div");
		f_div.style.display = "block";
	}
	
	//
	function check() {
		alert("파일이 이미 존재합니다.");
	}
	
</script>
</head>
<body <% if (request.getParameter("chk") != null) { %> onload="chk()" <% } %>>
	<h1>MyDisk Service</h1>
	<table summary="사용량표시테이블" cellspacing="0" cellpadding="4">
		<tbody>
			<tr>
				<td class="dt">전체용량</td>
				<td><%=totalSize/1024 %>KB</td>
			</tr>
			<tr>
				<td class="dt">사용용량</td>
				<td><%=useSize/1024 %>KB</td>
			</tr>
			<tr>
				<td class="dt">남은용량</td>
				<td><%=(totalSize-useSize)/1024 %>KB</td>
			</tr>
		</tbody>
	</table>
	
	<hr/>
		<ul class="menu">
			<li class="item"><a href="#" onclick="newFolder()">폴더만들기</a></li>
			<li class="item"><a href="javascript:upload()">파일올리기</a></li>
			<li class="item"><a href="javascript:make()">파일만들기</a></li>
		</ul>
	<hr/>
	
	현재위치: <%=cPath %> 
<!-- 현재위치의 디렉토리 내부의 내용을 출력하는 표 -->	

	<table summary="현재위치내용테이블" cellpadding="4" cellspacing="0">
		<caption>현재 위치의 내용</caption>
		<thead>
			<tr>
				<th class="dt2">구분</th>
				<th class="dt3">폴더 및 파일명</th>
				<th class="dt4">삭제여부</th>
			</tr>
		</thead>
		<tbody>

		<% if (cPath != vo.getId() && cPath.split("/").length>=2) { 
			
			int pos = cPath.lastIndexOf("/");
			String upPath = cPath.substring(0, pos);

		%>
		<tr>
			<td class="dd"><img src="images/go_up.jpg"/></td>
			<td colspan="2">
				<a href="javascript:up('<%=upPath%>')">
					상위로...
				</a>
			</td>
		</tr>
		<% } %>
	
<%
	//현재위치(cPath) 하위요소를 표현
	
	File[] sub_list = select_file.listFiles();
	
	for (File f : sub_list) {
%>
		<tr>
			<td class="dd">
				<%
					if (f.isDirectory()) {
						out.println("<img src='images/folder.jpg' width='25' height='20'/>");
					} else {
						out.println("<img src='images/file.jpg' width='25' height='20'/>");
					}
				%>
			</td>
			<td>
				<%
					//폴더일경우 이동, 파일일경우 [다운로드]
					if (f.isDirectory()) {
				%>
				
				<a href="javascript:re('<%=f.getName()%>')"><%=f.getName()%></a>
				
				<% } else { %>
				
				<a href="javascript:down('<%=f.getName()%>')"><%=f.getName()%></a>
				
				<% } %>
			</td>
			<td>
				<% if (!f.isDirectory()) { %>
				<input type="button" value="삭제" onclick="del('<%=f.getName()%>')"/>
				<% } %>
			</td>
		</tr>
<%
	}
%> 	
 	
		</tbody>
	</table>
	
<!-- 상위로 기능, 폴더만들기 기능, 다운로드 기능 등을 
	사용하기 위한 폼객체  -->
	<form name="myForm" method="post">
		<input type="hidden" name="cPath" value="<%=cPath%>"/>
		<input type="hidden" name="f_name" />
		<!-- f_name은 스크립트 함수에 value값을 지정한다.
		  submit또한 스크립트 함수에서 처리한다. -->
	</form>	
	
<!-- 파일올리기 기능의 팝업창 -->	
	<div id="file_win">
		<form action="upload.jsp" method="post" encType="multipart/form-data" name="ff">
			<input type="hidden" name="cPath" value="<%=cPath%>"/>
			첨부파일:<input type="file" name="file"/><br/><br/>
			<input type="submit" value="저 장"/>
			<input type="button" value="취 소" onclick="noView()"/>
		</form>
	</div>

<!-- 파일만들기 기능의 팝업창 -->	
	<div id="f_div">
		<h2>파일만들기</h2>
		<form action="newFile.jsp" method="post" name="ff">
			<input type="hidden" name="cPath" value="<%=cPath%>"/>
			파일명:<input type="text" name="f_name"/><br/><br/>
			<select name="ext">
				<option value=".txt">txt</option>
				<option value=".html">html</option>
				<option value=".css">css</option>
			</select><br/>
			<textarea rows="20" cols="60" name="content"></textarea><br/><br/>
			<input type="submit" value="만들기"/>
			<input type="button" value="취 소" onclick="noView2()"/>
		</form>
	</div>
	
</body>
</html>
<%
	}
%>	