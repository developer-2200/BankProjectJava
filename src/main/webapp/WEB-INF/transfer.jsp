<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
var xmlhttp = null;
function search_account(){
	try {
		//alert("serch accno is called");
		var accno = document.getElementById("accountno_to_search").value;
		if (accno.length == 0)
			return false;

		var url = "withdrawamount?accountno_to_search=" + accno;
		
		xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = handleServerResponse;
		xmlhttp.open("GET", url, true);
		xmlhttp.send();
		//alert(url);

	} catch (e){
		alert(e);
		return false;
	}
}
function account_search(){
	try {
		//alert("serch accno is called");
		var accno = document.getElementById("accountno_to_search").value;
		if (accno.length == 0)
			return false;

		var url = "depositamount?accountno_to_search=" + accno;
		
		xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = handleserverresponse;
		xmlhttp.open("GET", url, true);
		xmlhttp.send();
		//alert(url);

	} catch (e){
		alert(e);
		return false;
	}
}
function handleServerResponse() {
	try {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				//alert(xmlhttp.responseText);
				document.getElementById("account_name_1").value = "";
				document.getElementById("balance_1").value = "";
				document.getElementById("accno_1").value = "";

				var xx, j = 0;
				var temp;

				var x = xmlhttp.responseXML.documentElement
						.getElementsByTagName("member");
				//alert(x);
				//alert(x.length);
				for (var i = 0; i < x.length; i++) {
					xx = x[i].getElementsByTagName("name");
					alert(xx[0].firstChild.nodeValue);
					var name = xx[0].firstChild.nodeValue;

					xx = x[i].getElementsByTagName("balance");
					var balance = xx[0].firstChild.nodeValue;

					xx = x[i].getElementsByTagName("accno");
					var accno = xx[0].firstChild.nodeValue;

					document.getElementById("account_name_1").value = name;
					document.getElementById("balance_1").value = balance;
					document.getElementById("accno_1").value = accno;

				}
				xmlhttp = null;

			}
		}
	} catch (e) {
		console.log(e);
		alert(e);
	}
}
function handleserverresponse() {
	try {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				//alert(xmlhttp.responseText);
				document.getElementById("account_name_2").value = "";
				document.getElementById("balance_2").value = "";
				document.getElementById("accno_2").value = "";

				var xx, j = 0;
				var temp;

				var x = xmlhttp.responseXML.documentElement
						.getElementsByTagName("member");
				//alert(x);
				//alert(x.length);
				for (var i = 0; i < x.length; i++) {
					xx = x[i].getElementsByTagName("name");
					alert(xx[0].firstChild.nodeValue);
					var name = xx[0].firstChild.nodeValue;

					xx = x[i].getElementsByTagName("balance");
					var balance = xx[0].firstChild.nodeValue;

					xx = x[i].getElementsByTagName("accno");
					var accno = xx[0].firstChild.nodeValue;

					document.getElementById("account_name_2").value = name;
					document.getElementById("balance_2").value = balance;
					document.getElementById("accno_2").value = accno;

				}
				xmlhttp = null;

			}
		}
	} catch (e) {
		console.log(e);
		alert(e);
	}
}


	
</script>

</head>
<body>
<h1>Transfer </h1>
<table align="center" >

		<tr>
			<td>Enter Source Account No:</td>
			<td><input type="text" onKeyUp="search_account()" name="accountno_to_search" id="accountno_to_search"></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>Enter Deposit Account No:</td>
			<td><input type="text" onKeyUp="account_search()" name="accountno_to_search" id="accountno_to_search"></td>
			
		</tr>
	
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  <tr></tr>
	  
		<tr>
			<td>Account Name :</td>
			<td><input type="text" value="" readonly="true" name="account_name_1" id="account_name_1"></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>Account Name :</td>
			<td><input type="text" value="" readonly="true" name="account_name_2" id="account_name_2"></td>
		</tr>

		<tr>
			<td>Balance :</td>

			<td><input type="text" value="" readonly="true" name="balance_1"id="balance_1">
			</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>

			<td>Balance :</td>
			<td><input type="text" value="" readonly="true" name="balance_2"id="balance_2">
		
		</tr>

		<tr>
			<td>Account No:</td>
			<td><input type="text" value="" readonly="true" name="accno_1" id="accno_1"></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>Account No:</td>
			<td><input type="text" value="" readonly="true" name="accno_2" id="accno_2"></td>
		
		</tr>
	</table>
	<br>
	<br>



</body>
</html>