<%@page import="java.sql.*" %>
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
		PreparedStatement ps=con.prepareStatement("select * from usermaster where username=? and password=?");
		ps.setString(1, request.getParameter("username"));
		ps.setInt(2, Integer.parseInt(request.getParameter("password")));
		ResultSet rs=ps.executeQuery();
		if(rs.next()==true)
		       out.println("<h1>valid</h1>");
		
		else
			response.sendRedirect("A7_usermaster.html");
	       
		}catch(Exception ex){
		   out.println(ex.getMessage());
		}
%>
         
    </body>
</html>
