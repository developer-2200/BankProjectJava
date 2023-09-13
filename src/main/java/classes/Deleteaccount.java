package classes;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Deleteaccount extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		
		try {
			System.out.println("Withdraw get function called at server");
			

			StringBuffer datatosend = new StringBuffer(1024);
			datatosend.append("<?xml version=\"1.0\"?>");
			datatosend.append("<data>");
			
			String accountno_to_search = request.getParameter("accountno_to_search");
			
			System.out.println("AccountNo= " + accountno_to_search);	   
						
			Connection con = null;
			Statement st = null;
			ResultSet rt = null;
           
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
			st = con.createStatement();
			rt = st.executeQuery("select name,balance from account where accno=" + accountno_to_search);
			while (rt.next()) {
				datatosend.append("<member>");
				datatosend.append("<name>").append(rt.getString("name")).append("</name>");
				datatosend.append("<balance>").append(rt.getInt("balance")).append("</balance>");
				datatosend.append("<accno>").append(accountno_to_search).append("</accno>");
				datatosend.append("</member>");

			}
			rt.close();
			st.close();
			con.close();
			datatosend.append("</data>");
			response.setContentType("text/xml");
			response.setHeader("cache-Control", "no-catche");
			response.setHeader("Pragma", "no-catche");
			response.setDateHeader("Expires", 0);

			response.getWriter().write(datatosend.toString());
			response.getWriter().flush();
			System.out.println(datatosend.toString());
		} catch (Exception e) {
			System.out.println(e);
		}		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
	  {
	    try{
	      String html_accno=request.getParameter("accno");
	      	      
	      Connection con=null;
	      Statement st=null;
	      ResultSet rt=null;

	      Class.forName("com.mysql.jdbc.Driver");
	      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
	      st=con.createStatement();
	      StringBuffer query=new StringBuffer();
	      query.append("delete from account where accno=").append(html_accno);
	      

	      System.out.println(query.toString());
	      st.executeUpdate(query.toString());
	      
	        	        
	        response.setContentType("text/html"); 
	        response.setHeader("Cache-Control", "no-cache");
	        response.setHeader("Pragma", "no-cache");
	        response.setDateHeader ("Expires", 0);
	        
	        response.getWriter().write(" Deleted Successfully ");
	        response.getWriter().flush();
	     }   
	     catch (Exception e)
	     {
	     System.out.println(e);
	    }
	
}	

	 
 }
 

