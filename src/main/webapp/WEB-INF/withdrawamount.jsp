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
Withdraw Amount

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
	</table>
	<br>
	<br>

	<table border="0" align="center" cellpadding="4" cellspacing="4">
		<tr>

			<td align="left" valign="top">Enter Withdraw Amount</td>

			<td align="left" valign="top">: <input type="text" value=""
				name="new_deposit_amount" id="withdraw_amount" maxlength="5">

			</td>
	 </tr>
		
		</tr>

		<tr>

			<td align="left" valign="top"><input type="button"
				value="Proceed" onClick="withdraw_amount()"></td>
	   </tr>
	</table>
	
	<script type="text/javascript">
		function withdraw_amount() {
			try {

				var accno = document.getElementById("accno").value;

				if (Number(accno) == 0) {

					alert("Please Search Account No.");
					document.getElementById("accountno_to_search").focus();
					return false;

				}

				var withdraw_amount = document
						.getElementById("withdraw_amount").value;
				if (isNaN(withdraw_amount)) {
					alert("Numeric Required");
					document.getElementById("withdraw_amount").focus();
					return false;
				}

				withdraw_amount = Math.round(withdraw_amount);
				document.getElementById("withdraw_amount").value = withdraw_amount;

				if (Number(withdraw_amount) <= 0) {
					alert("Greater Number Required");
					document.getElementById("withdraw_amount").focus();
					return false;
				}

				var con = confirm("Are You Sure Want To Continue");

				if (con == false)
					return false;

				var url = "withdrawamount?accno=" + accno;
				url = url + "&withdraw_amount=" + withdraw_amount;
				
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

						document.getElementById("withdraw_amount").value = "";
						
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