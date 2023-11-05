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
        try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Testing","root","root");
           PreparedStatement ps=con.prepareStatement("insert into signup values(?,?,?,?,?)");
           ps.setInt(1, Integer.parseInt(request.getParameter("Number")));
           ps.setString(2, request.getParameter("Name"));
           ps.setString(3, request.getParameter("Email_Id"));
           ps.setString(4, request.getParameter("State"));
           ps.setString(5, request.getParameter("City"));
          
          

   			int i = ps.executeUpdate();
   				if(i > 0)
   				{
   					Cookie on = new Cookie("one","two");
   					on.setMaxAge(9999);
   					response.addCookie(on);
   					response.sendRedirect("Aa23iii.jsp");
   				}
   			
   			else
   				System.out.println("Something went wrong");

        }catch(Exception ex){
            out.println(ex.getMessage());
           } 
           %>

</body>
</html>