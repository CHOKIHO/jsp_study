<%@page import="mybatis.vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

	div#wrap div{
		float: left;
	}
	#login,#g_form{
		width: 200px;
		height: 100px;
		text-align: right;
	}
	input{
		border: 1px solid black;
		background-color: #dedede;
	}
	.title{
		text-align: right;
	}
	div#reg{
		display: none;
	}
	
	div#fail {
	
		border: 1px solid black;
		border-radius: 5px;
	}
</style>


<script type="text/javascript">
	
	
	//현재 페이지를 다른 logout페이지로 이동!
	function logout(){
		location.href="logout.jsp";
	}
	
	//회원 가입 폼을 보여주는 함수
	function regView(){
		//현재 문서에서 id가 "reg"인 요소를 검색한다.
		var reg_div = document.getElementById("reg");
		//검색된 요소를 화면에 보이도록 속성 변경
		reg_div.style.display = "block";
	}

	//회원 가입 폼을 숨기는 함수
	function notView(){
		//현재 문서에서 id가 "reg"인 요소를 검색한다.
		var reg_div = document.getElementById("reg");
		//검색된 요소를 화면에 보이도록 속성 변경
		reg_div.style.display = "none";
	}


	// 회원가입 폼에 값이 입력되었는지를 판단한 후
	// reg.jsp로 submit하는 함수
	function reg(){
		//현재 문서의 두번째 폼요소내에 있는 입력요소들을 모두
		//입력값을 확인하기 위한 반복문
		for(var i=0; i<document.forms[1].elements.length; i++){
			if(document.forms[1].elements[i].value == ""){
				//폼의 자식요소들 중 특정 요소의 값이 비어있다면...
				alert(document.forms[1].elements[i].name+"을(를) 입력하세요!");
				
				//해당 요소로 커서 이동
				document.forms[1].elements[i].focus();
				return;
			}
		}
		
		//if문 안에 있는 return문을 만나지 않았을 경우!
		document.forms[1].submit();
	}
	
	function myDisk(){
		location.href="myDisk.jsp";
	}
	
	function login(){
//		var s_id = document.getElementById("m_id").value;
		var s_id = document.forms[0].id.value;
		var s_pwd = document.forms[0].pwd.value;
		
		if(s_id == ""){
			alert("아이디를 입력하세요");
			document.forms[0].id.focus();
			return;
		}
		if(s_pwd == ""){
			alert("비밀번호를 입력하세요");
			document.forms[0].pwd.focus();
			return;
		}
		document.forms[0].submit();
	}
</script>


</head>
<body>
	<div id="wrap">

<%
	Object obj = session.getAttribute("login_vo");

	if (obj == null) {
%>

		<div id="login">
			<div id="l_form">
				<form action="login.jsp" method="post">
					<fieldset>
						<legend>Login</legend>
						<label for="m_id">ID:</label>
						<input type="text" name="id" id="m_id" size="8" maxlength="14"/><br/>
						<label for="m_pwd">PW:</label>
						<input type="password" name="pwd" id="m_pwd" size="8"/><br/>
						
						<input type="button" value="Registry" onclick="regView()"/>
						
						<input type="button" value="Login" id="log_bt" onclick="login()"/>
					</fieldset>
				</form>
			</div>
		</div>

<%
	} else {
		
		MemVO vo = (MemVO)obj;
%>

		<div id="g_form">
			<span class="u_name"><%=vo.getName()%></span>
			(<span class="u_id"><%=vo.getId() %></span>)님 환영합니다.
			<p>
				<input type="button" value="Logout"
					onclick="logout()"/>
			</p>
			<p>
				<input type="button" value="My Disk"
					onclick="myDisk()"/>
			</p>
		</div>
<%
	}
%>

		<div id="content">
			<div id="reg">
				<form action="reg.jsp" method="post">
					<fieldset>
						<legend>회원가입</legend>
						<table cellpadding="4" cellspacing="0">
							<tfoot>
								<tr>
									<td colspan="2" align="right">
										<input type="button" value="Registry" onclick="reg()"/>
										<input type="button" value="Cancel" onclick="notView()"/>
									</td>
								</tr>
							</tfoot>
							<tbody>
								<tr>
									<td class="title"><label for="id">ID:</label></td>
									<td><input type="text" name="id" id="id" size="12"/></td>
								</tr>
								<tr>
									<td class="title"><label for="pwd">Password:</label></td>
									<td><input type="password" name="pwd" id="pwd" size="12"/></td>
								</tr>
								<tr>
									<td class="title"><label for="name">Name:</label></td>
									<td><input type="text" name="name" id="name" size="12"/></td>
								</tr>
								<tr>
									<td class="title"><label for="phone">Phone:</label></td>
									<td>
										<select name="phone">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="017">017</option>
										</select>-
										<input type="text" name="phone" id="phone" size="5"/>-
										<input type="text" name="phone" id="phone" size="5"/></td>
								</tr>
								<tr>
									<td class="title"><label for="email">email:</label></td>
									<td><input type="text" name="email" id="email" size="30"/></td>
								</tr>
								<tr>
									<td class="title"><label for="addr">Addr:</label></td>
									<td><input type="text" name="addr" id="addr" size="20"/></td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</form>
			</div>
		</div>
		
	</div>
</body>
</html>
