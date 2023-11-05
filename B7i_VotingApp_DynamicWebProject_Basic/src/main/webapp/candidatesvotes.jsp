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
<h1>All Candidates Votes Details</h1>

<% 
Connection con = null;
	PreparedStatement stmt = null;
	
	try{
		Class.forName("org.sqlite.JDBC");
		con = DriverManager.getConnection("jdbc:sqlite:C:/Users/Swapnil/eclipse-workspace/Assignment_old/dtclass.db");
		String sql = "select * from Candidates ";
		
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
			//	out.println("<th>Action</th>");
			out.println("</tr>");
		
			int c1=0;
			int c2=0;
			int c3=0;
			int c4=0;
				while(rs.next() == true)
				{
				
					out.println("<tr>");
						for(int i = 1; i <= rsmd.getColumnCount(); i++)
						{
							
							out.println("<td>" + rs.getString(i) + "</td>");
							
							
						}
						
			//			 out.println("<td><a href='deletevotes.jsp?id="+rs.getString(2) +"'>delete vote</td>");
						
						
						if(rs.getString(1) != null)
						{
						 c1 = c1 + 1;
						}
						
						if(rs.getString(2) != null)
						{
						 c2 = c2 + 1;
						}
						
						if(rs.getString(3) != null)
						{
						 c3 = c3 + 1;
						}
						
						if(rs.getString(4) != null)
						{
						 c4 = c4 + 1;
						}
							
							
						
							
					out.println("</tr");
				}
		
		%>
		</table>
		<tr>
		<td>votes = <%= c1 %></td>
		<td>votes = <%= c2 %></td>
		<td>votes = <%= c3 %></td>
		<td>votes = <%= c4 %></td>
		<tr>
		
		
		
	<%
		con.close();    
		}catch(Exception ex){
		   out.println(ex.getMessage());
		}
	%>
	
	
</center>	
</body>
</html>