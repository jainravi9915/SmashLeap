package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Timestamp;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=ISO-8859-1");
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<div class=\"login\"  >\n");
      out.write("    <link rel=\"stylesheet\" href=\"stylelogin.css\">\n");
      out.write("    ");
 
    
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
       
        
      out.write("\n");
      out.write("    <h1>Login</h1>\n");
      out.write("    <form method=\"post\" action=\"loginRequestHandler.jsp\" >\n");
      out.write("        <input type=\"text\" name=\"email\" placeholder=\"Username\" required=\"required\" />\n");
      out.write("           \n");
      out.write("        <input type=\"password\" name=\"password\" placeholder=\"Password\" required=\"required\" />\n");
      out.write("        <button type=\"submit\" value=\"Login\"  class=\"btn btn-primary btn-block btn-large\">Let me in.</button>\n");
      out.write("    </form>\n");
      out.write("</div>");
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
