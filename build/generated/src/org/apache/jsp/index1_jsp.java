package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Timestamp;
import java.sql.PreparedStatement;
import javax.swing.JOptionPane;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;

public final class index1_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
String email=(String)session.getAttribute("email");
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
       
       

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("\t<meta charset=\"utf-8\" meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>\n");
      out.write("        <title>GAME_PAGE</title>\n");
      out.write("\t<link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("\t<link href=\"https://fonts.googleapis.com/css?family=Indie+Flower&display=swap\" rel=\"stylesheet\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("\t<link href=\"https://fonts.google.com/?width=5&slant=4&selectioon.family=Rouge+Script\" rel=\"stylesheet\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\">\n");
      out.write("\t<style>\n");
      out.write("\t\t\n");
      out.write("\t</style>\n");
      out.write(" \n");
      out.write("</head>\n");
      out.write("<body style=\"background-color:powderblue;\"  onload=\"myfunction(hit)\" >\n");
      out.write("  <div class=\"main-div \">\n");
      out.write("        \n");
      out.write("        <div id=\"title\"><span >SCORE=");
      out.print(score);
      out.write("</span>\n");
      out.write("            <br>\n");
      out.write("            </div>\n");
      out.write("          <div class=\"container\">\n");
      out.write("       \t  <div class=\"row\"> \n");
      out.write("       \t  <div class=\"col-md-1\">\n");
      out.write("       \t  <div id=\"hint\">\n");
      out.write("               <h1 id=\"hint_show\" style=\"height:auto;\"> </h1><br>\n");
      out.write("               <h1 id=\"hb1\" style=\"height:auto;\"> </h1>\n");
      out.write("               <br>\n");
      out.write("               <h1 id=\"hb2\" style=\"height:auto;\"> </h1>\n");
      out.write("               <br>\n");
      out.write("               <h1 id=\"hb3\" style=\"height:auto;\"> </h1>\n");
      out.write("             </div>\n");
      out.write("       \t<!-- <br><br><br> -->\n");
      out.write("       \t  </div>\n");
      out.write("       \t  <div class=\"col-lg-11\" >\n");
      out.write("       \t  <div id=\"img\" >\n");
      out.write("       \t\t\t\t<img id=\"img1\" src=\"\" alt=\"picture\" border=\"2\">\n");
      out.write("                                <script>\n");
      out.write("                                    document.getElementById(\"img1\").src=\"");
      out.print(image);
      out.write(".png\";\n");
      out.write("                                </script>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("       \t  </div>\n");
      out.write("       \t        \n");
      out.write("<form fontsize=\"80\" style=\"margin-top:10px\"  method=\"post\">\n");
      out.write("\t\t<p> ANSWER : </p>\n");
      out.write("                <input type=\"text\" placeholder=\"Type Your Answer\" id=\"answer\"  autocomplete=\"off\" onkeyup=\"this.value = this.value.toLowerCase();\">\n");
      out.write("                       <p ><a id=\"wrong\" ></a></p>\n");
      out.write("\t\t<br><br>\n");
      out.write("                <button class=\"sub-btn\"  type=\"button\"  id=\"button\" onclick=\"sendInfo()\" > SUBMIT</button>\n");
      out.write("                <button class=\"log-btn\"  type=\"button\"> <a href=\"logout.jsp\" style=\"text-decoration:none;color:black;\">Log out</button>\n");
      out.write("                <ul><br><br><br>\n");
      out.write("                <li><a href=\"https://www.facebook.com/groups/2021885708031024/\" target=\"_blank\"><i class=\"fa fa-facebook-official\" aria-hidden=\"true\"></i></a></li>\n");
      out.write("\t\t<li><a href=\"https://www.nitt.edu/home/academics/departments/ca/associations/acm/\"target=\"_blank\"><i class=\"fa fa-twitter-square\" aria-hidden=\"true\"></i></a></li>\n");
      out.write("\t\t<li><a href=\"https://mail.google.com/mail/u/0/#inbox\" target=\"_blank\"><i class=\"fa fa-envelope\" aria-hidden=\"true\"></i></a></li>\n");
      out.write("\t\t<li><a href=\"https://www.instagram.com/\" target=\"_blank\"><i class=\"fa fa-instagram\" aria-hidden=\"true\"></i></a></li>\n");
      out.write("\t\t</ul>\n");
      out.write("\t\t</form>\n");
      out.write("\t</div>\n");
      out.write("\t\t<br>\n");
      out.write("\t </div>\n");
      out.write("         \n");
      out.write("         <script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js'></script>\n");
      out.write("                        <script type='text/javascript'>\n");
      out.write("                        /*     var hit=0,f;\n");
      out.write("                            var key=0;\n");
      out.write("                             document.cookie=\"cc=0\";\n");
      out.write("                                //var key=document.cookie;\n");
      out.write("                              $('#button').click( function(){\n");
      out.write("                              //clicks = document.cookie;\n");
      out.write("                              key=document.cookie;\n");
      out.write("                               key=key+1;\n");
      out.write("                               \n");
      out.write("                                 alert(key);\n");
      out.write("                               if(key.length>3)\n");
      out.write("                               {$(this).attr('disabled', 'disabled');\n");
      out.write("                                alert(\"DISABLED FOR 10 SECOND  submit \");\n");
      out.write("                               document.cookie=\"cc=\";\n");
      out.write("                                 setTimeout(enableButton, 10000);\n");
      out.write("                                  alert(\"DIsubmit \");\n");
      out.write("                               \n");
      out.write("                                  return true;}\n");
      out.write("                               });\n");
      out.write("                              //make sure default click event happens\n");
      out.write("                                  var enableButton = function(){\n");
      out.write("                                      alert(\"Enabled\");\n");
      out.write("                                      $('#button').removeAttr('disabled');\n");
      out.write("                                       alert(\"Enabled\");\n");
      out.write("                                     }\n");
      out.write("*/\n");
      out.write("                ");

                    nhitt=hitt; 
                
                    
      out.write("\n");
      out.write("                        var hit=0,f;\n");
      out.write("                        var key=document.cookie;\n");
      out.write("                   function sendInfo(){\n");
      out.write("                       \n");
      out.write("                       var x= document.getElementById(\"answer\").value;\n");
      out.write("                       if(x==null || x==\" \"){\n");
      out.write("                           alert(\"NULL NOT ACCEPTED \");\n");
      out.write("                           return false ;\n");
      out.write("                       }\n");
      out.write("                       \n");
      out.write("                       \n");
      out.write("                       \n");
      out.write("                       \n");
      out.write("                       localStorage.setItem(\"ans\",x);\n");
      out.write("                       window.location.replace(\"Process.jsp\");\n");
      out.write("\n");
      out.write("                   }\n");
      out.write("                      function myfunction(hit)\n");
      out.write("                    {               hit=");
      out.print(nhitt);
      out.write(";\n");
      out.write("                        f=localStorage.getItem(\"flag\");\n");
      out.write("                       // if(f==1)\n");
      out.write("                           // document.getElementById(\"wrong\").innerHTML=\"WRONG ANSWER\";\n");
      out.write("                         if(hit>=3)\n");
      out.write("                        {\n");
      out.write("                             document.getElementById(\"hint_show\").innerHTML=\"!! HINTS !!\";\n");
      out.write("                            document.getElementById(\"hb1\").innerHTML=\"");
      out.print( hint1);
      out.write("\";\n");
      out.write("                        }\n");
      out.write("                        if(hit>=5)\n");
      out.write("                        {\n");
      out.write("                              document.getElementById(\"hb2\").innerHTML=\"");
      out.print( hint2);
      out.write("\";\n");
      out.write("                        }  \n");
      out.write("                        if(hit>=7)\n");
      out.write("                         {\n");
      out.write("                              document.getElementById(\"hb3\").innerHTML=\"");
      out.print( hint3);
      out.write("\";\n");
      out.write("                         }\n");
      out.write("                  }\n");
      out.write("     </script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
