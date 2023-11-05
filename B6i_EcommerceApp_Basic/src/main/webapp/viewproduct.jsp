<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script>

function abc(x)
{
	
	alert(x);
}
</script>
<body> 
 <%-- <%@ include file="ValidateLogin.jsp" %> --%>
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
				
					out.println("<td onclick= abc('Login_First')>" + "Add to Cart" + "</td>");
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