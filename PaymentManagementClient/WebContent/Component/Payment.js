$(document).ready(function()
{
	if ($("#alertSuccess").text().trim() == "")
	{
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});

//CLIENTMODEL=========================================================================
function validatePaymentForm()
{
 // DocCharge------------------------------------------------------------
	if ($("#DocCharge").val().trim() == "")
	{
		return "Insert Doctors Charge.";
	}
	// is numerical value
	var tmpDocCharge = $("#DocCharge").val().trim();
	if (!$.isNumeric(tmpDocCharge))
	{
		return "Insert a numerical value for Doctors Charge.";
	}
	// convert to decimal price
	$("#DocCharge").val(parseFloat(tmpDocCharge).toFixed(2));
	 
	
 // HosCharge------------------------------------------------------------------
	if ($("#HosCharge").val().trim() == "")
	{
		return "Insert Hospital Charge.";
	}
	// is numerical value
	var tmpHosCharge = $("#HosCharge").val().trim();
	if (!$.isNumeric(tmpHosCharge))
	{
		return "Insert a numerical value for Doctors Charge.";
	}
	// convert to decimal price
	$("#HosCharge").val(parseFloat(tmpHosCharge).toFixed(2));
	
		 
 // AppoCharge-------------------------------------------------------------------
	if ($("#AppoCharge").val().trim() == "")
	{				
		return "Insert Appointment Charge.";
	}
	// is numerical value
	var tmpAppoCharge = $("#AppoCharge").val().trim();
	if (!$.isNumeric(tmpAppoCharge))
	{
		return "Insert a numerical value for Appointment Charge.";
	}
	// convert to decimal price
	$("#AppoCharge").val(parseFloat(tmpAppoCharge).toFixed(2));
	
 // PayType----------------------------------------------------------------------
	
	   if(document.getElementById("PayType").value == "0")
	   {
	      return "Select payment type";
	   }
	
 // CardNo-----------------------------------------------------------------------
	if ($("#CardNo").val().trim() == "")
	 {
		return "Insert Card No.";
	 }
	 // is numerical value
	 var tmpCardNo = $("#CardNo").val().trim();
	 if (!$.isNumeric(tmpCardNo))
	 {
		 return "Insert a numerical value for Card No.";
	 }	
	 
 // CardExpiryDate-------------------------------------------------------------
	if ($("#CardExpiryDate").val().trim() == "")
	 {
		return "Insert Card Expiry Date.";
	 }
	
 // Card_CVNo--------------------------------------------------------
	if ($("#Card_CVNo").val().trim() == "")
	 {
		return "Insert Card CVC No.";
	 }
	 // is numerical value
	 var tmpCard_CVNo = $("#Card_CVNo").val().trim();
	 if (!$.isNumeric(tmpCard_CVNo))
	 {
		return "Insert a numerical value for Card CVC No.";
	 }	
	
 // AppoID----------------------------------------------------------
	 if ($("#AppoID").val().trim() == "")
	 {
		 return "Insert Appointment ID.";
	 }
	 // is numerical value
	 var tmpAppoID = $("#AppoID").val().trim();
	 if (!$.isNumeric(tmpAppoID))
	 {
		 return "Insert a numerical value for Appointment ID.";
	 }	
	
	return true; 
}

//SAVE & UPDATE ===================================================================
$(document).on("click", "#btnSave", function(event)
{
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	
	// Form validation-------------------
	var status = validatePaymentForm();
	
	if (status != true)
	{
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	
	var type = ($("#hidPayIDSave").val() == "") ? "POST" : "PUT";
	
	$.ajax(
			{
			 url : "PaymentAPI",
			 type : type,
			 data : $("#formPayment").serialize(),
			 dataType : "text",
			 complete : function(response, status)
			 {
				 onPaymentSaveComplete(response.responseText, status);
			 }
			
	 });
	
	
});

//DELETE ===============================================================================

$(document).on("click", ".btnRemove", function(event)
{
				 $.ajax(
				 {
					 url : "PaymentAPI",
					 type : "DELETE",
					 data : "PayID=" + $(this).data("payid"),
					 dataType : "text",
					 complete : function(response, status)
					 {
						 onPaymentDeleteComplete(response.responseText, status);
					 }
				 });
		});

//UPDATE==================================================================================
$(document).on("click", ".btnUpdate", function(event)
{
	$("#hidPayIDSave").val($(this).closest("tr").find('#hidPayIDUpdate').val());
	$("#PayID").val($(this).closest("tr").find('td:eq(0)').text());
	$("#DocCharge").val($(this).closest("tr").find('td:eq(1)').text());
	$("#HosCharge").val($(this).closest("tr").find('td:eq(2)').text());
	$("#AppoCharge").val($(this).closest("tr").find('td:eq(3)').text());
	$("#Total").val($(this).closest("tr").find('td:eq(4)').text());
	$("#PayType").val($(this).closest("tr").find('td:eq(5)').text());
	$("#CardNo").val($(this).closest("tr").find('td:eq(6)').text());
	$("#CardExpiryDate").val($(this).closest("tr").find('td:eq(7)').text());
	$("#Card_CVNo").val($(this).closest("tr").find('td:eq(8)').text());
	$("#AppoID").val($(this).closest("tr").find('td:eq(9)').text());
}); 



function onPaymentSaveComplete(response, status)
{
	if (status == "success") {
		
		var resultSet = JSON.parse(response);
		
		if (resultSet.status.trim() == "success") {
			
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divPaymentGrid").html(resultSet.data);
			
		} else if (resultSet.status.trim() == "error") {
			
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
		
	} else {
		
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
		
	}
	
	$("#hidPayIDSave").val("");
	$("#formPayment")[0].reset();
	
}


function onPaymentDeleteComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			
			$("#divPaymentGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error")
	{
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else
	{
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}
