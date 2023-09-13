<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


</head>
<body>
<form action="signin" method="post" onsubmit="return submitt()">
		<table align="center" border="0">
			<tr>
				<td>ID</td>
				<td><input type="text" name=name id="name" maxlength="30">
				</td>
			</tr>
			
			<tr>
				<td>Create Password</td>
				<td><input type="text" name="password" id="password" maxlength="10">
				</td>
			</tr>
             						
	
			<tr>
				<td><input type="submit"></td>
			</tr>


		</table>
	</form>

</body>
</html>