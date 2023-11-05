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
<form action = "adduser.jsp">

<h1>Registration</h1>

User Name: <input type = "text" name = "txtUID"><br><br>

Password: <input type = "password" name= "txtPWD"><br><br>

Email Id: <input type = "text" name= "txtEMAIL"><br><br>

Phone No: <input type = "number" name= "txtPNO"><br><br>


<input type = "submit" value="Signup">
</center>
</form>
</body>
</html>