<%@page import="com.entity.Student"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="" method= "post">

	<%@ include file = "navbar.jsp" %>
	
	<h1>Student Management System</h1>
	
	<div class = "container">
		<h2>All Student Details</h2>
		
		<table border>
		<thead>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>DOB</th>
				<th>Address</th>
				<th>Qualification</th>
				<th>Email</th>
				<th colspan="2" align="center">Actions</th>
			</tr>
		</thead>
		<tbodY>
		
		<%
			StudentDAO dao = new StudentDAO(DBConnect.getConn());
			List<Student> list = dao.getAllStudent();
			for(Student s : list)
			{%>
			<tr>
				<td><%= s.getId() %></td>
				<td><%= s.getName() %></td>
				<td><%= s.getDob() %></td>
				<td><%= s.getAddress() %></td>
				<td><%= s.getQualification() %></td>
				<td><%= s.getEmail() %></td>
				<td> <a href = edit_student.jsp?id=<%=s.getId() %>>Edit Student</a></td>
				<td><a href = delete?id=<%=s.getId() %>>Delete Student</a></td>
			</tr>
			<%}
		%>
		
		
		</tbodY>
		</table>
	</div>
	
	
</form>	
</body>
</html>