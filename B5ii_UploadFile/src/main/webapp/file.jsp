<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<form action = "AddEmployee.jsp" method = "post" enctype = "multipart/form-data">
<table border=2>
        <tr>
        	<td>Employee Id</td>
        	<td><input type="number" name="eid" required/></td>
        </tr>
        <tr>
        	<td>Employee Name</td>
        	<td><input type="text" name="ename" required/></td>
        </tr>
        <tr>
        	<td>Select Profile Pic to upload:</td> 
         	<td><input type = "file" name = "file1" size = "50" required /></td>
         </tr>
         <tr>
         	<td colspan="2" align="center"><input type = "submit" value = "Upload File" /></td>
         </tr>
    
</table>
  </form>
</center>
</body>
</html>