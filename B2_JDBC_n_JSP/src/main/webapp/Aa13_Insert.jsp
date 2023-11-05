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
         Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root");
        PreparedStatement ps=con.prepareStatement("insert into signup values(?,?,?,?,?)");
        ps.setInt(1, Integer.parseInt(request.getParameter("j1")));
        ps.setString(2,request.getParameter("j2"));
		ps.setString(3,request.getParameter("j3"));
		ps.setString(4,request.getParameter("j4"));
		ps.setString(5,request.getParameter("j5"));

        ps.executeUpdate();
        out.println("<h1>Record is added successfully</h1>");
        }catch(Exception ex){
        out.println(ex.getMessage());
        }
        %>
           
	
</body>
</html>