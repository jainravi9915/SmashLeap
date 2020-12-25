<%-- 
    Document   : logout
    Created on : 3 Feb, 2020, 8:34:42 PM
    Author     : Ramesh ji jain
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
session=request.getSession();  
session.invalidate();
response.sendRedirect("login.jsp");
%>


