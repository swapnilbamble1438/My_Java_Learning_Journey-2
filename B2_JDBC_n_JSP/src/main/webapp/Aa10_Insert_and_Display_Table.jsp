<%-- 
    Document   : A4_Signup
    Created on : 1 Aug, 2022, 12:33:29 AM
    Author     : Swapnil
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel = "stylesheet"
    href = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    </head>
    <body>
        
          <%
        try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/Testing","root","root");
           PreparedStatement ps=con.prepareStatement("insert into signup values(?,?,?,?,?)");
           ps.setInt(1, Integer.parseInt(request.getParameter("Number")));
           ps.setString(2, request.getParameter("Name"));
           ps.setString(3, request.getParameter("Email_Id"));
           ps.setString(4, request.getParameter("State"));
           ps.setString(5, request.getParameter("City"));
           ps.executeUpdate();

          // out.println("<h1>Records are added successfully</h1>");
   //       
   		PreparedStatement ps2=con.prepareStatement("select * from signup;");
		
   		ResultSet rs=ps2.executeQuery();
   		ResultSetMetaData rsmd = rs.getMetaData();


   %>
   <div class = "container">
	<center>
	<h2>Record is added successfully.</h2>
	<br>
	<table class = "table table-dark table-hover">
	<%
		out.println("<tr class = 'table-success'>");
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
						out.println("<td class = 'table-info'>" + rs.getString(i) + "</td>");
					}
				
				out.println("</tr");
			}
		out.println("</tr>");
	%>
	</table>
	</center>
	</div>
   <%
    //
    
        }catch(Exception ex){
         out.println(ex.getMessage());
        } 
        %>
    </body>
</html>
