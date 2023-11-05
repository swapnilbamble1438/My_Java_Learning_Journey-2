<%@page import="java.sql.*" %>
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
        try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Testing","root","root");
           PreparedStatement ps=con.prepareStatement("insert into emp values(?,?,?)");
           ps.setInt(1, Integer.parseInt(request.getParameter("Eid")));
           ps.setString(2, request.getParameter("Ename"));
           ps.setInt(3, Integer.parseInt(request.getParameter("Esal")));
           ps.executeUpdate();
           out.println("<h1>Records is added successfully</h1>");
        }catch(Exception ex){
         out.println(ex.getMessage());
        } 
        %>
    </body>
</html>
