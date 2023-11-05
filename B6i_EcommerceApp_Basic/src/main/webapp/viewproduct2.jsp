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

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imagetableold","root","root");
		PreparedStatement ps=con.prepareStatement("select * from viewlist;");
		
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
					 out.println("<td><a href='addtocart.jsp?id="+rs.getString(1) +"&ie=" +rs.getString(2) + "&ig=" +rs.getString(3)+ "&ih=" +rs.getInt(4)+"&ii=" +rs.getInt(5)+ "&ij=" +rs.getString(6)+"'><img src='Images/Delete.jpg' alt = Add to cart height=50px width=50px></td>");
				
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