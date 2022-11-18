<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//값을 입력받기위한 form에 label과 input 를 만들고 추가버튼 만들기
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insertform.jsp</title>
</head>
<body>
	<h1>할일 추가</h1>
	<form action="insert.jsp" method="post">
	<div>
		<label for="content">할일</label>
		<input type="text" name="content" id="content" />		
		<!-- name 은 서버에서 파라미터를 추출할때 필요한것 id는 label 속성과 같게 -->
	</div>
	<button type="submit">추가</button>
	</form>
</body>
</html>