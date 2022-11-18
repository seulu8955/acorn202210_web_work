<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//수정할 번호 읽어와서
	int num=Integer.parseInt(request.getParameter("num"));
	//해당 할일의 정보를 db에서 불러온 다음
	TodoDto dto=TodoDao.getInstance().getData(num);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	
		<form action="update.jsp">
			
			<div>
				<label for="num"></label>
				<input type="text" name="num" id="num" value="<%=dto.getNum() %>" readonly/>
			</div>
			<div>
				<label for="content">내용</label>
				<input type="text" name="contenet" id="content" value="<%=dto.getContent() %>" />
				
			</div>
			<div>
				<label for="regdate">등록일</label>
				<input type="text" name="regdate" id="regdate" value="<%=dto.getRegdate() %>" readonly/>
			</div>
			<button type="submit">수정</button>
			<button type="reset">취소</button>
		</form>
	
	</div>
	
	
	
</body>
</html>