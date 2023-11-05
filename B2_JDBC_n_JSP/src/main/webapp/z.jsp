<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login JSP</title>
</head>
<body>
	<%
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root");
			PreparedStatement ps=con.prepareStatement("select * from login where username=? and password=?");
			ps.setString(1,request.getParameter("username"));
			ps.setString(2,request.getParameter("password"));
			ResultSet rs= ps.executeQuery();
			if (rs.next()==true)
			{
				Cookie c=new Cookie("Testing","yash");
				c.setMaxAge(20);
				response.addCookie(c);
				response.sendRedirect("home.jsp");
			}
			else
				response.sendRedirect("login.jsp");
			
			
		}catch(Exception ex){
			out.println(ex.getMessage());
		}
	%>
</body>
</html>