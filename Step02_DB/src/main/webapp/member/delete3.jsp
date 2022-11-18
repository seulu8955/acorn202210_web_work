<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //GET 방식 파라미터로 전달되는 삭제할 회원의 번호를 읽어와서 숫자로 바로 바꿔준다. 
   int num=Integer.parseInt(request.getParameter("num"));
   //MemberDao 객체를 이용해서 삭제하기
   MemberDao.getInstance().delete(num);
   //2. 응답하기 ( 무슨응답을 하면 적절할까?/html javaScript를 사용하지 않고 페이지 이동만)
   
   response.sendRedirect("${pageContext.request.contextPath }/member/list.jsp");
   /*
   		요청을 한 클라이언트의 웹브라우저에게 새로운 경로로 요청을 다시하라고 강요하는 응답을 HttpServletResponse 객체를
   		이용해서 할수가 있다.
   		이것이 바로 리다일렉트 응답이다.
   		리다일렉트 응답은 "새로운 경로로 요청을 다시 하라고 강요하는 응답이다."
   		절대경로를 사용하는 것이 좋고
   		자체로 응답이기 때문에 아래의 html 문자열은 의미가 없다.
   */
	String cPath=request.getContextPath();
	
	response.sendRedirect(cPath+"/member/list.jsp");
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/delete2.jsp</title>
</head>
<body>
</body>
</html>