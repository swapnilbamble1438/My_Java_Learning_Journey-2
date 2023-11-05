<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<link rel="stylesheet" href = "css/style.css">




</head>
<body>

<%@ include file = "navbar.jsp" %>
<%@ include file = "killcookie.jsp" %>

<div class="center">
<div class="container" >

<%
if(logoutmsg != null)
{%>
<p style="color: red"><%=logoutmsg %></p>
<% }%>


<h1>Voting Application</h1>


</div>
</div>
</body>
</html>