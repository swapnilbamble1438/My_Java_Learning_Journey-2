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
String Month = request.getParameter("Month");
String Day = request.getParameter("Day");
String Year = request.getParameter("Year");

String Space = " ";

String Birthday = Month + Space + Day + Space + Year;

%>
    <%
        try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sample","root","root");
           PreparedStatement ps=con.prepareStatement("insert into registration2 values(?,?,?)");
           ps.setString(1,request.getParameter("Name"));
           ps.setString(2, Birthday);
           ps.setString(3, request.getParameter("Email_Id"));
          
          
          

   			int i = ps.executeUpdate();
   				if(i > 0)
   				{
   					response.sendRedirect("display2.jsp");
   				}
   			
   			else
   				out.println("Something went wrong");

        }catch(Exception ex){
            out.println(ex.getMessage());
           } 
           %>




</body>
</html>