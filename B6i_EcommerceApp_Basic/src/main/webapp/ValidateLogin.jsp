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
if(request.getCookies()!=null)
{
	Cookie[]rc =request.getCookies();
	int flag=0;
	for(int i=0;i<rc.length;i++)
	{
		if(rc[i].getName().equals("tname")==true)
			flag=1;
	}
	if(flag!=1)
	{
		response.sendRedirect("admin_login.html");
	}
}

%>

</body>
</html>