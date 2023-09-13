<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script> 

	var xmlhttp = null;
	function search_accno() {
		try {
			var accno = document.getElementById("accountno_to_search").value;
			if (accno.length == 0)
				return false;

			var url = "ministatement?accountno_to_search=" + accno;
			xmlhttp = new XMLHttpRequest();
			xmlhttp.onreadystatechange = handleServerResponse;
			xmlhttp.open("GET", url, true);
			xmlhttp.send();
		} catch (e) {
			alert(e);
			return false;
		}
	}
	function handleServerResponse() {
		try {
			if (xmlhttp.readyState == 4) {
				
				if (xmlhttp.status == 200) {
					//console.log(xmlhttp.responseText);
					//alert(xmlhttp.responseText);
					document.getElementById("account_name").value = "";
					document.getElementById("account_type").value = "";
					document.getElementById("balance").value = "";

					var xx, j = 0;
					var temp;

					var x = xmlhttp.responseXML.documentElement.getElementsByTagName("member");
                    // alert(x);
                     //alert(x.length);
					for (var i = 0; i < x.length; i++) {
						xx = x[i].getElementsByTagName("name");
						var name = xx[0].firstChild.nodeValue;
						//console.log(name);

						Xx = x[i].getElementsByTagName("balance");
						var balance = Xx[0].firstChild.nodeValue;

						document.getElementById("account_name").value = name;
						document.getElementById("balance").value = balance;
					}/*for (var i=0;i<x.length;i++) */

					var table = document.getElementById("idtable");

					var rowCount = table.rows.length; /*this variable holds the length of rows in the table */

					for (var loop = 1; loop < rowCount; loop++)
						/*This loop is for traversing all the rows of a table */
						table.deleteRow(1);

					var x = xmlhttp.responseXML.documentElement
							.getElementsByTagName("transaction");

					for (var i = 0; i < x.length; i++) {

						xx = x[i].getElementsByTagName("date");
						var date = xx[0].firstChild.nodeValue;

						xx = x[i].getElementsByTagName("time");
						var time = xx[0].firstChild.nodeValue;
						xx = x[i].getElementsByTagName("deposit");
						var deposit = xx[0].firstChild.nodeValue;

						Xx = x[i].getElementsByTagName("withdraw");
						var withdraw = xx[0].firstChild.nodeValue;

						xx = x[i].getElementsByTagName("remark");
						if (xx[0].firstChild != null)
							var remark = xx[0].firstChild.nodeValue;

						tr = document.createElement('tr');

						td = document.createElement('td');
						td.innerHTML = date;
						tr.appendChild(td);

						td = document.createElement('td');

						td.innerHTML = time;
						tr.appendChild(td);

						td = document.createElement('td');
						td.innerHTML - deposit;
						tr.appendChild(td);
						td = document.createElement('td');
						td.innerHTML = withdraw;

						tr.appendChild(td);

						td = document.createElement('td');

						td.innerHTML = remark;
						tr.appendChild(td);

						table.getElementsByTagName("tbody")[0].appendChild(tr);
					}
					/*for (var i=0;i<x.length;i++)*/

					xmlhttp = null;
				}
			}
		} catch (e) {
			alert(e);
			console.log(e);
		}
	}
</script> 

</head>
<body>
	<table align="center">

		<tr>
			<td>Enter Account No.</td>
			<td><input type="text" onkeyUp="search_accno()"
				name="accountno_to_search" id="accountno_to_search"></td>
		</tr>

	</table>
	<br>
	<br>
	<table align="center">
		<tr>
			<td>Account Name</td>
			<td><input type="text" value="" readonly="true"
				name="account_name" id="account_name"></td>
		</tr>
		<tr>
			<td>Account Type</td>
			<td>:<input type="text" value="" readonly="true"
				name="account_type" id="account_type"></td>
		</tr>
		<tr>
			<td>Balance</td>
			<td><input type="text" value="" readonly="true" name="balance"
				id="balance"></td>
		</tr>
	</table>
	<br>
	<br>
	<table align="center" cellpadding="2" border="1" id="idtable"
		style="border-collapse: collapse;">
		<tbody>
			<tr>
				<td>Date</td>
				<td>Time</td>
				<td>Deposit</td>
				<td>Withdraw</td>
				<td>Remark</td>
			</tr>
		</tbody>

	</table>

</body>
</html>