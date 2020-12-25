<%-- 
    Document   : Update_Process
    Created on : 11 Jan, 2020, 11:23:30 AM
    Author     : Ramesh ji jain
--%>
<%@page import="com.LoginDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%!String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/mydb";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%String email=(String)session.getAttribute("email");
if(email != null)
{  Connection con = null;
    PreparedStatement stmt = null;
    ///PreparedStatement ps = null;
try
 { 
    Class.forName(driverName);
    con = DriverManager.getConnection(url,user,psw);
    String sql="update login set curhint = curhint + 1  where email =  '" +email + "'" ;
    stmt=con.prepareStatement(sql);
    // stmt = con.createStatement();
    int count = stmt.executeUpdate();
    String sql5="update login set wrong_hit = wrong_hit + 1  where email =  '" +email + "'" ;
    stmt=con.prepareStatement(sql5);
    int count5=stmt.executeUpdate();
    response.sendRedirect("index1.jsp?"+email);
 }
catch(SQLException sql)
    {
    request.setAttribute("error", sql);
    out.println(sql);
    }
}
else
{   out.println("NO EMAIL"+email);
}
%>