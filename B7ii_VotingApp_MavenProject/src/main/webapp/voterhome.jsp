<%@page import="com.entity.Candidates"%>
<%@page import="com.dao.CandidatesDAO"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.entity.Voters"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.VotersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Voter Login</title>
<link rel="stylesheet" href = "css/style.css">

</head>
<body>
<%@ include file = "voternavbar.jsp" %>
<%@ include file = "checkvotercookie.jsp" %>
<%@ include file = "msgcookie.jsp" %>

<div class = "center">
<div class="container">

<form action = "addCandidates" method ="post">



<div class="container" style="background-color: white">




<!--  -->
<% 	if(voter != null)
{%>
<h1 style="color: red">Welcome <%=voter %></h1>
<%} %>

	Do Voting<br>
	
<% 	if(msg != null)
{%>
<h1 style="color: red"><%=msg %></h1>
<%} %>
	<input value ="<%=voter %>" name = "voter" type="hidden" >
 <br>
 <input type="radio" name="Candidates"  value ="candidate1" >Candidate 1  <br><br>
  <input type="radio" name="Candidates"  value = "candidate2" >Candidate 2 <br><br>
  <input type="radio" name="Candidates"  value = "candidate3" >Candidate 3 <br><br>
  <input type="radio" name="Candidates"  value = "candidate4" >Candidate 4 <br><br>
    
    <br>
 


<input type = "submit" value="Vote">

<!--  -->



</form>
</div>
</div>

</body>
</html>