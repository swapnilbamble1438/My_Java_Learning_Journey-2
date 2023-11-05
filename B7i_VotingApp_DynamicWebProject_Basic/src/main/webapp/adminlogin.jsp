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
<form action = "checkadmin.jsp">

<h1>Admin Login</h1>

Admin Name: <input type = "text" name = "txtUID"><br><br>

Password: <input type = "password" name= "txtPWD"><br><br>

<input type = "submit" value="Login">

</body>
</html>