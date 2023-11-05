<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root");
		PreparedStatement ps=con.prepareStatement("select * from Practice where Name=? and City=?");
		ps.setString(1, request.getParameter("Name"));
		ps.setString(2, request.getParameter("City"));
		ResultSet rs=ps.executeQuery();
		if(rs.next()==true)
		       out.print("<h1>valid</h1>");
		
		else
			response.sendRedirect("A8_Practice.html");
		       
		}catch(Exception ex){
			out.println(ex.getMessage());
		}
%>
	
</body>
</html>