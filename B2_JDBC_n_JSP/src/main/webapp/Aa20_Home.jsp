<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>HOME</h1>
	
	<%
		 Cookie []rc=request.getCookies();
		 int flag = 0;
		 for(int i=0; i<rc.length; i++)
		 {
			 if(rc[i].getName().equals("tname")==true)
			 flag=1;
			 out.println("Cookies name"+rc[i].getName());
			 out.println("Cookies value"+rc[i].getValue());
			 
		 }
		 if(flag==1){
			 out.println("<h4>Valid</h4>");
			 
		 }
		 else
		 {
			 
			 response.sendRedirect("Aa20_login.html");
		 }
 %>
	 
</body>
</html>