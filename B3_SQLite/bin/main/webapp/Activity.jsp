<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 

<%@page import = "Connection.sql" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.b {
  width: 50%;
  text-align: center;
}
</style>
</head>
<body> 
<center>
<h1>Registration Successful</h1>
<p style="color:grey">Your Details are Submitted successfully</p>
<%
	sql con = new sql();
	con.getConnection();
	
	out.print.ln);

%>
	</center>
</body>
</html>