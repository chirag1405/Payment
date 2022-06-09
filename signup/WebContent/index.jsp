<%
	if(session.getAttribute("name")== null)
	{
		response.sendRedirect("login.jsp");
	}
%>

<%@page import="java.util.*" %>
<%
Random rand = new Random();
int n= rand.nextInt(900000) + 100000;
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Payment</title>

<style>
.container {
	width : 35%;
  	border: 1px solid black;
	margin: auto;
	padding:20px;
  	text-align: center;
}

.slip{
text-align: left;
}

.slip_date{
text-align: right;
}
</style>

</head>
<body >
	<h1>Welcome <%= session.getAttribute("name")%> ,to the payment voucher page</h1>
	<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ms-auto">
				
					<li class="nav-item mx-0 mx-lg-1">   
						<a class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a>
					</li>
				 	<li class="nav-item mx-0 mx-lg-1 bg-danger"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="Logout">
						<%= session.getAttribute("name")%></a></li>	
				</ul> 
			</div>
			
			<form method="post" action="payform" class="payment-form" id="payment-form">
	<div class="container">
			<h2>Payment Voucher</h2>
			<div class="slip">
				Receipt number :<input type ="text" class="form-control" name="receipt"
				 id="invoiceid" style="color : blue; font-weight:bold; font-size:16px; "
				  value ="<%=n%>" readonly>
			</div>
	  		<div class="slip_date">
         		Date: <input type="date" name="myDate" id="">
      		</div><br>
      		
      		<div>
      			Received from :<input type="text" name="myName" id="name" value ="MITS Solution" placeholder ="Enter here"/>
            </div><br>
            
            <div>
            	Amount(in Rs): <input type ="number" name="amount">
            </div><br>
            
            <div>
            	Amount(in Words): <input type ="text" name="amount_in_words">
            </div><br>

      		<div>
      			Received By :<input type="text" name="customer" id="customer_name" placeholder ="Enter here"/>
            </div><br>
            
            <div>
            	<label for="payment_for">For payment of :</label>
            	<select name="pay" id="payment_for">
          			<option value="Training">Training</option>
          			<option value="Client Solution Support">Client Solution Support</option>
          			<option value="none" selected>None </option>
        		</select>
            </div><br>
            
            <div>
      			Total Hours/Sessions :<input type="text" name="hours" id="total_hours" placeholder ="Enter here"/>
            </div><br>
            
            <div>
            	Per session Payment :<input type ="number" name="amount_per_session">
            </div><br>

            <div>
            	<label for="payment_for">Paid By :</label>
            	<select name="paid" id="paid_by">
          			<option value="upi">UPI</option>
          			<option value="bank">Bank Account</option>
          			<option value="paytm">PayTm </option>
        		</select>
            </div><br>

					<td>
						<button type = "submit">Submit </button>
						<button type = "reset">Reset</button>
					</td>
			
            
		</div>
		</form>
</body>
</html>
