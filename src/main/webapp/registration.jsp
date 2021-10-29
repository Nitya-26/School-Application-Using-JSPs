<%@page import="classes.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registrations</title>

<style>
.vertical-menu {
  width: 200px;
}

.vertical-menu a {
  background-color: #eee;
  color: black;
  display: block;
  padding: 12px;
  text-align: center;
  text-decoration: blink;
  height: 80px;
  width: 1888px;
  font-size: 30px;
}

.vertical-menu a:hover {
  background-color: #ccc;
}

.vertical-menu a.active {
  background-color: #04AA6D;
  color: white;
}
</style>
</head>
<body>
<h1>Registrations</h1>
<div class="vertical-menu">
  <a href="home.jsp" class="active">Home</a>
  <%
  	Boolean admin = (Boolean) session.getAttribute("flag");
  	if(admin) { %>
  		<a href="StudentRegistration.jsp">Student Registration</a>
  		<a href="TeacherRegistration.jsp">Teacher Registration</a>
  		<a href="HeadMasterRegistration.jsp">HeadMaster Registration</a>
<% } else { 
	User currUser = (User) session.getAttribute("currentUser");
	if(currUser.getRole().equalsIgnoreCase("headmaster")) { %>
		<a href="StudentRegistration.jsp">Student Registration</a>
  		<a href="TeacherRegistration.jsp">Teacher Registration</a>
<%} else if(currUser.getRole().equalsIgnoreCase("teacher")) { %>
	<a href="StudentRegistration.jsp">Student Registration</a>
<% } } %>
</div>
</body>

</html>