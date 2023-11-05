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
   	Cookie cks = new Cookie("Car","BMW");
	cks.setMaxAge(10);
	response.addCookie(cks);
	out.print("Cookie submitted successfully");
	  
   %>
	<a href= "Aa22_Check.jsp" >
	Check Cookie
	
</form>
</body>
</html>