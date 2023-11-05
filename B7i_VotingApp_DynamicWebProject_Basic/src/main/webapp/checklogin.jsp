<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
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
<%@ include file = "navbar.jsp" %>
<center>
<%
	String uid,pwd;
	
	uid = request.getParameter("txtUID");
	pwd = request.getParameter("txtPWD");
	
	Connection con = null;
	PreparedStatement stmt = null;
	
	try{
		Class.forName("org.sqlite.JDBC");
		con = DriverManager.getConnection("jdbc:sqlite:C:/Users/Swapnil/eclipse-workspace/Assignment_old/dtclass.db");
	//	con = DriverManager.getConnection("jdbc:sqlite:dtclass.db");
		String sql = "select * from tbl_Login where userid= '"+ uid +"' and password = '"+pwd+"'";
		
		stmt = con.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next())
		{
			
			response.sendRedirect("dovotes.jsp?id="+uid);
			
		}
		else{
			out.println("<h1>Login Error!</h1>");
			
		}
		
		if(con!= null)
			con.close();
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	finally{
		try{
			if(con!= null)
				con.close();
			
		}
		catch(Exception se)
		{
			se.printStackTrace();
			
		}
	}
	
	



%>
</center>
</body>
</html>