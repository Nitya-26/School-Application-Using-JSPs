<%@page import="classes.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #1d2569;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 20px 40px;
  text-decoration: none;
  font-size: 25px;
  font-family: Arial, Helvetica, sans-serif;
}

li a:hover:not(.active) {
  background-color: #04AA6D;
}


.active {
  background-color: #04AA6D;
}

h1 {
	border: 1px solid #c3c3c3;
	color: white;
	text-align: center;
	background-color: black;
}

</style>

<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
<h1><b>Welcome to School Application</b></h1>

<% 
	Boolean admin = (Boolean) session.getAttribute("flag");
	if(admin) { %>
		<div><h1>Welcome Admin</h1></div>
		<ul>
  			<li><a href="registration.jsp">Registrations</a></li>
  			<li><a href="allusers.jsp">All Users</a></li>
  			<li style="float:right"><a class="active" href="logout.jsp">Logout</a></li>
		</ul>
<%	} else {
		User currUser = (User) session.getAttribute("currentUser"); %>
		<h1><% out.print("Welcome " +currUser.getFirstName() + " " + currUser.getLastName());%></h1>
		<%if(currUser.getRole().equalsIgnoreCase("headmaster") || currUser.getRole().equalsIgnoreCase("teacher")) { %>
			<ul>
  				<li><a href="registration.jsp">Registrations</a></li>
  				<li><a href="allusers.jsp">All Users</a></li>
  				<li style="float:right"><a class="active" href="logout.jsp">Logout</a></li>
			</ul>
<%		} 
		else if(currUser.getRole().equalsIgnoreCase("student")) { %>
			<ul>
				<li><a href="allusers.jsp">All Users</a></li>
				<li style="float:right"><a class="active" href="logout.jsp">Logout</a></li>
			</ul>
<% } }%>

<img src = "assets/school1.jpg" alt="School" height="825" width="1903"> 

</body>
</html>



