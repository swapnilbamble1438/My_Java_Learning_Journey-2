
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container py-5 h-100">
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col-12 col-md-8 col-lg-6 col-xl-5">
				<div class="card bg-dark text-white" style="border-radius: 1rem;">
					<form method="post" action="addproduct" enctype="multipart/form-data" class="card-body p-5 text-center">
						
						Select Brand <select name="bid" class="form-control form-control-sm">
							
							    <option>samsung</option>
							    <option>sony</option>
							    <option>lenovo</option>
							    <option>acer</option>
							    <option>onida</option>
							 


						</select> 
						<br> 
						Select Category <select name="cid" class="form-control form-control-sm">
							
							    <option>laptop</option>
							    <option>tv</option>
							    <option>mobile</option>
							    <option>watch</option>
							    
						</select>
						<br> 
						Product Name:<input type=text class="form-control form-control-sm" name="pname">
						<br>
						Product Price:<input type=number class="form-control form-control-sm" name="pprice">
						<br>
						Quantity:<input type=number class="form-control form-control-sm" name="pqty">
						<br> 
						Product Image:<input type=file class="form-control form-control-sm" name="pimage">
						<br>
						<input type=submit value="Add Product" class="btn btn-outline-light btn-lg px-5">
					
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>