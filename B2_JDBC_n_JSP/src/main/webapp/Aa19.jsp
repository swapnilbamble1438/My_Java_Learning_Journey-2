<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookies</title>
</head>
<body>
 <%
 if(request.getCookies()==null)
 {
	 out.println("Welcome");
	 Cookie c=new Cookie("Testing","yash");
	 c.setMaxAge(30);
	 response.addCookie(c);
	 
 }
 else
 {
	 Cookie []rc=request.getCookies();
	 int flag=0;
	 for(int i=0;i<rc.length;i++)
	 {
		 if(rc[i].getName().equals("Testing")==true)
			 flag=1;
		 out.println("<br>Cookies Name"+rc[i].getName());
		 out.println("<br>Cookies value"+rc[i].getValue());
	}
	 if(flag==1)
	 {
		 out.println("<h1>Welcome back</h1>");
	 }
	 else
	 {
		 out.println("<h1>Welcome</h1>");
		 Cookie c=new Cookie("Testing","Yash");
		 c.setMaxAge(30);
		 response.addCookie(c);
	 }
 }
 %>
</body>
</html>