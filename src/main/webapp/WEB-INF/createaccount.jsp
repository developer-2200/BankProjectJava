<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="Createaccount" method="post" onsubmit="return submitt()">
		<table align="center" border="0">
			<tr>
				<td>Name</td>
				<td><input type="text" name=name id="name" maxlength="30">
				</td>
			</tr>
			<tr>
				<td>Gender</td>
				<td><input type="radio" name="gender" id="malegender" value="M" checked>M 
					<input type="radio" name="gender" id="femalegender" value="F">F 
					<input type="radio" name="gender" id="transgender" value="T">T
				</td>
			</tr>
			<tr>
				<td>Mobile No</td>
				<td><input type="text" name="mobileno" id="mobileno" maxlength="10">
				</td>
			</tr>
			<tr>
				<td>Email ID</td>
				<td><input type="text" name="emailid" id="emailid" maxlength="75">
				</td>
			</tr>
			<tr>
				<td>Address</td>
				<td><textarea name="address" id="address" cols="25" rows="3"></textarea>
				</td>
			</tr>
			<tr>
				<td>DOB</td>
				<td><input type="date" name="dob" id="dob"></td>
			</tr>
			<tr>
				<td>Adhar No</td>
				<td><input type="text" name="adharno" id="adharno" maxlength="20">
				</td>
			</tr>
			<tr>
				<td>PAN No</td>
				<td><input type="text" name="panno" id="panno" maxlength="20">
				</td>
			</tr>
			<tr>
				<td>branch</td>
				<td><select name="branch" id="branch">
						<option value="GEU">Geu</option>
						<option value="SGRRU" selected>SGRRU</option>
						<option value="BFIT">BFIT</option>
						<option value="UTU">UTU</option>
				</select>
			</tr>
			<tr>
				<td>Facility</td>
				<td><input type="checkbox" name="facility_internet_banking" id="facility_internet_banking" value="InternetBanking">InternetBanking
					<input type="checkbox" name="facility_sms" id="facility_sms" value="SMS">SMS
					<input type="checkbox" name="facility_locker" id="facility_locker"	value="Locker">Locker
				   <input type="checkbox" name="facility_debitcard" id="Facility_debitcard" value="DebitCard">Debit	Card
			</tr>
			<tr>
				<td><input type="submit"></td>
			</tr>


		</table>
	</form>


</body>
</html>