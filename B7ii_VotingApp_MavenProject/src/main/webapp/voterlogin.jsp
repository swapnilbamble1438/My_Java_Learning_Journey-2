<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Voter Login</title>
<link rel="stylesheet" href = "css/style.css">

</head>
<body>
<%@ include file = "navbar.jsp" %>
<%@ include file = "msgcookie.jsp" %>
<%@ include file = "killcookie.jsp" %>


<div class = "center">
<div class="container">

<form action = "checkVoters" method = "post">

<h1>Voter Login</h1>
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


Email Id: <input type = "text" name = "email"><br><br>

Password: <input type = "password" name= "password"><br><br>

<input type = "submit" value="Login">

</form>

</div>
</div>

</body>
</html>