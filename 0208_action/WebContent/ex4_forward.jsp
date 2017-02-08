<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("s_name");
	String yy = request.getParameter("year");
			
	//파라미터 값들 중 하나라도 받지 못한 경우는 forward시킨다.
	if(name == null || yy == null){
%>
	<jsp:forward page="ex4_form.jsp"/>
<%		
	}else{
		
		//이름과 생년을 받은 상태다.
		//현재 날짜를 구하여 나이를 연산해 내자!
		Calendar now = Calendar.getInstance();
		int c_yy = now.get(Calendar.YEAR);// 현재 년도 값
		int c_mm = now.get(Calendar.MONTH+1);
		int c_dd = now.get(Calendar.DAY_OF_MONTH);
		
		//나이는 현재년도 - 태어난년도
		// 연산을 수행하기 위해 태어난 년도의 값을 정수로 바꾼다.
		int b_yy = Integer.parseInt(yy);
		
		int age = c_yy-b_yy;
		
%>    
		<jsp:forward page="ex4_form.jsp">
			<jsp:param value="<%=age %>" name="age"/>
		</jsp:forward>
<%
	}
%>






