package classes;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Signin extends HttpServlet{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		String loginid = request.getParameter("name");
		
		String password = request.getParameter("password");
		

		
		
		  
		  Connection con =null;
		  Statement st=null;
		  ResultSet rt =null;
		  
		  try{
			  Class.forName("com.mysql.jdbc.Driver");
		      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
		      st = con.createStatement();  
		      
		      
		      StringBuffer query = new StringBuffer(1024);
		       query.append("insert into login (loginid,loginpwd) values('");		       
		       query.append(loginid).append("','").append(password).append("')");  
		      
		   
		            System.out.println(  query.toString() );
		     
		             st.executeUpdate(  query.toString() );
		             

		        PrintWriter out = response.getWriter();
		        out.write("<html> <body>");
		        out.write("Server Response: <br>");
		        out.write("Account Sucessfully created,Accoint no is "+loginid);
		        out.write(" </body> </html> "); 
		 
		      
		  }catch(Exception e)
		  {
			  System.out.println(e);
		  }
				  
				  
	}

}
