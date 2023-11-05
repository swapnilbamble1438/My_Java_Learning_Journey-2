<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<link rel="stylesheet" href = "css/style.css">

</head>
<body>
<%@ include file = "navbar.jsp" %>
<%@ include file = "msgcookie.jsp" %>
<%@ include file = "killcookie.jsp" %>

<div class = "center">
<div class="container">

<form action = "checkAdmin" method = "post">

<h1>Admin Login</h1>
<%
if(msg != null)
{%>
<p style="color: red"><%=msg %></p>
<% }%>

<%
if(logoutmsg != null)
{%>
<p style="color: red"><%=logoutmsg %></p>
<% }%>

User Name: <input type = "text" name = "name"><br><br>

Password: <input type = "password" name= "password"><br><br>

<input type = "submit" value="Login">

</form>

</div>
</div>

</body>
</html>