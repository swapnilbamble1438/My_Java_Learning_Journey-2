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
	 public int Factorial(int x)
	{ 
		int f = 1;
		for(int i = 1; i <= x; i++)
		{
		f = f* i;
		}
		return f;
  }
%>
 <% out.print("Factorial of 5 is " + Factorial(5)); %>
 
 <h1>Factorial of 6 is <%=Factorial(6) %></h1>
</body>
</html>