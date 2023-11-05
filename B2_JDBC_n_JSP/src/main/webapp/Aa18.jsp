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
	 Cookie c=new Cookie("Testing","yash");
	 c.setMaxAge(30);
	 response.addCookie(c); // try adding and removing this cookie.
	 
		if(request.getCookies() == null)
		{
			out.println("No Cookies Received");
			
		}
	
	
		else 
		{	 
			Cookie[]rc = request.getCookies();
			  			
			int flag = 0;
			for(int i = 0; i<rc.length; i++)
			{
				if(rc[i].getName().equals("Testing")==true)
					flag =1;
				out.println("<br> Cookie Name " + rc[i].getName());
				out.println("<br> Cookie Value " + rc[i].getValue());
				
			}
			if(flag == 1)
			{
				out.println("<h1>Recieved Your Cookie</h1>");
				
			}
			else
			{
				out.println("<h1>Not Received your Cookie");
			}
		}
		
	%>
</body>
</html>