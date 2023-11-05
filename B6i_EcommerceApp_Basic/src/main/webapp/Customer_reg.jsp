<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 
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
          Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imagetableold","root","root");
          PreparedStatement ps=con.prepareStatement("insert into customer values(?,?)");
       
      
      		ps.setString(1, (request.getParameter("Username")));
   		ps.setString(2, (request.getParameter("Password")));
   		
   		
  		int row = ps.executeUpdate(); // it returns no of rows affected.

		if (row > 0) 
		{
		out.println("<h1>Registration successful.</h1>");
		} else 
		{
			out.println("<h1>Failed to Register.</h1>");
		}

	} catch (Exception e) 
	{
		System.out.println(e);
	}
     
	%>
</body>
</html>