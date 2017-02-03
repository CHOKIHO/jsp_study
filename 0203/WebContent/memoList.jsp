<%@page import="mybatis.dao.MemoDAO"%>
<%@page import="mybatis.vo.MemoVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<TITLE> New Document </TITLE>
<style>

	div#wrap 	{ margin:0 auto;width:372px; }
	a:link 		{ text-decoration:none;color:#87aaec }
	a:visited 	{ text-decoration:none;color:#87aaec }
	a:hover 	{ text-decoration:none;color:orange }

	table{
		border:0;
		width:370px;
	}

	td{font-size:9pt;color:green}

	table thead tr th{
		font-size:9pt;
		font-weight:bold;
		color:white; 
		background-color:#A3D4F7
	}

	.t1 {width:5% }
	.t2 {width:60% }
	.t3 {width:15% }
	.t4 {width:20% }
	
	.line { background-image:url("images/dot.gif"); height:1px }
	.bar { background-image:url("images/bar.gif"); height:6px }
</style>
<script type="text/javascript">
	function openWin(){
		open("openWin.jsp","","width=600,height=300,top=200,left=300");
	}
</script>
</HEAD>

<BODY>
<div id="wrap">
	<table summery="메모장리스트">
		<caption>메모장목록</caption>
		<thead>
			<tr align="center">
				<th class="t1">No.</th>
				<th class="t2">내  용</th>
				<th class="t3">글쓴이</th>
				<th class="t4">날짜</th>
			</tr>
			<tr>
				<td class="line" colspan="4"></td>
			</tr>
		<thead>
		<tfoot>
			<tr>
				<td colspan="4">
					<input type="button" value="메모 남기기" onClick="openWin()" style="border:1 solid #A3D4F7;font-size:9pt;color:green;cursor:pointer">
				</td>
			</tr>
		</tfoot>
		<tbody>
<%
		MemoVO[] ar = MemoDAO.getAll();
		
		for (MemoVO vo : ar) {
		
%>		
			<tr align="center">
				<td><%=vo.getIdx()%></td>
				<td align="left"><%=vo.getContent()%></td>
				<td><%=vo.getWriter()%></td>
				<td><%=vo.getWdt()%></td>
			</tr>
			<tr>
				<td colspan="4" class="line"></td>
			</tr>
<%
		}
%>			
			<tr>
				<td colspan="4" class="bar"></td>
			</tr>
		</tbody>
	</table>
</div>
</BODY>
</HTML>

