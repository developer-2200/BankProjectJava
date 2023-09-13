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

			var url = "deleteaccount?accountno_to_search=" + accno;
			
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
	function handleServerResponse() {
		try {
			if (xmlhttp.readyState == 4) {
				if (xmlhttp.status == 200) {
					//alert(xmlhttp.responseText);
					document.getElementById("account_name").value = "";
					document.getElementById("balance").value = "";
					document.getElementById("accno").value = "";

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

						document.getElementById("account_name").value = name;
						document.getElementById("balance").value = balance;
						document.getElementById("accno").value = accno;

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
<h1>Delete Account</h1>

	<table align="center" border="1">

		<tr>
			<td>Enter Account No:</td>
			<td><input type="text" onKeyUp="search_account()" name="accountno_to_search" id="accountno_to_search"></td>
		</tr>
	</table>

	<br>
	<br>
	<br>

	<table align="center">

		<tr>
			<td>Account Name :</td>
			<td><input type="text" value="" readonly="true" name="account_name" id="account_name"></td>
		</tr>

		<tr>
			<td>Balance</td>

			<td>: <input type="text" value="" readonly="true" name="balance"id="balance">
			</td>
		</tr>

		<tr>
			<td>Account No.</td>

			<td><input type="text" value="" readonly="true" name="accno" id="accno"></td>
		</tr>
		
		<tr>

			<td align="left" valign="top"><input type="button"
				value="Proceed" onClick="delete_account()"></td>
	   </tr>
	</table>
	
	
	<script type="text/javascript">
		function delete_account() {
			try {

				var accno = document.getElementById("accno").value;

				if (Number(accno) == 0) {

					alert("Please Search Account No.");
					document.getElementById("accountno_to_search").focus();
					return false;

				}

				

				var con = confirm("Are You Sure Want To Continue");

				if (con == false)
					return false;

				var url = "deleteaccount?accno=" + accno;
						
                 alert(url);
				xmlhttp = new XMLHttpRequest();

				xmlhttp.onreadystatechange = handleServerResponse_deposit;

				xmlhttp.open("POST", url, true);
				xmlhttp.send();
			} catch (e) {
				alert(e);
				return false;
			}
		}

		function handleServerResponse_deposit() {

			try {

				if (xmlhttp.readyState == 4) {

					if (xmlhttp.status == 200) {

						alert(xmlhttp.responseText);

						document.getElementById("account_name").value = "";
						document.getElementById("balance").value = "";
						document.getElementById("accno").value = "";

							
						document.getElementById("accountno_to_search").value = "";

						xmlhttp = null;
					}
				}
			} catch (e) {

				alert(e);

			}
		}
	</script>
	
	

</body>
</html>