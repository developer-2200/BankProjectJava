<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Insert title here</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h1>Menubar</h1>
<br><br>
<form action="Menu" method="POST" onsubmit="return submitt()">
<table align="center" border="0">
<tr><td>
<input type="submit" name="createaccount"  value="createaccount"> </td>
</tr>
<tr><td>
<tr><td>
<input type="submit" name="withdrawamount"value="Withdrawamount"> </td>
</tr>
<tr><td>
<input type="submit" name="memberlist"  value="Member List">
</td></tr>
<tr><td>
<input type="submit" name="deleteaccount" value="Delete Account">
</td></tr>
<tr><td>
<input type="submit" name="signin" value="Sign In">
</td></tr>
<tr><td>
<input type="submit" name="depositamount" value="Deposit Amount">
</td></tr>
<tr><td>
<input type="submit" name="uploadphoto" value="Upload  Photo">
</td></tr>
<tr><td>
<input type="submit" name="ministatement" value="Ministatement">
</td></tr>
<tr><td>
<input type="submit" name="transfer" value="Transfer Amount">
</td></tr>
    


</table>
</form>


</body>
</html>