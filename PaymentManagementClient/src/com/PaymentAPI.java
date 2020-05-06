package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Payment;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;


@WebServlet("/PaymentAPI")
public class PaymentAPI extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private Payment payObj = new Payment();
    
    public PaymentAPI() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private static Map getParasMap(HttpServletRequest request)
	{
		Map<String, String> map = new HashMap<String, String>();
		try
		{
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			String queryString = scanner.hasNext() ?
								scanner.useDelimiter("\\A").next() : "";
			scanner.close();
			
			String[] params = queryString.split("&");
			for (String param : params)
			{ 
				String[] p = param.split("=");
				 map.put(p[0], p[1]);
			 }
		  }
		  catch (Exception e)
		  {
		  }
		  return map;
	 }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String output = payObj.insertPayment(Double.parseDouble(request.getParameter("DocCharge")),
				 Double.parseDouble(request.getParameter("HosCharge")),
				 Double.parseDouble(request.getParameter("AppoCharge")),
				 //Double.parseDouble(request.getParameter("Total")),
				 request.getParameter("PayType"),
				 request.getParameter("CardNo"),
				 request.getParameter("CardExpiryDate"),
				 request.getParameter("Card_CVNo"),
				 Integer.parseInt(request.getParameter("AppoID")));		
		
		response.getWriter().write(output); 
		
	}

	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Map paras = getParasMap(request);
		
		String  selectedItem;
	    if(request.getParameter("PayType")!=null)
	    {
	       selectedItem=request.getParameter("PayType");
	    }
		
		String output = payObj.updatePayment(Integer.parseInt(String.valueOf(paras.get("hidPayIDSave"))),
				 Double.parseDouble(String.valueOf(paras.get("DocCharge"))),
				 Double.parseDouble(String.valueOf(paras.get("HosCharge"))),
				 Double.parseDouble(String.valueOf(paras.get("AppoCharge"))),
				 Double.parseDouble(String.valueOf(paras.get("Total"))),
				 paras.get("PayType").toString(),
				 paras.get("CardNo").toString(),
				 paras.get("CardExpiryDate").toString(),
				 paras.get("Card_CVNo").toString(),
				 Integer.parseInt(String.valueOf(paras.get("AppoID"))));	
		
		response.getWriter().write(output); 
		
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Map paras = getParasMap(request); 
		
		String output = payObj.deletePayment(Integer.parseInt(String.valueOf(paras.get("PayID"))));
		
		response.getWriter().write(output); 
		
	}


}
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
