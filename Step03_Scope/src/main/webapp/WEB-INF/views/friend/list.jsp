<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	//list 라는 기값으로 담긴 request scope 에 담겨있는 List<String> typr의 참조값 얻어오기
	List<String> list=(List<String>)request.getAttribute("list");
%>
<html>
<head>
<meta charset="UTF-8">
<title>/WEB-INF/views/friend/list.jsp</title>
</head>
<body>
	<h3>친구 목록</h3>
	<%for(String tmp:list){ %>
	<p> 이름 : <strong><%=tmp %></strong></p>
	
	<%} %>
</body>
</html>