<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Member List</h1>



	<table border="2px">
		<tr>
			<th>Accno</th>
			<th>Name</th>
			<th>Gender</th>
			<th>Phoneno</th>
			<th>Emailid</th>
			<th>Address</th>
			<th>DOB</th>
			<th>Adhaarno</th>
			<th>Panno</th>
			<th>Branch</th>
			<th>Facility</th>
			<th>Date</th>
			<th>Time</th>
			<th>Balance</th>
		</tr>
		<%
  int accno = 0;
  Connection con =null;
  Statement st=null;
  ResultSet rt =null;


  try{
     	Class.forName("com.mysql.jdbc.Driver");
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
      st = con.createStatement();
    
     int found=0;
     StringBuffer query= new StringBuffer();
     query.append("select accno, name,gender, mobileno,emailid,address,dob,");
     query.append("adharno,panno,branch,facility,date,time,balance from account");


      rt = st.executeQuery(query.toString());
      while ( rt.next() )
      { 
%>
		<tr>
			<td nowrap><%=rt.getInt("accno")%></td>
			<td nowrap><%=rt.getString("name")%></td>
			<td nowrap><%=rt.getString("gender")%></td>
			<td nowrap><%=rt.getString("mobileno")%></td>
			<td nowrap><%=rt.getString("emailid")%></td>
			<td nowrap><%=rt.getString("address")%></td>
			<td nowrap><%=rt.getString("dob")%></td>
			<td nowrap><%=rt.getString("adharno")%></td>
			<td nowrap><%=rt.getString("panno")%></td>
			<td nowrap><%=rt.getString("branch")%></td>
			<td nowrap><%=rt.getString("facility")%></td>
			<td nowrap><%=rt.getString("date")%></td>
			<td nowrap><%=rt.getString("time")%></td>
			<td nowrap><%=rt.getString("balance")%></td>
		</tr>

		<%
      }//while
      rt.close();
      st.close();
      con.close();
     }//try
    catch(Exception e)
    {
        out.write(e.toString());
    }
%>
	</table>


</body>
</html>