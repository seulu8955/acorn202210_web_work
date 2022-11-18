<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		/*
			HttpSession 객체에 "nick"이라는 키값으로 저장된 값이 있는지 읽어와 본다. 없으면 null 리턴
			(Session scope에 "nuck"라는 키값으로 저장된 문자열이 있는지 얽어와 본다 
		*/
		String nick=(String)session.getAttribute("nick");
	%>
	<h3>노는 페이지</h3>
	<%if(nick==null){ %>
		<p>session 영역(scope)에 "nick" 이라는 키값으로 저장된 값이 없습니다.</p>
	<%}else{ %>
		<p>재밌게 노세요 <%=nick %></p>
	<%} %>
</body>
</html>