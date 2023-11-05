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
		if(request.getCookies() == null)
		{
			
			out.print("Welcome");
		}
		else 
		{
			out.print("Welcome back");
		}
		// try to run it on incognito mode
	%>
</body>
</html>