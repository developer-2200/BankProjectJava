package classes;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Menu extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException {
		if (request.getParameter("createaccount")!=null)
		   {
		      RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/createaccount.jsp");
		      rd.forward(request,response);
		      return;
		   }
		   if (request.getParameter("depositamount")!=null)
		   {
		      RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/depositamount.jsp");
		      rd.forward(request,response);
		      return;
		   }if (request.getParameter("deleteaccount")!=null)
		   {
			      RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/deleteaccount.jsp");
			      rd.forward(request,response);
			      return;
			   }
		   
		    if (request.getParameter("withdrawamount")!=null)
		   {
		      RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/withdrawamount.jsp");
		      rd.forward(request,response);
		      return;
		   }
		   if (request.getParameter("memberlist")!=null)
		   {
		      RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/memberlist.jsp");
		      rd.forward(request,response);
		      return;
		   }
		   if (request.getParameter("transfer")!=null)
		   {
		      RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/transfer.jsp");
		      rd.forward(request,response);
		      return;
		   }
		   if (request.getParameter("ministatement")!=null)
		   {
		      RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/ministatement.jsp");
		      rd.forward(request,response);
		      return;
		   }
		   if (request.getParameter("signin")!=null)
		   {
		      RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/signin.jsp");
		      rd.forward(request,response);
		      return;
		   }
		   

		
	}

	

}
