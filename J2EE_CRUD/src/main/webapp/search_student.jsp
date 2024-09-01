<!-- 
				if(data.length >= 1)
				{
					let html = "";
					for (let i = 0; i < data.length; i++) {
						html +=	  '<tr>'
									+'<td>'+ data[i].id +'</td>'
									+'<td>'+ data[i].name +'</td>'
									+'<td>'+ data[i].dob +'</td>'
									+'<td>'+ data[i].address +'</td>'
									+'<td>'+ data[i].qualification +'</td>'
									+'<td>'+ data[i].email +'</td>'
									+'<td><a href = edit_student.jsp?id='+ data[i].id +'>Edit Student</a></td>'
									+'<td><a href = delete?id='+ data[i].id +'>Delete Student</a></td>'
									+'</tr>'
						}
					document.getElementById("addList").innerHTML = html;
				}
				else{
					
					document.getElementById("addList").innerHTML = "No Data Found";
				}
-->
			
			
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Student</title>
	<style>
	
		.agent-search_inputs_div{ display: flex;align-items: center;justify-content: space-between;width: 100%;margin-bottom: 20px;padding: 0 15px }
		.user-pin_row{ display: flex;align-items: end;flex-wrap: wrap; }
		
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script>


//---------- renderTable start ------------------
function renderTable() {
	let _name = document.querySelector("#name").value;

	
	 $.ajax({
        type: "post",
        url: "search",
        data: {"name": _name},
        success: function(data){
      	  
			console.log(data);
			loadDetails(data,"search");
									
        }
    })
      
	}
//---------- renderTable end ------------------	

//---------- deleteStudent start ------------------
function deleteStudent(_id) {
	let _name = document.querySelector("#name").value;

	
	 $.ajax({
        type: "get",
        url: "deleteFromSearch",
        data: {"id": _id},
        success: function(data){
      	  
			console.log(data);
			loadDetails(data,"delete");
									
        }
    })
      
	}
//---------- deleteStudent end ------------------	

//-------- loadDetails start ----------------------
function loadDetails(data,action){
	const rowsPerPage = 1; 
    let currentPage = 1; 
    
    if(data == null)
	{
    	const table = document.getElementById("myTable"); 
      
        // Clear existing table rows 
        table.innerHTML = 	`
						    <tr> 
						        	<th>Id</th>
									<th>Name</th>
									<th>DOB</th>
									<th>Address</th>
									<th>Qualification</th>
									<th>Email</th>
									<th colspan="2" align="center">Actions</th>
						    </tr> 
						    <tr>
				            <td id="noDataFound"></td>
				            </tr>
						`; 
		if(action === "search")
		{
    		document.getElementById("noDataFound").innerHTML = "No Data Found";
		}else{
			 const paginationContainer = document.getElementById("pagination"); 
		     paginationContainer.innerHTML = ""; 
			document.getElementById("noDataFound").innerHTML = "";
		}
	}
    else{
    function displayTable(page) { 
        const table = document.getElementById("myTable"); 
        const startIndex = (page - 1) * rowsPerPage; 
        const endIndex = startIndex + rowsPerPage; 
        const slicedData = data.slice(startIndex, endIndex); 

        // Clear existing table rows 
        table.innerHTML = 	`
						    <tr> 
						        	<th>Id</th>
									<th>Name</th>
									<th>DOB</th>
									<th>Address</th>
									<th>Qualification</th>
									<th>Email</th>
									<th colspan="2" align="center">Actions</th>
						    </tr> 
						   
						`; 

        // Add new rows to the table 
        slicedData.forEach(item => { 
            const row = table.insertRow(); 
            const idCell = row.insertCell(0); 
            const nameCell = row.insertCell(1); 
            const dobCell = row.insertCell(2); 
            const addressCell = row.insertCell(3); 
            const qualificationCell = row.insertCell(4); 
            const emailCell = row.insertCell(5);
            const editCell = row.insertCell(6); 
            const deleteCell = row.insertCell(7); 
            idCell.innerHTML = item.id;
            nameCell.innerHTML = item.name; 
            dobCell.innerHTML = item.dob;
            addressCell.innerHTML = item.address;
            qualificationCell.innerHTML = item.qualification; 
            emailCell.innerHTML = item.email; 
            editCell.innerHTML = '<a href = edit_student.jsp?id='+ item.id +'>Edit Student</a>';
            deleteCell.innerHTML = '<a onclick="deleteStudent('+ item.id +')">Delete Student</a>';
        }); 

        // Update pagination 
        updatePagination(page); 
    } 

    function updatePagination(currentPage) { 
        const pageCount = Math.ceil(data.length / rowsPerPage); 
        const paginationContainer = document.getElementById("pagination"); 
        paginationContainer.innerHTML = ""; 

        for (let i = 1; i <= pageCount; i++) { 
            const pageLink = document.createElement("a"); 
            pageLink.href = "#"; 
            pageLink.innerText = i; 
            pageLink.onclick = function () { 
                displayTable(i); 
            }; 
            if (i === currentPage) { 
                pageLink.style.fontWeight = "bold"; 
            } 
            paginationContainer.appendChild(pageLink); 
            paginationContainer.appendChild(document.createTextNode(" ")); 
        } 
    } 

    // Initial display 
    displayTable(currentPage); 
		
	}	
  }
//-----	loadDetails end ----------------



</script>

</head>
<body>
	<%@ include file = "navbar.jsp" %>
	<h1>Student Management System</h1>
			<div class="container">
			
				<div>
					<label for="">Enter Name</label>
					<input type="text" data-var='name' id="name" value="" class="lpay_input"></input> &ensp; <input type="button" onclick="renderTable()" value="Submit"></input>
				</div>
			
		<br>
				
					 <table border id="myTable">
				       <!-- <thead> -->
				            <tr>
				                <th>Id</th>
				                <th>Name</th>
				                <th>Dob</th>
				                <th>Address</th>
				                <th>Qualification</th>
				                <th>Email</th>
				                <th colspan="2" align="center">Actions</th>
				            </tr>
				            <tr>
				            <td id="noDataFound"></td>
				            </tr>
				            <div id="pagination"></div> 
				            
				      <!--   </thead> -->
				       <!--  <tbody id="addList">
				        	
				        </tbody> -->
				       
	    		</table>
					
				<!-- lpay_table	 -->
			</div>
			<!-- /.col-md-12 -->
		

<br>




</body>
</html>