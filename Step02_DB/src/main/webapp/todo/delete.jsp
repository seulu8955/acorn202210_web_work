<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//삭제할 번호 읽어오기
	int num=Integer.parseInt(request.getParameter("num"));
	//삭제하기
	TodoDao.getInstance().delete(num);
	//리다일렉트 응답하기(특정 경로로 요청을 다시하라고 강요하는 응답)
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/todo/list.jsp");
	//리다일렉트 응답을 받은 경우 밑에 있는 응답은 지워도 된다
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/delete.jsp</title>
</head>
<body>

</body>
</html>