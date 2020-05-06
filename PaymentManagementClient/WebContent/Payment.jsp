<%@page import="model.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
 <script src="Component/jquery-3.3.1.min.js"></script>
 <script src="Component/Payment.js"></script>

</head>
<body>
<div class="container">
<div class="row">
<div class="col-6">
		<h1>Payment</h1>
		
		<form id="formPayment" name="formPayment">
			
 			 Doctor Charge:
 			<input id="DocCharge" name="DocCharge" type="text"
 					class="form-control form-control-sm">
 					
 			<br> Hospital Charge:
 			<input id="HosCharge" name="HosCharge" type="text"
 					class="form-control form-control-sm">
 					
 			<br> Appointment Charge:
 			<input id="AppoCharge" name="AppoCharge" type="text"
 					class="form-control form-control-sm">
 					
 			<br> Total:
 			<input id="Total" name="Total" type="text"
 					class="form-control form-control-sm" readonly>
 			
 			<br> Payment Type:
 			<select id="PayType" name="PayType" 
 					class="form-control form-control-sm">
 						<option value="0">--Select Payment Type--</option>
 						<option value="credit">credit</option>
 						<option value="debit">debit</option>
 			</select>
 			<br> Card No:
 			<input id="CardNo" name="CardNo" type="text"
 					class="form-control form-control-sm">
 					
 			<br> Card Expiry Date:
 			<input id="CardExpiryDate" name="CardExpiryDate" type="date"
 					class="form-control form-control-sm">
 					
 			<br> Card CV No:
 			<input id="Card_CVNo" name="Card_CVNo" type="text"
 					class="form-control form-control-sm">		
 					
 			<br> Appointment ID:
 			<input id="AppoID" name="AppoID" type="text"
 					class="form-control form-control-sm">		
 					
 			<br>
 			<input id="btnSave" name="btnSave" type="button" value="Pay"
 					class="btn btn-primary">
 			<input type="hidden" id="hidPayIDSave"
 					name="hidPayIDSave" value="">
 			
 			
		</form>
		
		<div id="alertSuccess" class="alert alert-success"></div>
		<div id="alertError" class="alert alert-danger"></div>
		
		<br>
		<div id="divPaymentGrid">
 			<%
 				Payment payObj = new Payment();
 				out.print(payObj.readPayment());
 			%>
		</div>
		</div>
 	</div>
	</div>
		

</body>
</html>







