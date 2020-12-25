<%-- 
    Document   : home
    Created on : 10 Jan, 2020, 7:02:54 PM
    Author     : Ramesh ji jain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login System</title>
    </head>
 
    <body>
        <%
        String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
        if(email==null){
        	response.sendRedirect("index.jsp");
        }
        %>
    
        <p>Welcome <%=email%></p>    
        <a href="logout.jsp">Logout</a>
    </body>
</html>