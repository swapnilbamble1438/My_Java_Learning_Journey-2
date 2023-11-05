
<%@page import="java.sql.Connection"%>
<%@page import="com.entity.User"%>
<%@page import="com.dao.UserDAO"%>

<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="" method= "post">
<center>

	
	
	
	<div class = "container">
		<h2>All Users Details</h2>
		
		<table border>
		<thead>
			<tr>
				
				<th>Name</th>
				<th>Birthday</th>
				<th>Email Id</th>
				
			</tr>
		</thead>
		<tbodY>
		
		<%
			
			Connection con = DBConnect.getConn();
		
			if(con == null)
			{
				out.print("Connection Failed");
			}
			else
			{
			
				out.println("Connection Successfull");
			
		

						UserDAO dao = new UserDAO(DBConnect.getConn());	
							List<User> list = dao.getAllStudent();
							for(User s : list)
							{
				%>
			<tr>
				<td><%= s.getName() %></td>
				<td><%= s.getBirthday() %></td>
				<td><%= s.getEmail_Id() %></td>
				
				
			</tr>
			<%}
							
			}				
		%>
		
		
		</tbodY>
		</table>
	</div>
	
	
	
</center>	
</form>	

<center>
<br>
<form action= "Activity_1.jsp" method="get">
	<input type="Submit" value="Add New User">
</form>
</center>
</body>
</html>