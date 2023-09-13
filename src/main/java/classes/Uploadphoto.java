package classes;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;

import org.apache.commons.fileupload.*; 
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;

@SuppressWarnings("serial")
public class Uploadphoto extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
	{
	   String accountno=null;
	
	  FileItemFactory factory = new DiskFileItemFactory();
	  ServletFileUpload upload = new ServletFileUpload(factory);
	  List items= null;
	  Iterator itr = null;
	  
	  try	
	  { 
	     	items = upload.parseRequest(request); 
		  itr = items.iterator();
	
	   while (itr.hasNext()){
		  FileItem item =(FileItem) itr.next(); 
	   }
	   if (items.isFormField()){
	       String name = items.getFieldName();
	       String value = items.getString();
	       if(name.equals("accountno")) 
	         {
		          accountno=value; /*this will get html student_id textbox value you can save it in database*/
	          }
       }else {
    	  /* image coming from html */
    	  String itemName = items.getName();
    	  //D:\Tomcat/webapps\bank\images
    	  String filename="D:\\Tomcat\\webapps\\bank\\images\\"+accountno+".jpg";
    	   System.out.println(filename);
    	  File savedFile = new File(filename);
    	  items.write(savedFile);
    	}
    	/* while */
	response.getWriter().print("Successfully Saved");
	}catch(	Exception e)
	{
		System.out.println(e);
	}
}
}


