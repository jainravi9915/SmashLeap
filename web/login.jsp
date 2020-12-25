
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="login"  >
    <link rel="stylesheet" href="stylelogin.css">
    <% 
    
    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs=null;
     try{ 
      Class.forName("com.mysql.jdbc.Driver");
      con =DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","root");
        //redirect user to home page if already logged in
     }catch(Exception e)
     {
         out.print("sf"+e);
     }
     String email=(String)session.getAttribute("email");
        if(email!=null){
            response.sendRedirect("index1.jsp?"+email);
        }
        String status=request.getParameter("status");
        
        if(status!=null){
        	if(status.equals("false")){
        		   out.print("Incorrect login details!");	           		
        	}
        	else{
        		out.print("Some error occurred!");
        	}
        }
       
        %>
    <h1>Login</h1>
    <form method="post" action="loginRequestHandler.jsp" >
        <input type="text" name="email" placeholder="Username" required="required" />
           
        <input type="password" name="password" placeholder="Password" required="required" />
        <button type="submit" value="Login"  class="btn btn-primary btn-block btn-large">Let me in.</button>
    </form>
</div>