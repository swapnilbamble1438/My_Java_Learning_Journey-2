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
<%@ include file = "adminnavbar.jsp" %>
<%@ include file = "checkadmincookie.jsp" %>
<%@ include file = "msgcookie.jsp" %>

<div class = "center">
<div class="container">

<form action = "" method ="get">



<div class="container" style="background-color: white">




<!--  -->
<div class="container" id="cb" style="background-color: white">
<h1>All Candidates Votes</h1>

<%
int c1vote=0;
int c2vote=0;
int c3vote=0;
int c4vote=0;

CandidatesDAO dao = new CandidatesDAO(DBConnect.getConn());		
List<Candidates> list = dao.getCandidates();

for(Candidates l : list)
	
  {
	if(l.getCandidate1() != null)
	{
		c1vote++;
	}
	if(l.getCandidate2() != null)
	{
		c2vote++;
	}
	if(l.getCandidate3() != null)
	{
		c3vote++;
	}
	if(l.getCandidate4() != null)
	{
		c4vote++;
	}
  
  
  
  } %>
	
		<h3>Candidate 1 : Total Votes = <b style="color: limegreen"><%= c1vote  %></b></h3>
		<h3>Candidate 2 : Total Votes = <b style="color: limegreen"><%=c2vote %></b></h3>
		<h3>Candidate 3 : Total Votes = <b style="color: limegreen"><%=c3vote  %></b></h3>
		<h3>Candidate 4 : Total Votes = <b style="color: limegreen"><%=c4vote  %></b></h3>
		
		
		
		
	
	
</div>	

<!--  -->



</form>
</div>
</div>

</body>
</html>