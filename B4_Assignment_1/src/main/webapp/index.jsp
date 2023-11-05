<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel = "stylesheet"
    href = "css/Buttons.css">
    
    
    <link href = "css/Containers.css" rel="stylesheet">
    
    <style>
select:invalid { color: gray; }


</style>

</head>

<body>
<center>

<form action= "insert2.jsp" method="post">
<br>
<h1>Welcome User</h1>
<p style="color:grey"> Please enter your details.</p>
<br>
<b>Name</b><br>
<input type = "text" name = "Name" placeholder="Enter your Name" required><br><br>



<b class = "txt">Birth Date</b> <br>
<select name="Month" required>

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

<select name="Day" required>
<option value="" disabled selected>Day</option>
<% for(int i = 1; i <= 31; i ++)
{%>
    <option><%= i %></option>
    <%} %>
</select> 

<select name="Year"  required >
 <option value="" disabled selected>Year</option>
<% for(int i = 1950; i <= 2022; i ++)
{%>
    <option><%= i %></option>
    <%} %>    
</select> 

<br><br>
<b>Email Id</b><br>
 <input type="email"  name="Email_Id" placeholder="Enter your Email Id" required> <br><br>
 

  <button type = "sumbit" class = "btn btn-primary btn-outline-light" style = "background-color:coral; padding: 10px black"> Submit </button>

 
</form>
</center>
</body>
</html>