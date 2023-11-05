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
String uid = request.getParameter("uid");
String Candidate = request.getParameter("Candidates");

// out.println(uid);
// out.println(Candidate);

%>

    <%
    
    Connection con = null;
	PreparedStatement ps = null;
	try{
		Class.forName("org.sqlite.JDBC");
		con = DriverManager.getConnection("jdbc:sqlite:C:/Users/Swapnil/eclipse-workspace/Assignment_old/dtclass.db");
	//	con = DriverManager.getConnection("jdbc:sqlite:dtclass.db");
		String sql = "select * from Candidates where Candidate_1='"+ uid +"' or Candidate_2='"+ uid +"' or Candidate_3='"+ uid +"' or Candidate_4='"+ uid +"'";
		
		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		if(rs.next())
		{
			
			out.println("<h1>Already voted</h1>");
			
		}
		
		
		else{
			try{
				Class.forName("org.sqlite.JDBC");
				con = DriverManager.getConnection("jdbc:sqlite:C:/Users/Swapnil/eclipse-workspace/Assignment_old/dtclass.db");
			
				String sql2 = "insert into Candidates('"+ Candidate +"') values(?)";
				
				 ps=con.prepareStatement(sql2);
		         ps.setString(1,uid);
		         
		        
		        
		        

		 			int i = ps.executeUpdate();
		 				if(i > 0)
		 				{
		 					
		 					out.println("<h1>Voted Successfully</h1>");
		 				}
		 			
		 			else
		 				out.println("<h1>Voting Error!</h1>");

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