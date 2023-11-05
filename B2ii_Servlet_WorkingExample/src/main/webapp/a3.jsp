<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
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
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/nfs","root","root");
    PreparedStatement ps=con.prepareStatement("select * from usermaster");
  
    
	ResultSet rs = ps.executeQuery();
	ResultSetMetaData rsmd = rs.getMetaData();
   
 %>   
	<table border>
	<tr>
	<%  for(int i = 1; i <= rsmd.getColumnCount(); i++)
	{
		%>
		<th>
		<%= rsmd.getColumnLabel(i) %>
		
		</th>

		<%
	}
		
		
		%>
		
	<tr>
	<%while(rs.next() == true)
		{%>
		<tr>
		<%for(int i = 1; i <= rsmd.getColumnCount(); i++)
			{%>
		
			<td>
			<%=rs.getString(i) %>
			</td>
		
		
		<%} %>
		</tr>	
		
	
	<% }%>
	
	
	
   		 
   		 </table>
   		 
   		 
   		 
   		 

<% 
 }catch(Exception ex){
  out.println(ex.getMessage());
 } 




%>

</body>
</html>