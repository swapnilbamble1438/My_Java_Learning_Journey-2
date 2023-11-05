<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.b {
  width: 50%;
  text-align: center;
}
</style>
</head>
<body> 
<center>
<h1>Registration Successful</h1>
<p style="color:grey">Your Details are Submitted successfully</p>
<%
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sample","root","root");
		PreparedStatement ps=con.prepareStatement("select * from registration2;");
		
		ResultSet rs=ps.executeQuery();
		ResultSetMetaData rsmd = rs.getMetaData();


%>
	<table border style="border:1px " class = "b">
	<%
		out.println("<tr>");
			for(int i = 1; i <= rsmd.getColumnCount(); i++)
			{
				
				if(i == 3)
					out.println("<th> Email Id </th>");
				
				else
				out.println("<th>" + rsmd.getColumnLabel(i) + "</th>");
				
				
			}
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