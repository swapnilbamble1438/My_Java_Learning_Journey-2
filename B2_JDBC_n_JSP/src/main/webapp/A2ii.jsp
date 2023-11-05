<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
int i = 5;
int b = 6;

 public int sum()
 {
	return i + b;
 }
%>
	<% 
out.println(sum());
%>

</body>
</html>