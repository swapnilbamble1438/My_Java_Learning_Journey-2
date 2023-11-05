<%@page import="com.entity.Student"%>
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
<form action = "update" method = "post">

	<%@ include file = "navbar.jsp" %>
	
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		
		StudentDAO dao = new StudentDAO(DBConnect.getConn());
		
		Student s = dao.getStudentById(id);
		
	%>

<h1>Edit Student</h1>

id <input type = "number" name = "id" value ="<%=s.getId() %>" required><br><br>

Full Name <input type = "text" name = "name" value ="<%=s.getName() %>" required><br><br>

Date of Birth <input type = "date" name = "dob" value ="<%=s.getDob() %>" required><br><br>

Address <input type = "text" name = "address" value ="<%=s.getAddress() %>" required><br><br>

Qualification <input type = "text" name = "qualification" value ="<%=s.getQualification() %>" required><br><br>

Email <input type = "email" name = "email" value ="<%=s.getEmail() %>" required><br><br>


<input type = "hidden" name = "i"  value = "<%= s.getId() %>">


<input type = "submit" value="Update">



</form>
</body>
</html>