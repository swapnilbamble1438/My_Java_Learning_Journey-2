<%@page import="com.model.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.utility.MyUtilities"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
//first upload image if image is successfully uploaded then add values as a record
try{
	Emp e1=new Emp();
	
	if(e1.AddEmployee(request, application.getRealPath("/")))
	{
		out.println("record is added successfully");
		
	}
	else
	{
		out.println("record is not added successfully");
	}
	
}catch (Exception ex){
	out.println("<h1>Contact Admin</h1>");
}
%>
</body>
</html>