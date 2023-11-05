<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
try{
  String id=request.getParameter("id");
  

	Connection con = null;
	PreparedStatement ps = null;
Class.forName("org.sqlite.JDBC");
con = DriverManager.getConnection("jdbc:sqlite:C:/Users/Swapnil/eclipse-workspace/Assignment_old/dtclass.db");
ps=con.prepareStatement("delete from Candidates where Candidate_2 ='"+id+"'");
ps.executeUpdate();
response.sendRedirect("candidatesvotes.jsp");
}catch(Exception ex){	
	out.println(ex.getMessage());}

%>

</body>
</html>