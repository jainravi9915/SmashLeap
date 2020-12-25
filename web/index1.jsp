<%-- 
    Document   : index1
    Created on : 2 Jan, 2020, 10:16:20 AM
    Author     : Ramesh ji jain
--%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String email=(String)session.getAttribute("email");
   if(email==null){
       response.sendRedirect("login.jsp");
   }Connection con = null;
    PreparedStatement stmt,stmt1 = null,stmt2=null;
    ResultSet rs ,rs1 = null;
    String hint1=null,hint2=null,hint3=null,image =null,ap=null;;
    int hitt=0,nhitt=0,score=0,piid=0;;
       try{ 
      Class.forName("com.mysql.jdbc.Driver");
      con =DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","root");
     
       int x=1;
                Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                String set="update login set first_login = first_login+1  where email =  '" +email + "'" ;
                String time1="update login set cur_img_time = '"+timestamp+"'  where email =  '" +email + "'" ;
                stmt=con.prepareStatement("select * from login where email ='" + email + "' ");  
            //    stmt=con.prepareStatement("select * from login where email ='" + email + "' ");  
                  stmt2=con.prepareStatement("select * from login order by score ");  
                  rs=stmt2.executeQuery(); 
                 int flag=0;
                    rs=stmt.executeQuery();            
                  while(rs.next()){
                    flag=rs.getInt(11);
                    }
                    if(flag==0){
                            stmt=con.prepareStatement(set);
                            int count4=stmt.executeUpdate();
                            stmt=con.prepareStatement(time1);
                            int count5=stmt.executeUpdate();
                    }
           
     stmt=con.prepareStatement("select * from login where email ='" + email + "' ");  
     rs=stmt.executeQuery(); 
      //stmt = con.createStatement();
     //rs = stmt.executeQuery("select * from login where email ='" + email + "' "); 
      while(rs.next()){
      piid = rs.getInt(5);
      hitt=rs.getInt(6);
      score=rs.getInt(4);
      }
      stmt=con.prepareStatement("select * from solution where id ='" + piid + "' ");  
      rs=stmt.executeQuery(); 
      //stmt = con.createStatement();
      //rs = stmt.executeQuery("select * from solution where id ='" + piid + "' "); 
      while(rs.next()){
        image = rs.getString(1);
        hint1=rs.getString(4);
        hint2=rs.getString(5);
        hint3=rs.getString(6);
       // ap=rs.getString(3);        
        }
   }
   catch(Exception e )
   {
    out.println("ERROR IN ABOfakj");
   }       
       
       
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>GAME_PAGE</title>
	<link rel="stylesheet" href="style.css">
	<link href="https://fonts.googleapis.com/css?family=Indie+Flower&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://fonts.google.com/?width=5&slant=4&selectioon.family=Rouge+Script" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<style>
		
	</style>
 
</head>
<body style="background-color:powderblue;"  onload="myfunction(hit)" >
  <div class="main-div ">
        
        <div id="title"><span >SCORE=<%=score%></span>
            <br>
            </div>
          <div class="container">
       	  <div class="row"> 
       	  <div class="col-md-1">
       	  <div id="hint">
               <h1 id="hint_show" style="height:auto;"> </h1><br>
               <h1 id="hb1" style="height:auto;"> </h1>
               <br>
               <h1 id="hb2" style="height:auto;"> </h1>
               <br>
               <h1 id="hb3" style="height:auto;"> </h1>
             </div>
       	<!-- <br><br><br> -->
       	  </div>
       	  <div class="col-lg-11" >
       	  <div id="img" >
       				<img id="img1" src="" alt="picture" border="2">
                                <script>
                                    document.getElementById("img1").src="<%=image%>.png";
                                </script>
                        </div>
                    </div>
                </div>
       	  </div>
       	        
<form fontsize="80" style="margin-top:10px"  method="post">
		<p> ANSWER : </p>
                <input type="text" placeholder="Type Your Answer" id="answer"  autocomplete="off" onkeyup="this.value = this.value.toLowerCase();">
                       <p ><a id="wrong" ></a></p>
		<br><br>
                <button class="sub-btn"  type="button"  id="button" onclick="sendInfo()" > SUBMIT</button>
                <button class="log-btn"  type="button"> <a href="logout.jsp" style="text-decoration:none;color:black;">Log out</button>
                <ul><br><br><br>
                <li><a href="https://www.facebook.com/groups/2021885708031024/" target="_blank"><i class="fa fa-facebook-official" aria-hidden="true"></i></a></li>
		<li><a href="https://www.nitt.edu/home/academics/departments/ca/associations/acm/"target="_blank"><i class="fa fa-twitter-square" aria-hidden="true"></i></a></li>
		<li><a href="https://mail.google.com/mail/u/0/#inbox" target="_blank"><i class="fa fa-envelope" aria-hidden="true"></i></a></li>
		<li><a href="https://www.instagram.com/" target="_blank"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
		</ul>
		</form>
	</div>
		<br>
	 </div>
         <script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js'></script>
                        <script type='text/javascript'>
                        /*     var hit=0,f;
                            var key=0;
                             document.cookie="cc=0";
                                //var key=document.cookie;
                              $('#button').click( function(){
                              //clicks = document.cookie;
                              key=document.cookie;
                               key=key+1;
                               
                                 alert(key);
                               if(key.length>3)
                               {$(this).attr('disabled', 'disabled');
                                alert("DISABLED FOR 10 SECOND  submit ");
                               document.cookie="cc=";
                                 setTimeout(enableButton, 10000);
                                  alert("DIsubmit ");
                               
                                  return true;}
                               });
                              //make sure default click event happens
                                  var enableButton = function(){
                                      alert("Enabled");
                                      $('#button').removeAttr('disabled');
                                       alert("Enabled");
                                     }
*/                   
                    <% nhitt=hitt;  %>
                        var hit=0,f;
                        var key=document.cookie;
                   function sendInfo(){
                       var x= document.getElementById("answer").value;
                       if(x==null || x==" "){
                           alert( " NULL NOT ACCEPTED " );
                           return false ;
                       }
                       localStorage.setItem("ans",x);
                       window.location.replace("Process.jsp");
                    }
                      function myfunction(hit)
                    {    hit=<%=nhitt%>;
                         f=localStorage.getItem("flag");
                       // if(f==1)
                           // document.getElementById("wrong").innerHTML="WRONG ANSWER";
                          if(hit>=3)
                           {document.getElementById("hint_show").innerHTML="!! HINTS !!";
                            document.getElementById("hb1").innerHTML="<%= hint1%>";}
                        if(hit>=5)
                        { document.getElementById("hb2").innerHTML="<%= hint2%>";}  
                        if(hit>=7)
                         {document.getElementById("hb3").innerHTML="<%= hint3%>";}
                  }
     </script>
</body>
</html>
