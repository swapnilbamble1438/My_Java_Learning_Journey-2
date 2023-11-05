<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %>
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
    
    Connection con = null;
	PreparedStatement ps = null;
        try{
           Class.forName("org.sqlite.JDBC");
           con=DriverManager.getConnection("jdbc:sqlite:C:/Users/Swapnil/eclipse-workspace/Assignment/MyDB.db");
           ps=con.prepareStatement("insert into Users values(?,?,?)");
           ps.setString(1,request.getParameter("Name"));
           ps.setString(2, Birthday);
           ps.setString(3, request.getParameter("Email_Id"));
          
          
          

   			int i = ps.executeUpdate();
   				if(i > 0)
   				{
   					Cookie a = new Cookie("b","c");
   					a.setMaxAge(10);
   					response.addCookie(a);
   					response.sendRedirect("Activity_2.jsp");
   				}
   			
   			else
   				out.println("Error!");

        }catch(Exception ex){
            out.println(ex.getMessage());
           } 
           %>




</body>
</html>