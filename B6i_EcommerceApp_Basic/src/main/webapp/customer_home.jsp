<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="ValidateLogin2.jsp" %>
<div align = "center">

	<h1>Customer HOME</h1>
	
	
	
	<%

		
	out.println("<h2>Welcome " + N + "</h2>"); 
	
	%>
	
	<a href = viewproduct2.jsp><h2>View Products</h2></a>
	<br>
	<a href = "cart.jsp"><h2>View Cart</h2></a>
</div>
	 
</body>
</html>