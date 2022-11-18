<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//수정할 할일의 번호와 내용 읽어오기
	request.setCharacterEncoding("utf-8");
	int num=Integer.parseInt(request.getParameter("num"));
	String content=request.getParameter("content");
	
	//tododto에 담기
	TodoDto dto=new TodoDto();	
	dto.setContent(content);
	
	boolean isSuccess=TodoDao.getInstance().update(dto);
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/update.jsp</title>
</head>
<body>
	<script>
		
		<%if(isSuccess){%>
			alert("수정 완료")
			location.her="list.jsp";
		<%}else{%>
			alert("수정 실패!")
			location.her="updateform.jsp?num=<%=num%>";
		<%}%>
	
		let d="<%=content %>"
	
	</script>
	
</body>
</html>