<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    /*
    	전송 파라미터를 추출하면 숫자 모양을 띄고 있어도 문자열로 읽어진다
    	읽어와서 숫자로 바꾸고 싶으면 Integer 클래스의 static 메소드 .parsInt() 메소드를 활용한다.
    	?num=x&amount=x
    */
    int num=Integer.parseInt(request.getParameter("num"));
    int amount=Integer.parseInt(request.getParameter("amount"));
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy</title>
</head>
<body>
	<p>
	<!-- 클라이언트에게 출력은 되지만 클라이어트 가 무시하는 주석 -->
		<strong><%=num %></strong> 번 상품<strong><%=amount %></strong>개를 주문했습니다.
		<%-- 
			jsp 가 무시하는 주석
		
			context path 는 나중에 제거되거나 병경될 예정이기 때문에 java code 영역이나 jsp페이지에
			실제로 코딩이 되어 있으면 안된다.
			
			그래서 메소드 혹은 아래dml El 을 활용해서 context path 를 출력해야 한다.
		 --%>
		<a href="${pageContext.request.contextPath }/index.html">인덱스로 돌아가기</a>
		
	</p>
</body>
</html>