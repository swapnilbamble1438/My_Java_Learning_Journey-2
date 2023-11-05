
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
.b {
  width: 50%;
  text-align: center;
}
</style>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<center>
<br>
<%
	
	String msg1 = null;
	String msg2 = null;

	Cookie[] cookies = request.getCookies();

    for(int i = 0; i < cookies.length; i++) 
    	{
    if (cookies[i].getName().equals("b")) 
    	{
            cookies[i].setMaxAge(0);
            response.addCookie(cookies[i]);
            msg1 = "Registration Successful";
            msg2 = "Your Details are Submitted successfully";
    	}       
    }

	%>
	
	<%if(msg1 != null)
		{
		out.println("<h1>" + msg1 +  "</h1>");
		out.println("<p style='color: Grey'>" + msg2 +  "</p>");
		
		}%>



<% 
Connection con = null;
	PreparedStatement ps = null;
	
	try{
		Class.forName("org.sqlite.JDBC");
		con = DriverManager.getConnection("jdbc:sqlite:C:/Users/Swapnil/eclipse-workspace/Assignment/MyDB.db");
	//	con = DriverManager.getConnection("jdbc:sqlite:dtclass.db");
		String sql = "select * from Users";
		
		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		ResultSetMetaData rsmd = rs.getMetaData();


		%>
			<table border border style="border:1px " class = "b">
			
				<tr>
				<th>Name</th>
				<th>Birthday</th>
				<th>Email Id</th>
				</tr>
				<%	while(rs.next() == true)
					{
						out.println("<tr>");
							for(int i = 1; i <= rsmd.getColumnCount(); i++)
							{
								out.println("<td>" + rs.getString(i) + "</td>");
							}

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


<br>
<form action= "Activity_1.jsp" method="get">
	<input type="Submit" value="Add New User">
</form>
</center>
</body>
</html>