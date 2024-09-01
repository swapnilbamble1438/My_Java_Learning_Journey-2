<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "register" method = "post">

<%@ include file = "navbar.jsp" %>

<h1>Add Student</h1>

<!-- id <input type = "number" name = "id" required><br><br>  -->

Full Name <input type = "text" name = "name" required><br><br>

Date of Birth <input type = "date" name = "dob" required><br><br>

Address <input type = "text" name = "address" required><br><br>

Qualification <input type = "text" name = "qualification" required><br><br>

Email <input type = "email" name = "email" required><br><br>

<input type = "submit">



</form>
</body>
</html>