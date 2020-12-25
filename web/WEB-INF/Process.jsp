<%-- 
    Document   : Process
    Created on : 9 Jan, 2020, 7:25:00 PM
    Author     : Ramesh ji jain
--%>

<%@page import="javax.websocket.Decoder.BinaryStream"%>
<%@page import="java.awt.PageAttributes.MediaType.B"%>
<%@page import="java.sql.Blob"%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         
         <% 
           
            String s=request.getParameter("val");
            if(s==null || s.trim().equals(""))
            {
                out.println("Enter ID");
                    
            }
            else {
                        int id=Integer.parseInt(s);
                        try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","root");
                            PreparedStatement ps =con.prepareStatement("select * from solution where id =?");
                            ps.setInt(1,id);
                            ResultSet rs=ps.executeQuery();
                            while(rs.next())
                            { 
                                out.print(rs.getInt(1)+" "+rs.getString(2));
                            }
                            
                        }
                        catch(Exception e)
                        {
                            out.println("ERROR00");
                        }
                    }
        
        %>
            
    </body>
</html>
