package classes; 

import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;



import javax.servlet.http.HttpServlet;

@SuppressWarnings("serial")
public class index extends HttpServlet
{
 public void doPost(HttpServletRequest request, HttpServletResponse response ) throws ServletException,IOException
 {
  String html_loginid=request.getParameter("loginid");
  String html_loginpwd=request.getParameter("loginpwd"); 
  
  Connection con =null;
  Statement st =null;
  ResultSet rt =null;
  
  try{
      Class.forName("com.mysql.jdbc.Driver");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
      st = con.createStatement();
      int found =0;
      rt = st.executeQuery("select loginid,loginpwd from login");
      while (rt.next())
      {
        String db_loginid = rt.getString("loginid");
        String db_loginpwd = rt.getString("loginpwd");
         
         if(html_loginid.equals(db_loginid))
            {
             if(html_loginpwd.equals(db_loginpwd))
                {
                  found=1;
                  break;
                }
             }
     }
     rt.close();
     st.close();       
     con.close(); 



     if(found==1)
     {
      RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/menu.jsp");
      rd.forward(request,response);
     }
     else
     {
      RequestDispatcher rd =request.getRequestDispatcher("/WEB-INF/invalidlogin.jsp");
      rd.forward(request,response);
     }
  
  }
  catch(Exception e)
   {
    System.out.println(e);
   }
  
  
  

    
  /**PrintWriter out =response.getWriter();
  out.write("<html><body> Response From Server<br>");
  out.write("server response :<br>");
  out.write("<br> login ID :"+html_loginid);  
  out.write("<br>loginpwd: "+html_loginpwd);
  out.write("</body></html>");**/
  
 }
 
}

