
<%@page import="java.util.List"%>
<%@page import="Assignment.SignupDAO"%>
<%@page import="Assignment.SignupEntity"%>
<%@page import="Assignment.DBConnect"%>
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
<%
	
	String msg = null;
	Cookie[] cookies = request.getCookies();

    for(int i = 0; i < cookies.length; i++) 
    	{
    if (cookies[i].getName().equals("one")) 
    	{
            cookies[i].setMaxAge(0);
            response.addCookie(cookies[i]);
            msg = "Record added successfully.";
    	}       
    }

	%>

	
	<%if(msg != null)
		out.println("<b style='color: firebrick'>" + msg +  "</b>");%>
	
	<div class = "container">
		<h2></h2>
		
		<table border>
		<thead>
			<tr>
				<th>Number</th>
				<th>Name</th>
				<th>Email_Id</th>
				<th>State</th>
				<th>City</th>
				
			</tr>
		</thead>
		<tbodY>
		
		<%
			SignupDAO dao = new SignupDAO(DBConnect.getConn());
			List<SignupEntity> list = dao.display();
			for(SignupEntity s : list)
			{%>
			<tr>
				<td><%= s.getNumber() %></td>
				<td><%= s.getName() %></td>
				<td><%= s.getEmail_Id() %></td>
				<td><%= s.getState() %></td>
				<td><%= s.getCity() %></td>
				
			</tr>
			<%}
		%>
		
		
		</tbodY>
		</table>
	</div>
	
	
</form>	
</body>
</html>