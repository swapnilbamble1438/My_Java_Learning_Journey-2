<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload page</title>
</head>
<body>
	<form action ="UploadServlet" method = "post" enctype = "multipart/form-data" name = "form1" id = "form1">
		<center>
			<table border>
				<tr>
					<td align = "center"><b>Multiple image upload</b></td>
				</tr>
				<tr>
					<td>
						Specify file: <input name = "file" type = "file" multiple>
					</td>
				</tr>
				<tr>
					<td align = "center">
						<input type = "submit" name = "Sumbit" value = "Submit Files">
					</td>
				</tr>
			</table>
		</center>
	</form>
	

</body>
</html>