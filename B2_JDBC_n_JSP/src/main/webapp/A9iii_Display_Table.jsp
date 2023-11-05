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
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/testing","root","root");
		PreparedStatement ps=con.prepareStatement("select * from Signup;");
		
		ResultSet rs=ps.executeQuery();
		ResultSetMetaData rsmd = rs.getMetaData();

%>
	<table border>
	<%
		while(rs.next() == true)
		{ 
	%>
		<tr>
			<% 
				for (int i = 1; i <= rsmd.getColumnCount(); i++)
				{
			%>
					<td> <%= rs.getString(i)  %> </td>				
			<% 
				}
			%>
		</tr>
	<% 
		}
	%>

	</table>


<%
		con.close();    
		}catch(Exception ex){
		   out.println(ex.getMessage());
		}
%>
	
</body>
</html>