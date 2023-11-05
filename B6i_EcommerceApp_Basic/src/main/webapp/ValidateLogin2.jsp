<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String Name=request.getParameter("Username");
String N = null;

if(request.getCookies()!=null)
{
	Cookie[]rc =request.getCookies();
	int flag=0;
	for(int i=0;i<rc.length;i++)
	{
		if(rc[i].getName().equals("cname")==true)
		{
			flag=1;
			N = rc[i].getValue().toString();			
		}
	}
	if(flag!=1)
	{
		response.sendRedirect("customer_login.html");
	}
}

%>

</body>
</html>