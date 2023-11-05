<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
int no = Integer.parseInt(request.getParameter("no"));

if(no % 2 == 0){
		out.print(no + " is Even Number");}
	else{
	out.print(no + " is Odd Number");}
%>
</body>
</html>