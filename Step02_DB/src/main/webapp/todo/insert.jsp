<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1. 폼에서 전송되는 할일과 날자 읽어오기
	2. Dao에 DTo를 전달해 저장하고 성공여부 가져오기
	3. 성공여부 응답
	*/
	request.setCharacterEncoding("utf-8");// 한글이 깨지지 않도록
	String content=request.getParameter("content");//request메소드의 getParameter를 통해 받아와서
	
	//TodoDto에 담고
	TodoDto dto=new TodoDto();
	dto.setContent(content);
		
	//db에 저장하기
	boolean isSuccess=TodoDao.getInstance().insert(dto);
	//body에 응답하기
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
</head>
<body>
	<div class="container">
		<%if(isSuccess){ %>
			<p>
				할일을 추가했습니다.
				<a href="list.jsp">확인</a>
			</p>
		<%}else{ %>
			<p>
			일정 추가 실패
			<a href="insertform.jsp">다시 시도</a>
			</p>
			<%} %>
	</div>
</body>
</html>