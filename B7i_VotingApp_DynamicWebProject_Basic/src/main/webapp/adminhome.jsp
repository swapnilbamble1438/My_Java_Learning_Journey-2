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
<h1>All Candidates Votes</h1>

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
		
		<%
		
		
			out.println("<tr>");
				for(int i = 1; i <= rsmd.getColumnCount(); i++)
				{
					
					
					 rsmd.getColumnLabel(i);
					
					
				}
				
			
		
			int c1=0;
			int c2=0;
			int c3=0;
			int c4=0;
				while(rs.next() == true)
				{
				
				
						for(int i = 1; i <= rsmd.getColumnCount(); i++)
						{
							
							rs.getString(i);
							
							
						}
						
						
						
						
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
							
							
						
							
					
				}
		
		%>
		
		<h3>Candidate 1 : Total Votes = <b style='color: Firebrick'><%= c1 %></b></h3>
		<h3>Candidate 2 : Total Votes = <b style='color: Firebrick'><%= c2 %></b></h3>
		<h3>Candidate 3 : Total Votes = <b style='color: Firebrick'><%= c3 %></b></h3>
		<h3>Candidate 4 : Total Votes = <b style='color: Firebrick'><%= c4 %></b></h3>
		
		
		
		
	<%
		con.close();    
		}catch(Exception ex){
		   out.println(ex.getMessage());
		}
	%>
	
	
</center>	
</body>
</html>