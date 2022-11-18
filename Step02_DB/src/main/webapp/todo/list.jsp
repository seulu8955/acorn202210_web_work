<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//tododao 객체를 이용해서 할일 목록 가져오기
	List<TodoDto> list=TodoDao.getInstance().getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todo/list.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	h1{
		margin: 10px 10px 10px 10px;
	}
</style>
</head>
<body>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="todo" name="thisPage"/>
	</jsp:include>         
	<div class="container">
		<a href="insertform.jsp" class="navbar-brand">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
  				<path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
			</svg>
		</a>
		<br />
		<h1>할일목록</h1>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>번호</th>
					<th>내용</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<%for(TodoDto tmp:list){ %>
					<br />
					<tr>
						<td><%=tmp.getNum() %></td> <!-- out.print(tmp.getNum()); 으로 작성해야하지만 이를 =으로 대체해서 사용할수 있다. -->
						<td><%=tmp.getContent() %></td>
						<td><%=tmp.getRegdate() %></td>
						<td><a href="updateform.jsp?num=<%= tmp.getNum()%>">수정</a></td>
						<td><a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>
					
					</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>