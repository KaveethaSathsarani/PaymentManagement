package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import util.DBHandler;

public class Payment {
	
	
	public String insertPayment(Double DocCharge,Double HosCharge,Double AppoCharge,String PayType,String CardNo,String CardExpiryDate,String Card_CVNo,
								Integer AID)
	{
	 
	 String output = "";
	 
	 try
	 {  
		 Connection con = DBHandler.connect();
	 
		 if (con == null)
		 {
			 return "Error while connecting to the database for inserting."; 
		 }
		 
		//check if appointment charge,doctor charge and hospital charge are equal or less than zero
		 if(DocCharge <= 0)
		 {
			 return "Doctors Charge cannot be equal or less than zero ";
		 }
		 else if(HosCharge <= 0 )
		 {
			 return "Hospital Charge cannot be equal or less than zero ";
		 }
		 else if(AppoCharge <= 0 )
		 {
			 return "Appointment Charge cannot be equal or less than zero ";
		 }
	 
		 // create a prepared statement		 
		 String query = " insert into payment(PayID,DocCharge,HosCharge,AppoCharge,Total,PayType,CardNo,CardExpiryDate,Card_CVNo,AID)"
			 + " values (?,?,?,?,DocCharge+HosCharge+AppoCharge,?,?,?,?,?)";
	  
		 PreparedStatement preparedStmt = con.prepareStatement(query);
		 // binding values
		 preparedStmt.setInt(1, 0);
		 preparedStmt.setDouble(2, DocCharge);
		 preparedStmt.setDouble(3, HosCharge);
		 preparedStmt.setDouble(4, AppoCharge);
		 preparedStmt.setString(5, PayType);
		 preparedStmt.setString(6, CardNo);
		 preparedStmt.setString(7, CardExpiryDate);
		 preparedStmt.setString(8, Card_CVNo);
		 preparedStmt.setInt(9, AID);
	 
		 preparedStmt.execute();
		 con.close();
		 output = "Inserted successfully";
		 
	 }
	 catch (Exception e)
	 {
		 output = "Error while inserting the payment.";
		 System.err.println(e.getMessage());	
	 }
	 	 return output;
	 }
	
	
	
	public String readPayment()
    {	
		
	 String output = "";
	 
	 try
	 {
	
		 Connection con = DBHandler.connect();
		 if (con == null)
		 {
			 return "Error while connecting to the database for reading."; 
		 }
		 // Prepare the html table to be displayed
	 
		 output = "<table border=\"1\"><tr><th>PayID</th><th>DocCharge</th><th>HosCharge</th><th>AppoCharge</th><th>Total</th>"
	 		+ "<th>PayType</th><th>CardNo</th><th>CardExpiryDate</th><th>Card_CVNo</th><th>AID</th></tr>";
	 
		 String query = "select * from payment";
		 Statement stmt = con.createStatement();
		 ResultSet rs = stmt.executeQuery(query);
	 
		 // iterate through the rows in the result set
		 while (rs.next())
		 {
			 String PayID = Integer.toString(rs.getInt("PayID"));
			 String DocCharge = Double.toString(rs.getDouble("DocCharge"));
			 String HosCharge = Double.toString(rs.getDouble("HosCharge"));
			 String AppoCharge = Double.toString(rs.getDouble("AppoCharge"));
			 String Total = Double.toString(rs.getDouble("Total"));
			 String PayType = rs.getString("PayType");
			 String CardNo = rs.getString("CardNo");
			 String CardExpiryDate = rs.getString("CardExpiryDate");
			 String Card_CVNo = rs.getString("Card_CVNo");
			 String AID = Integer.toString(rs.getInt("AID"));
			
	  
			 // Add into the html table
			 output += "<tr><td>" + PayID + "</td>";
			 output += "<td>" + DocCharge + "</td>";
			 output += "<td>" + HosCharge + "</td>";
			 output += "<td>" + AppoCharge + "</td>";
			 output += "<td>" + Total + "</td>";
			 output += "<td>" + PayType + "</td>";
			 output += "<td>" + CardNo + "</td>";
			 output += "<td>" + CardExpiryDate + "</td>";
			 output += "<td>" + Card_CVNo + "</td>";
			 output += "<td>" + AID + "</td>";
			
	 
		 }
	 
		 con.close();
		 // Complete the html table
		 output += "</table>";
	 }
	 catch (Exception e)
	 {
		 output = "Error while reading the payment.";
		 System.err.println(e.getMessage());
	 }
	 	return output; 
     }
	
	
	
	public String updatePayment(Integer PayID,Double DocCharge,Double HosCharge,Double AppoCharge,String PayType,String CardNo,String CardExpiryDate,String Card_CVNo,
			Integer AID)
	{
		
	 String output = "";
	 
	 try
	 {
		 Connection con = DBHandler.connect();
		 if (con == null)
		 {
			 return "Error while connecting to the database for updating."; 
		 }
		 
		//Check payID is null 
		 if(PayID <= 0 )
		 {
			 return "PayID cannot be null";
		 }
		 
		 //check if appointment charge,doctor charge and hospital charge are equal or less than zero
		 if(DocCharge <= 0)
		 {
			 return "Doctors Charge cannot be equal or less than zero ";
		 }
		 else if(HosCharge <= 0 )
		 {
			 return "Hospital Charge cannot be equal or less than zero ";
		 }
		 else if(AppoCharge <= 0 )
		 {
			 return "Appointment Charge cannot be equal or less than zero ";
		 }
		 
		 // create a prepared statement
		 String query = "UPDATE payment SET DocCharge=?,HosCharge=?,AppoCharge=?,PayType=?,CardNo=?,CardExpiryDate=?,Card_CVNo=?,AID=? WHERE PayID=?";
		 PreparedStatement preparedStmt = con.prepareStatement(query);
		 // binding values
	 
		 preparedStmt.setDouble(1, DocCharge);
		 preparedStmt.setDouble(2, HosCharge);
		 preparedStmt.setDouble(3, AppoCharge);
		 preparedStmt.setString(4, PayType);
		 preparedStmt.setString(5, CardNo);
		 preparedStmt.setString(6, CardExpiryDate);
		 preparedStmt.setString(7, Card_CVNo);
		 preparedStmt.setInt(8, AID);
		 preparedStmt.setInt(10, PayID);
	 
		 // execute the statement
		 preparedStmt.execute();
		 con.close();
		 output = "Updated successfully";
	 }
	 catch (Exception e)
	 {
		 output = "Error while updating the payment.";
		 System.err.println(e.getMessage());
	 }
	 	return output;
	 }
	
	public String deletePayment(Integer PayID)
	{
		
	 String output = "";
	 
	 try
	 {
		 
		 Connection con = DBHandler.connect();
		 if (con == null)
		 {
			 return "Error while connecting to the database for deleting."; 
		 }
		 
		 //Check payID is null 
		 if(PayID == null)
		 {
			 return "PayID cannot be null";
		 }
		 // create a prepared statement
		 String query = "delete from payment where PayID=?";
		 PreparedStatement preparedStmt = con.prepareStatement(query);
		 // binding values
		 preparedStmt.setInt(1, PayID);
		 // execute the statement
		 preparedStmt.execute();
		 con.close();
		 output = "Deleted successfully";
	 }
	 catch (Exception e)
	 {
		 output = "Error while deleting the payment.";
		 System.err.println(e.getMessage());
	 }
	 	return output;
	 } 
	

}


