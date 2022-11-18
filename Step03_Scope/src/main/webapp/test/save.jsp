<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String nick=request.getParameter("nick");
	
	session.setAttribute("nick", nick);
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p><strong><%=nick %></strong></p>
	<p>30분 동안 아무런 요청을 하지 않거나 웹브라우저를 닫으면 자동 삭제 됩니다.</p>
	<a href="../index.jsp">인덱스로</a>	
	

</body>
</html>