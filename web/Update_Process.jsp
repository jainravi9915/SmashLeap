<%-- 
    Document   : Update_Process
    Created on : 11 Jan, 2020, 11:23:30 AM
    Author     : Ramesh ji jain
--%>
<%@page import="java.sql.Timestamp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/mydb";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
String email=(String)session.getAttribute("email");
//String email =request.getParameter("email");
if(email != null)
{
Connection con = null;
PreparedStatement stmt = null;
//PreparedStatement ps = null;
ResultSet rs=null;
int chit=0;
try{                
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
int x=0;
//String s="select * from login where email ='"+email+"'";
//stmt=con.createStatement();
Timestamp timestamp = new Timestamp(System.currentTimeMillis());
Timestamp t1=null;
long milli;
  stmt=con.prepareStatement("select * from login where email ='" + email + "' ");  
  rs = stmt.executeQuery(); 
int cur,pid=0; 
//rs = stmt.executeQuery("select * from login where email ='" + email + "' "); 
while(rs.next())
    {
    // t1=rs.getTimestamp(9);
     pid=rs.getInt(5);
     //pid=rs.get
     //chit=rs.getInt(6);
    }
stmt=con.prepareStatement("select * from solution where id ='" + pid + "' ");  
rs = stmt.executeQuery(); 
while(rs.next())
{
   t1=rs.getTimestamp(7);

}  
pid+=1;
stmt=con.prepareStatement("select * from solution where id ='" + pid + "' ");  
rs = stmt.executeQuery(); 
while(rs.next()){
    int f=rs.getInt(8);
    if(f==0){
        String set_f="update solution set flag = flag+1 where id =  '" +pid+ "'" ;
        String f_time="update solution set first_time = '"+timestamp+"'  where id =  '" +pid+ "'" ;
        stmt=con.prepareStatement(set_f);
        int count1=stmt.executeUpdate();
        stmt=con.prepareStatement(f_time);
        int ti=stmt.executeUpdate();
      }
}
/*pid=pid-1;
stmt=con.prepareStatement("select * from solution where id ='" + pid + "' ");  
rs = stmt.executeQuery(); 
while(rs.next())
{
   t1=rs.getTimestamp(7);

} */ 
milli=timestamp.getTime()-t1.getTime();
long seconds = (long) milli/1000;
 if(seconds<=60)
     x=100;
 else if(seconds>60 && seconds<=120)
     x=50;
 else
     x=30;
String time="update login set last_submit = '"+timestamp+"'  where email =  '" +email + "'" ;
String time1="update login set cur_img_time = '"+timestamp+"'  where email =  '" +email + "'" ;
String sql="update login set iid = iid + 1  where email =  '" +email + "'" ;
String sql1="update login set piid = piid + 1  where email =  '" +email + "'" ;
String sql2="update login set curhint = 0  where email =  '" +email + "'" ;
stmt=con.prepareStatement(sql1);
int count1=stmt.executeUpdate();
stmt=con.prepareStatement(time1);
int ti=stmt.executeUpdate();
stmt=con.prepareStatement(sql2);
int count2=stmt.executeUpdate();
   stmt=con.prepareStatement("select * from login where email ='" + email + "' ");  
   rs = stmt.executeQuery();
   //int xt=0;
  // while(rs.next())
    //{
      //  chit=rs.getInt(6);
    //}
 /*  if(chit==0)
    xt=x+20;
   else if(chit<=5)
       xt=x+10;
      else if(chit<=10)
       xt=x+5;*/
stmt=con.prepareStatement(time);
int count40=stmt.executeUpdate();
String sql3="update login set score = score + '"+x+"'  where email =  '" +email + "'" ;
stmt=con.prepareStatement(sql3);
int count3=stmt.executeUpdate();
//int count3=stmt.executeUpdate(sql3);
response.sendRedirect("index1.jsp?"+email);

  }
catch(SQLException sql)
    {
    request.setAttribute("error", sql);
    out.println("dsfsg"+sql);
    }
}else
{
    out.println("NO EMAIL"+email);
}  
%>