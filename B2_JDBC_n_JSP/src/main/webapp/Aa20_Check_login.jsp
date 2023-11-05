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
		PreparedStatement ps=con.prepareStatement("select * from login where Username=? and Password=?");
		ps.setString(1, request.getParameter("Username"));
		ps.setString(2, request.getParameter("Password"));
		
		ResultSet rs=ps.executeQuery();
		if (rs.next()==true)
		{
			Cookie u = new Cookie("tname","tp");
			u.setMaxAge(10);
			response.addCookie(u);
		
			response.sendRedirect("Aa20_Home.jsp");
		}
			else
			{
				response.sendRedirect("Aa20_login.html");
			}
		
		}catch(Exception ex){
		   out.println(ex.getMessage());
		}
%>
</body>
</html>