<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
JSP Tags:

1. Scriptlet Tag: some Java code -->
	<% 
		int i=1;
		out.println(i);
		out.println("</br>");
	%>
	
<!--  	
2. Expression Tag: an expression -->
	<%= i%>
	</br>
	<p>Current Date is : <%= new Date().toString() %>
	</br>
	
<!--  
3.Declaration Tag: variable declaration
				   & method definition    -->
	<%! 
		int j = 1;
		int k = 2;
		int sum()
		{
			return j+k;
		}
		%>
			<%
			out.println(sum());
			out.println("</br>");
			%>

<!--  
4. Directive Tag: directive		
				  are of three types 
	i) Page Directive:      
	   contentType="text/html"
	   import=""
		isErrorPage = "true"
		session="false" // using this we can disable session
		extends=""
	
	ii) Include Directive:
		 file="header.jsp" // using this we can include jsp or html file
	
	iii) Taglib Directive:
		It is used when we want to use other
		tag library in our JSP Page.
		such as JSTL (JSP Standard Tag Library)
		or custom Library created by users.	       
	
	
	
	 -->
	
		
<!--  		
5. Comment Tag: any Text                 -->
			<%// any Text %>
			
			

	
	









</body>
</html>