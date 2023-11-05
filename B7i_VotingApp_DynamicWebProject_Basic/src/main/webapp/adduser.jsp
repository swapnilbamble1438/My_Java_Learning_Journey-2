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
<%@ include file = "navbar.jsp" %>

<center>
<%
String uid = request.getParameter("txtUID");
String pwd = request.getParameter("txtPWD");
String email = request.getParameter("txtEMAIL");

String pno = request.getParameter("txtPNO");

out.println(uid);
out.println(pwd);
out.println(email);
out.println(pno);


%>

    <%
    
    Connection con = null;
	PreparedStatement ps = null;
	try{
		Class.forName("org.sqlite.JDBC");
		con = DriverManager.getConnection("jdbc:sqlite:C:/Users/Swapnil/eclipse-workspace/Assignment_old/dtclass.db");
	//	con = DriverManager.getConnection("jdbc:sqlite:dtclass.db");
		String sql = "select * from tbl_Login where userid='"+ uid +"'";
		
		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		if(rs.next())
		{
			
			out.println("<h1>Name Already Registered</h1> ");
			
		}
		
		
		if(uid == null)
		{
			out.println("<h1>Please enter Registration details<h1>");
		}
	
		else{
		try{
			Class.forName("org.sqlite.JDBC");
			con = DriverManager.getConnection("jdbc:sqlite:C:/Users/Swapnil/eclipse-workspace/Assignment_old/dtclass.db");
		//	con = DriverManager.getConnection("jdbc:sqlite:dtclass.db");
			String sql2 = "insert into tbl_Login values(?,?,?,?)";
			
			 ps=con.prepareStatement(sql2);
	         ps.setString(1,uid);
	         ps.setString(2, pwd);
	         ps.setString(3, email);
	         ps.setString(4, pno);
	        
	        
	        

	 			int i = ps.executeUpdate();
	 				if(i > 0)
	 				{
	 					
	 					response.sendRedirect("adduserpass.jsp");
	 				}
	 			
	 			else
	 				out.println("error!");

	      }catch(Exception ex){
	          out.println(ex.getMessage());
	         } 
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