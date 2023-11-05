<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>

<%@ include file = "navbar.jsp" %>
<%@ include file = "adminnavbar.jsp" %>
<center>
<h1>Admin Detais</h1>



<% 
Connection con = null;
	PreparedStatement stmt = null;
	
	try{
		Class.forName("org.sqlite.JDBC");
		con = DriverManager.getConnection("jdbc:sqlite:C:/Users/Swapnil/eclipse-workspace/Assignment_old/dtclass.db");
		String sql = "select * from admin ";
		
		stmt = con.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		ResultSetMetaData rsmd = rs.getMetaData();
		%>
		<table border style="border:1px " class = "b">
		<%
			out.println("<tr>");
				for(int i = 1; i <= rsmd.getColumnCount(); i++)
				{
					
					
					out.println("<th>" + rsmd.getColumnLabel(i) + "</th>");
					
					
				}
				// out.println("<th>Actions</th>");
			out.println("</tr>");
		
			
				while(rs.next() == true)
				{
					out.println("<tr>");
						for(int i = 1; i <= rsmd.getColumnCount(); i++)
						{
							out.println("<td>" + rs.getString(i) + "</td>");
						}
					
					
					out.println("</tr");
				}
		
		%>
		</table>
	<%
		con.close();    
		}catch(Exception ex){
		   out.println(ex.getMessage());
		}
	%>
	
</center>	
</body>
</html>