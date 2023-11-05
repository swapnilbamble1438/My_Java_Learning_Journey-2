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
<%@ include file="ValidateLogin2.jsp" %>
<%

out.println(N);
String id=request.getParameter("id");
String ie=request.getParameter("ie");
String ig=request.getParameter("ig");
String ihstr=request.getParameter("ih");
int ih = Integer.parseInt(ihstr);
String iistr =request.getParameter("ii");
int ii = Integer.parseInt(iistr);
String ij=request.getParameter("ij");
out.println("id: " +id +" ie: "+ ie + " ig: " + ig + " ih: " + ih + " ii: " + ii + " ij: " + ij );
try{
    Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/imagetableold","root","root");
   PreparedStatement ps=con.prepareStatement("insert into cart values(?,?,?,?,?,?,?)");
   ps.setString(1,N);
   ps.setString(2,id);
	ps.setString(3,ie);
	ps.setString(4,ig);
	   ps.setInt(5, ih);
	   ps.setInt(6, ii);
	ps.setString(7,ij);

   ps.executeUpdate();
   out.println("<h1>Record is added successfully</h1>");
   }catch(Exception ex){
   out.println(ex.getMessage());
   }


%>
	


</body>
</html>