<%@page import="java.sql.*,java.io.*,java.text.*,java.util.*" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Image</title>
</head>
<body>
<h1 style = "color:red" align="center">Display Image</h1>
<div align = "center">
<form action = "viewpictures" method = "post">
	Enter Image Id: <input type = "text" name= "imageId">
	<input type = "submit" value = "Display Image">


</form>
<hr>
<%
	String imgFileName = (String)request.getAttribute("img");
	String imgId = (String)request.getAttribute("id");
	System.out.println(imgFileName);
%>
<div align = "center">
	<table border style="width:600px">
	<tr>
	<th>Image Id</th>
	<th>Image</th>
	</tr>
	<%
		if(imgFileName != "" && imgId != "")
		{	
	%>
	
	<tr>
	<td><%= imgId %> </td>
   <td><img src = "images/<%= imgFileName %>"></td>
<%--<% out.println("<td><img src='C:/Users/Swapnil/eclipse-workspace/ImageTutorial/src/main/webapp/WEB-INF/images/" + imgFileName + "'></td>");%> --%>
	</tr>
	<%
		}
	%>
	</table>

	

</div>
</div>
</body>
</html>