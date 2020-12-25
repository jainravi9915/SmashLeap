<%@page import="com.LoginDAO"%>
<jsp:useBean id="loginBean" class="com.LoginBean" scope="session"/>
<jsp:setProperty name="loginBean" property="*"/>

<%
    
String result=LoginDAO.loginCheck(loginBean);
 if(result.equals("true")){
     
     session=request.getSession();
     session.setAttribute("email",loginBean.getEmail());
     response.sendRedirect("index1.jsp?"+loginBean.getEmail() );
}
 
if(result.equals("false")){
	response.sendRedirect("login.jsp?status=false");
}
 
if(result.equals("error")){
    response.sendRedirect("login.jsp?status=error");
}
 
%>