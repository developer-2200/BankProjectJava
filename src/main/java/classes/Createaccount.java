package classes;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

@SuppressWarnings("serial")
public class Createaccount extends HttpServlet {

	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String mobileno = request.getParameter("mobileno");
		String emailid = request.getParameter("emailid");
		String address = request.getParameter("address");
		String dob = request.getParameter("dob");
		String adharno = request.getParameter("adharno");
		String panno = request.getParameter("panno");
		String branch = request.getParameter("branch");

		String facility_internet_banking = request.getParameter("name");
		String facility_sms = request.getParameter("facility_sms");
		String facility_locker = request.getParameter("facility_locker");
		String facility_debitcard = request.getParameter("facility_debitcard");
		String facility = "";
		if (facility_internet_banking != null)
			facility = facility + facility_internet_banking;
		if (facility_sms != null)
			facility = facility + facility_sms;
		if (facility_locker != null)
			facility = facility + facility_locker;
		if (facility_debitcard != null)
			facility = facility + facility_debitcard;
		
		  int accno = 0;
		  Connection con =null;
		  Statement st=null;
		  ResultSet rt =null;
		  
		  try{
			  Class.forName("com.mysql.jdbc.Driver");
		      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
		      st = con.createStatement();  
		      rt = st.executeQuery("select max(accno) as accno from account");
		      // max is to  increase accno automatically accno++
		      while ( rt.next() )
		      {
		         accno =rt.getInt("accno");
		      }
		      rt.close();
		      accno =accno +1;
		      
		      StringBuffer query = new StringBuffer(1024);
		       query.append("insert into account (accno,name,gender,mobileno,emailid,address");
		       query.append(",dob,adharno,panno,branch,facility,date,time) values (");
		       query.append(accno).append(",'").append(name).append("','").append(gender);  
		       query.append("','").append(mobileno).append("','").append(emailid).append("','");
		       query.append(address).append("','").append(dob).append("','").append(adharno);
		       query.append("','").append(panno).append("','").append(branch).append("','");  
		       query.append(facility).append("',curdate(),curtime())");
		   
		            System.out.println(  query.toString() );
		     
		             st.executeUpdate(  query.toString() );
		             
		             st.close();
		             con.close();
		        PrintWriter out = response.getWriter();
		        out.write("<html> <body>");
		        out.write("Server Response: <br>");
		        out.write("Account Sucessfully created,Accoint no is "+accno);
		        out.write(" </body> </html> "); 
		 
		      
		  }catch(Exception e)
		  {
			  System.out.println(e);
		  }
				  
				  
	}
}












