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
<%@ include file="ValidateLogin2.jsp" %>
<center>
<%


out.println("<h2>" + N +" Cart </h2>" );

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imagetableold","root","root");
		String query = "select * from cart where Name = '"+N +"'";
		
		PreparedStatement ps=con.prepareStatement(query);
		
		ResultSet rs=ps.executeQuery();
		ResultSetMetaData rsmd = rs.getMetaData();


%>
	<table border>
	<%
		out.println("<tr>");
			for(int i = 1; i <= rsmd.getColumnCount(); i++)
			{
				out.println("<th>" + rsmd.getColumnLabel(i) + "</th>");
				
			}
		out.println("</tr>");
	
		out.println("<tr>");
			while(rs.next() == true)
			{
				out.println("<tr>");
					for(int i = 1; i <= rsmd.getColumnCount(); i++)
					{
						if(i == rsmd.getColumnCount())
							out.println("<td><img src='images/" + rs.getString(i) + "' height= 100px weight = 100px</td>");
							else
						out.println("<td>" + rs.getString(i) + "</td>");
						
					}
					out.println("<td><a href='removecart.jsp?id="+rs.getString(1) + "&ie="+ rs.getString(7) +"'><img src='images/Delete.jpg' alt = Remove from cart height=50px width=50px></td>");
				
				out.println("</tr");
			}
		out.println("</tr>");
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