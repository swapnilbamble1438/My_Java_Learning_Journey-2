<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel = "stylesheet"
href = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">

   <style> 

    button {
      width: 350px;
      padding: 7px;
    }
    
    .c{
    width: 350px;
    height: 40px;
    border-radius: 4px;
    border: 1px solid black;
    }
    
    .d{
    width:113px;
    height: 40px;
     border-radius: 4px;
     border: 1px solid black;
    }
    
    .e{
	margin-right: 300px;
	}
    
    .f{
	margin-right: 270px;
	}
	
	.g{
	margin-right: 290px;
	}
	
	.h{
	margin-right: 135px;
	}
    
    .i{
	margin-right: 170px;
	}
    
    
    
    
	</style>
	
	
	

</head>

<body>
<center>

<form action= "insert.jsp" method="post">
<br>
<div class = "container">
<br>
<h1 class = "h">Welcome User</h1>
<p class = "i" style="color:grey"> Please enter your details.</p>
<br>

<b class = "e">Name</b><br>
<input type = "text" name = "Name" placeholder="Enter your Name" class="c" required><br><br>



<b class = "f">Birth Date</b> <br>
<select name="Month" class="d" required>

	<option value="" disabled selected>Month</option>
    <option>January</option>
    <option>February</option>
    <option>March</option>
    <option>April</option>
    <option>May</option>
    <option>June</option>
    <option>July</option>
    <option>August</option>
    <option>September</option>
    <option>October</option>
    <option>November</option>
    <option>December</option>
</select> 

<select name="Day" class="d" required>
<option value="" disabled selected>Day</option>
<% for(int i = 1; i <= 31; i ++)
{%>
    <option><%= i %></option>
    <%} %>
</select> 

<select name="Year"  class = "d" required>
 <option value="" disabled selected>Year</option>
<% for(int i = 1950; i <= 2022; i ++)
{%>
    <option><%= i %></option>
    <%} %>    
</select> 

<br><br>
<b class = "g">Email Id</b><br>
 <input type="email"  name="Email_Id" placeholder="Enter your Email Id" class = "c" required> <br><br>
 
<br>
  <button type = "submit" class = "btn btn-primary btn-outline-light" style = "background-color:coral" > Submit </button>

 
 
</div>
</form>
</center>
</body>
</html>