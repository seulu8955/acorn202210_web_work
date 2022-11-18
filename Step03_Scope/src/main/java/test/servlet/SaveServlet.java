package test.servlet;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/*
 * @WebServlet("/test/save") 어노테이션 설정 대신에
 * /WEB-INF/web.xml 문서에 아래의 설정을 대체 가능하다.
 * <?xml version="1.0" encoding="UTF-8"?>
	<web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd" version="4.0">
  <display-name>Step03_Scope</display-name>
  
  <!--
  	/Step03_Scope/경로(최상위) 요청을 했을때 응답할 페이지 목록
	서버 자체에 web.xml 이 있고 여기에 추가하거나 따로 설정할게 있을경우
	프로젝트 우클릭-java ee-generate
   -->
  <welcome-file-list>
    <welcome-file>index.jsp</welcome-file>
  </welcome-file-list>
  
  <!-- 서블릿 위치를 알리고 이름 부여하기(서블릿 정의) -->
  <servlet>
  	<servlet-name>SaveServlet</servlet-name>
  	<servlet-class>test.servlet.SaveServlet</servlet-class>
  </servlet>
  <!-- 어떤 이름의 서블릿이 어떤 패턴의 요청을 처리할지 지정하기 (서블릿 맵핑)-->
  <servlet-mapping>
  	<servlet-name>SaveServlet</servlet-name>
  	<url-pattern>/test/save</url-pattern>
  </servlet-mapping>
</web-app>
 */
public class SaveServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		session.setMaxInactiveInterval(60);
		//응답
		RequestDispatcher rd=req.getRequestDispatcher("/WEB-INF/views/test/save.jsp");
		rd.forward(req, resp);
	}

}
