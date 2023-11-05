<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Image</title>
</head>
<body>
<h1 style = "color:red" align="center">Add Image Detail</h1>
<div align = "center">

<form action = "A2_putimage" method = "post" enctype = "multipart/form-data">
	imgId: <input type = "number" name = "imgId">
	<br>
	Select Image: <input type = "file" name = "img">
	<br>
	<input type = "submit" value="Upload">


</form>
</div>

</body>
</html>