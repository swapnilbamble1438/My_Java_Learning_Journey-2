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
	String Name=request.getParameter("Username");
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imagetableold","root","root");
		PreparedStatement ps=con.prepareStatement("select * from customer where Name=? and Password=?");
		ps.setString(1, request.getParameter("Username"));
		ps.setString(2, request.getParameter("Password"));
		
		ResultSet rs=ps.executeQuery();
		if (rs.next()==true)
		{
			Cookie cus = new Cookie("cname",Name);
			cus.setMaxAge(9999);
			response.addCookie(cus);
			response.sendRedirect("customer_home.jsp");
		}
			else
			{
				response.sendRedirect("customer_login.html");
			}
		
		}catch(Exception ex){
		   out.println(ex.getMessage());
		}
%>
</body>
</html>