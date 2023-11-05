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
<form action = "insertvote.jsp?">
<br>

	<%String uid= request.getParameter("id");
out.println(uid);
%>
<input value =<%=uid %> name = "uid" type="hidden" >
	do vote <br>
 <br>
 <input type="radio" name="Candidates"  value ="Candidate_1" >Candidate 1  <br><br>
  <input type="radio" name="Candidates"  value = "Candidate_2" >Candidate 2 <br><br>
  <input type="radio" name="Candidates"  value = "Candidate_3" >Candidate 3 <br><br>
  <input type="radio" name="Candidates"  value = "Candidate_4" >Candidate 4 <br><br>
    
    <br>
</select> 


    


<input type = "submit" value="Vote">

</form>
</center>
</body>
</html>