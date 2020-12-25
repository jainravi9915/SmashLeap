<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%String email=(String)session.getAttribute("email");
    if(email==null){
        response.sendRedirect("login.jsp");
   }Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String image=null,ap=null;
    int hitt=0,piid=0;;
       try{ 
        //    ("insert into Emp values(?,?)");  
       //stmt=con.prepareStatement     
        //PreparedStatement ps = con.prepareStatement(query);
      Class.forName("com.mysql.jdbc.Driver");
      con =DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","root");
      //stmt = con.createStatement();
       stmt=con.prepareStatement("select * from login where email ='" + email + "' ");  
      rs=stmt.executeQuery(); 
  //    rs = stmt.executeQuery(); 
      while(rs.next()){
      piid = rs.getInt(5);
      hitt=rs.getInt(6);
      //score=rs.getInt(4);
      }
       stmt=con.prepareStatement("select * from solution where id ='" + piid + "' ");  
      rs = stmt.executeQuery(); 
      while(rs.next()){
        image = rs.getString(1);
        }
   }
   catch(Exception e )
   {
    out.println("ERROR IN ABOfewffwerrewrrfakj");
   }
    %>
<script>
                       var hit=0,f=0;
                       var x =localStorage.getItem("ans");
                       
                        <%
                        email=(String)session.getAttribute("email");
                        //redirect user to login page if not logged in
                        if(email==null){
                        response.sendRedirect("login.jsp");
                        }
                        stmt=con.prepareStatement("select * from login where email ='" + email + "' ");  
                        rs=stmt.executeQuery();
                        //rs = stmt.executeQuery("select * from login where email ='" + email + "' "); 
                            while(rs.next()){
                            piid = rs.getInt(5);}
                        stmt=con.prepareStatement("select * from solution where id ='" + piid + "' ");  
                        rs=stmt.executeQuery();
                        
                           // rs = stmt.executeQuery("select * from solution where id ='" + piid + "' "); 
                        while(rs.next()){
                             ap=rs.getString(3);        
                                }
                        String sql5="update login set total_hit = total_hit + 1  where email =  '" +email + "'" ;
                        stmt=con.prepareStatement(sql5);
                        int count5=stmt.executeUpdate();
           
                        %>
                            
                        if(x==="<%=ap%>")
                        {   f=0;
                            localStorage.setItem("flag",f);
                            
                            window.location.replace("Update_Process.jsp"); 
                        }
                        else
                        {    //  alert("WRONG ANSWER ");
                            f=1;
                            localStorage.setItem("flag",f);
                               window.location.replace("hit_Update.jsp");
                            }
</script>