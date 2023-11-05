<%-- 
    Document   : A4_Signup
    Created on : 1 Aug, 2022, 12:33:29 AM
    Author     : Swapnil
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
          <%
        try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Testing","root","root");
           PreparedStatement ps=con.prepareStatement("insert into Signup values(?,?,?,?,?)");
           ps.setInt(1, Integer.parseInt(request.getParameter("Number")));
           ps.setString(2, request.getParameter("Name"));
           ps.setString(3, request.getParameter("Email_Id"));
           ps.setString(4, request.getParameter("State"));
           ps.setString(5, request.getParameter("City"));
           ps.executeUpdate();
          
           out.println("<h1>Records are added successfully</h1>");
   
    
        }catch(Exception ex){
         out.println(ex.getMessage());
        } 
        %>
    </body>
</html>
