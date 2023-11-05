<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
String Name = request.getParameter("name");

String Password = request.getParameter("password");



try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nfs","root","root");
    PreparedStatement ps=con.prepareStatement("insert into usermaster values(?,?)");
    ps.setString(1, Name);
    ps.setString(2, Password);
    
 ps.executeUpdate();
   
    
   		 out.println("<h1>Records are added successfully</h1>");


 }catch(Exception ex){
  out.println(ex.getMessage());
 } 




%>

</body>
</html>