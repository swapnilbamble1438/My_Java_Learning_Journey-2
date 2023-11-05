<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page P1</title>
</head>
<body>
<%@ include file = "navbar.jsp" %>
<center>
<form action = "checklogin.jsp">

<h1>Login</h1>

User Name: <input type = "text" name = "txtUID"><br><br>

Password: <input type = "password" name= "txtPWD"><br><br>

<input type = "submit" value="Login">

</center>
</form>
</body>
</html>