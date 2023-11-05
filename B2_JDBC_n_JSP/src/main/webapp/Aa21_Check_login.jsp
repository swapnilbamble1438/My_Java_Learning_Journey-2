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
	String us=request.getParameter("Username");
	String pas=request.getParameter("Password");
	
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root");
		PreparedStatement ps=con.prepareStatement("select * from login where Username=? and Password=?");
		ps.setString(1, request.getParameter("Username"));
		ps.setString(2, request.getParameter("Password"));
		
		ResultSet rs=ps.executeQuery();
		if (rs.next()==true)
		{
			Cookie u = new Cookie("un",us);
			Cookie p = new Cookie("pw",pas);
			u.setMaxAge(10);
			p.setMaxAge(10);
			response.addCookie(u);
			response.addCookie(p);
		
			response.sendRedirect("Aa21_Home.jsp");
		}
			else
			{
				response.sendRedirect("Aa21_login.html");
			}
		
		}catch(Exception ex){
		   out.println(ex.getMessage());
		}
%>
</body>
</html>