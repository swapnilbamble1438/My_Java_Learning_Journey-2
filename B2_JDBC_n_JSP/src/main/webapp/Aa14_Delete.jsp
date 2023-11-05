<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
try{
  String id=request.getParameter("id");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testing", "root", "root");
PreparedStatement ps=con.prepareStatement("delete from signup where Number ="+id+";");
ps.executeUpdate();
response.sendRedirect("Aa14_Display.jsp");
}catch(Exception ex){	
	out.println(ex.getMessage());}

%>

</body>
</html>