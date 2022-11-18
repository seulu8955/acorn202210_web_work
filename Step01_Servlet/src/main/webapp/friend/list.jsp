<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<String> names=new ArrayList<>();
names.add("김구라");
names.add("해골");
names.add("원숭이");
%>
    
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
	<%for(String tmp:names) {
		out.write("<li> 이름 : "+tmp+"</li>");
	} %>
	</ul>
	
</body>
</html>