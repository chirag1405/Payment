package com.company.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FormServlet
 */
@WebServlet("/payform")
public class FormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       
		PrintWriter out = response.getWriter();
		
		String receipt = request.getParameter("receipt");
		String time_date = request.getParameter("myDate");
		String amt = request.getParameter("amount");
		String recieved_by = request.getParameter("customer");
		String for_payment_of = request.getParameter("pay");
		String session_payment = request.getParameter("amount_per_session");

		
		RequestDispatcher dispatcher = null;
		Connection con = null;
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/details?useSSL=false","root","Chirag@2002");
			PreparedStatement pst = con.prepareStatement("Insert into user_details(receipt, time_date, amt, recieved_by, for_payment_of, session_payment) values(?,?,?,?,?,?) ");
				pst.setString(1, receipt);
				pst.setString(2, time_date);
				pst.setString(3, amt);
				pst.setString(4, recieved_by);
				pst.setString(5, for_payment_of);
				pst.setString(6, session_payment);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("index.jsp");
			if(rowCount > 0)
			{
				request.setAttribute("status", "success");
			}else{
				request.setAttribute("status", "failed");
			}
			
			dispatcher.forward(request, response);
			}
		catch(Exception e){
			e.printStackTrace();
			}
		finally{
			try{
			con.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		}
			
	}
	
}
