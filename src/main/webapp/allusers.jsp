<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.sun.mail.imap.protocol.Item"%>
<%@page import="java.util.Date"%>
<%@page import="application.SchoolApp"%>
<%@page import="java.util.List"%>
<%@page import="classes.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="menu.UserRegistration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Users</title>
<style type="text/css">
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

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

body {
  font-family: Arial;
  text-align: center;
}

* {
  box-sizing: border-box;
}

form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}

* {
  box-sizing: border-box;
}

#myInput {
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

</style>

<script>
function myFunction() {
  var input, filter, table, tr, td, i, j, txtValue;
  var firstName, lastname;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
	for (i = 0; i < tr.length; i++) {
		for (j = 1; j < 11; j++) {
			td = tr[i].getElementsByTagName("td")[j];
			if (td) {
				txtValue = td.textContent || td.innerText;
				if (txtValue.toUpperCase().includes(filter)) {
					tr[i].style.display = "";
					break;
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
}
</script>

</head>

<body> <br> <br>
<div class="vertical-menu">
  <a href="home.jsp" class="active">Home</a>
</div>
<br> <br>

<% 
	if(SchoolApp.userDatabase.isEmpty()) { %>
		<h1>No Users Available</h1>
<% 	} else { %>

<input type="text" id="myInput" placeholder="Search for users.." title="Type in a name"> <br>
<input type="submit" value="Search" onclick="myFunction()"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<button onClick="window.location.reload();">Clear Search</button> <br> <br>
		<table id="myTable">
  			<tr>
    			<th>ID</th>
    			<th>First Name</th>
    			<th>Last Name</th>
    			<th>Middle Name</th>
    			<th>Date of Birth</th>
    			<th>Email</th>
    			<th>Phone Number</th>
    			<th>Gender</th>
    			<th>Address</th>
    			<th>Subject</th>
    			<th>Role</th>
  			</tr>
  
	<% 
		Boolean admin = (Boolean) session.getAttribute("flag");
		if(admin) { %>
			<c:forEach items="${SchoolApp.userDatabase}" var="item" varStatus="row">
				<c:set var="id" value="${row.index}"></c:set>
				<c:choose>
				<c:when test="${item.getRole().equalsIgnoreCase(\"student\")}">
					<tr>
	    				<td><a href="EditStudent.jsp?id=<%= pageContext.getAttribute("id")%>"><c:out value="${item.getId()}"/></a></td>
	    				<td><c:out value="${item.getFirstName().toUpperCase()}" /></td>
	    				<td><c:out value="${item.getLastName().toUpperCase()}" /></td>
	    				<td><c:out value="${item.getMiddleName().toUpperCase()}" /></td>
	    				<c:set var="dob" value="${item.getDateOfBirth()}" />
	    				<% Date date = (Date) pageContext.getAttribute("dob"); 
	    				   String dob = date.toString().substring(8, 10)+" / "+date.toString().substring(4, 7)+" / "+date.toString().substring(24, 28);%>
	    				<td><% out.print(dob); %></td>
	    				<td><c:out value="${item.getEmail().toUpperCase()}" /></td>
	    				<td><c:out value="${item.getPhoneNo()}" /></td>
	    				<td><c:out value="${item.getGender().toUpperCase()}" /></td>
	    				<td><c:out value="${item.getAddress().toUpperCase()}" /></td>
	    				<td>NA</td>
	    				<td><c:out value="${item.getRole().toUpperCase()}" /></td>
	  				</tr>
					</c:when>
					<c:otherwise>
					<tr>
						<c:set var="role" value="${item.getRole()}"></c:set>
						<% 	String role = (String) pageContext.getAttribute("role");
							if(role.equalsIgnoreCase("teacher")) { %>
							<td><a href="EditTeacher.jsp?id=<%= pageContext.getAttribute("id")%>"><c:out value="${item.getId()}" /></a></td>
						<%} else { %>
							<td><a href="EditHeadMaster.jsp?id=<%= pageContext.getAttribute("id")%>"><c:out value="${item.getId()}" /></a></td>
						<%} %>
    					<td><c:out value="${item.getFirstName().toUpperCase()}" /></td>
    					<td><c:out value="${item.getLastName().toUpperCase()}" /></td>
    					<td><c:out value="${item.getMiddleName().toUpperCase()}" /></td>
    					<c:set var="dob" value="${item.getDateOfBirth()}" />
	    				<% Date date = (Date) pageContext.getAttribute("dob"); 
	    				String dob = date.toString().substring(8, 10)+" / "+date.toString().substring(4, 7)+" / "+date.toString().substring(24, 28); %>
	    				<td><% out.print(dob); %></td>
    					<td><c:out value="${item.getEmail().toUpperCase()}" /></td>
    					<td><c:out value="${item.getPhoneNo()}" /></td>
    					<td><c:out value="${item.getGender().toUpperCase()}" /></td>
    					<td><c:out value="${item.getAddress().toUpperCase()}" /></td>
    					<td><c:out value="${item.getSubject().toUpperCase()}" /></td>
    					<td><c:out value="${item.getRole().toUpperCase()}" /></td>
  					</tr>
					</c:otherwise>
				</c:choose>
   				<br>
			</c:forEach>
	<%} else {
		User currUser = (User) session.getAttribute("currentUser");
		if(currUser.getRole().equalsIgnoreCase("headmaster")) { %>
			<c:forEach items="${SchoolApp.userDatabase}" var="item" varStatus="row">
				<c:set var="id" value="${row.index}"></c:set>
				<c:choose>
				<c:when test="${item.getRole().equalsIgnoreCase(\"student\")}">
					<tr>
	    				<td><a href="EditStudent.jsp?id=<%= pageContext.getAttribute("id")%>"><c:out value="${item.getId()}"/></a></td>
	    				<td><c:out value="${item.getFirstName().toUpperCase()}" /></td>
	    				<td><c:out value="${item.getLastName().toUpperCase()}" /></td>
	    				<td><c:out value="${item.getMiddleName().toUpperCase()}" /></td>
	    				<c:set var="dob" value="${item.getDateOfBirth()}" />
	    				<% Date date = (Date) pageContext.getAttribute("dob"); 
	    				   String dob = date.toString().substring(8, 10)+" / "+date.toString().substring(4, 7)+" / "+date.toString().substring(24, 28);%>
	    				<td><% out.print(dob); %></td>
	    				<td><c:out value="${item.getEmail().toUpperCase()}" /></td>
	    				<td><c:out value="${item.getPhoneNo()}" /></td>
	    				<td><c:out value="${item.getGender().toUpperCase()}" /></td>
	    				<td><c:out value="${item.getAddress().toUpperCase()}" /></td>
	    				<td>  </td>
	    				<td><c:out value="${item.getRole().toUpperCase()}" /></td>
	  				</tr>
					</c:when>
					<c:otherwise>
					<tr>
						<c:set var="role" value="${item.getRole()}"></c:set>
						<% 	String role = (String) pageContext.getAttribute("role");
							if(role.equalsIgnoreCase("teacher")) { %>
							<td><a href="EditTeacher.jsp?id=<%= pageContext.getAttribute("id")%>"><c:out value="${item.getId()}" /></a></td>
						<%} else { 
							if(currUser.getId() == (int) pageContext.getAttribute("id")+1) {%>
							<td><a href="EditHeadMaster.jsp?id=<%= pageContext.getAttribute("id")%>"><c:out value="${item.getId()}" /></a></td>
						<%} else { %>
							<td><c:out value="${item.getId()}" /></td>
						<%} }%>
    					<td><c:out value="${item.getFirstName().toUpperCase()}" /></td>
    					<td><c:out value="${item.getLastName().toUpperCase()}" /></td>
    					<td><c:out value="${item.getMiddleName().toUpperCase()}" /></td>
    					<c:set var="dob" value="${item.getDateOfBirth()}" />
	    				<% Date date = (Date) pageContext.getAttribute("dob"); 
	    				String dob = date.toString().substring(8, 10)+" / "+date.toString().substring(4, 7)+" / "+date.toString().substring(24, 28); %>
	    				<td><% out.print(dob); %></td>
    					<td><c:out value="${item.getEmail().toUpperCase()}" /></td>
    					<td><c:out value="${item.getPhoneNo()}" /></td>
    					<td><c:out value="${item.getGender().toUpperCase()}" /></td>
    					<td><c:out value="${item.getAddress().toUpperCase()}" /></td>
    					<td><c:out value="${item.getSubject().toUpperCase()}" /></td>
    					<td><c:out value="${item.getRole().toUpperCase()}" /></td>
  					</tr>
					</c:otherwise>
				</c:choose>
   				<br>
			</c:forEach>
	<% } else if(currUser.getRole().equalsIgnoreCase("teacher")) {%>
		<c:forEach items="${SchoolApp.userDatabase}" var="item" varStatus="row">
				<c:set var="id" value="${row.index}"></c:set>
				<c:choose>
				<c:when test="${item.getRole().equalsIgnoreCase(\"student\")}">
					<tr>
	    				<td><a href="EditStudent.jsp?id=<%= pageContext.getAttribute("id")%>"><c:out value="${item.getId()}"/></a></td>
	    				<td><c:out value="${item.getFirstName().toUpperCase()}" /></td>
	    				<td><c:out value="${item.getLastName().toUpperCase()}" /></td>
	    				<td><c:out value="${item.getMiddleName().toUpperCase()}" /></td>
	    				<c:set var="dob" value="${item.getDateOfBirth()}" />
	    				<% Date date = (Date) pageContext.getAttribute("dob"); 
	    				   String dob = date.toString().substring(8, 10)+" / "+date.toString().substring(4, 7)+" / "+date.toString().substring(24, 28);%>
	    				<td><% out.print(dob); %></td>
	    				<td><c:out value="${item.getEmail().toUpperCase()}" /></td>
	    				<td><c:out value="${item.getPhoneNo()}" /></td>
	    				<td><c:out value="${item.getGender().toUpperCase()}" /></td>
	    				<td><c:out value="${item.getAddress().toUpperCase()}" /></td>
	    				<td>  </td>
	    				<td><c:out value="${item.getRole().toUpperCase()}" /></td>
	  				</tr>
					</c:when>
					<c:otherwise>
					<tr>
						<c:set var="role" value="${item.getRole()}"></c:set>
						<% 	String role = (String) pageContext.getAttribute("role");
							if(role.equalsIgnoreCase("teacher") && currUser.getId() == (int) pageContext.getAttribute("id")+1) { %>
								<td><a href="EditTeacher.jsp?id=<%= pageContext.getAttribute("id")%>"><c:out value="${item.getId()}" /></a></td>
						<%}  else { %>
							<td><c:out value="${item.getId()}" /></td>
						<%} %>
    					<td><c:out value="${item.getFirstName().toUpperCase()}" /></td>
    					<td><c:out value="${item.getLastName().toUpperCase()}" /></td>
    					<td><c:out value="${item.getMiddleName().toUpperCase()}" /></td>
    					<c:set var="dob" value="${item.getDateOfBirth()}" />
	    				<% Date date = (Date) pageContext.getAttribute("dob"); 
	    				String dob = date.toString().substring(8, 10)+" / "+date.toString().substring(4, 7)+" / "+date.toString().substring(24, 28); %>
	    				<td><% out.print(dob); %></td>
    					<td><c:out value="${item.getEmail().toUpperCase()}" /></td>
    					<td><c:out value="${item.getPhoneNo()}" /></td>
    					<td><c:out value="${item.getGender().toUpperCase()}" /></td>
    					<td><c:out value="${item.getAddress().toUpperCase()}" /></td>
    					<td><c:out value="${item.getSubject().toUpperCase()}" /></td>
    					<td><c:out value="${item.getRole().toUpperCase()}" /></td>
  					</tr>
					</c:otherwise>
				</c:choose>
   				<br>
			</c:forEach>
		<%} else { %>
			<c:forEach items="${SchoolApp.userDatabase}" var="item" varStatus="row">
				<c:set var="id" value="${row.index}"></c:set>
				<c:choose>
				<c:when test="${item.getRole().equalsIgnoreCase(\"student\")}">
					<tr>
						<% if(currUser.getId() == (int) pageContext.getAttribute("id")+1) { %>
	    					<td><a href="EditStudent.jsp?id=<%= pageContext.getAttribute("id")%>"><c:out value="${item.getId()}"/></a></td>
	    				<%} else { %>
	    					<td><c:out value="${item.getId()}"/></td>
	    				<%} %>
	    				<td><c:out value="${item.getFirstName().toUpperCase()}" /></td>
	    				<td><c:out value="${item.getLastName().toUpperCase()}" /></td>
	    				<td><c:out value="${item.getMiddleName().toUpperCase()}" /></td>
	    				<c:set var="dob" value="${item.getDateOfBirth()}" />
	    				<% Date date = (Date) pageContext.getAttribute("dob"); 
	    				   String dob = date.toString().substring(8, 10)+" / "+date.toString().substring(4, 7)+" / "+date.toString().substring(24, 28);%>
	    				<td><% out.print(dob); %></td>
	    				<td><c:out value="${item.getEmail().toUpperCase()}" /></td>
	    				<td><c:out value="${item.getPhoneNo()}" /></td>
	    				<td><c:out value="${item.getGender().toUpperCase()}" /></td>
	    				<td><c:out value="${item.getAddress().toUpperCase()}" /></td>
	    				<td>  </td>
	    				<td><c:out value="${item.getRole().toUpperCase()}" /></td>
	  				</tr>
					</c:when>
					<c:otherwise>
					<tr>
						<td><c:out value="${item.getId()}" /></td>
    					<td><c:out value="${item.getFirstName().toUpperCase()}" /></td>
    					<td><c:out value="${item.getLastName().toUpperCase()}" /></td>
    					<td><c:out value="${item.getMiddleName().toUpperCase()}" /></td>
    					<c:set var="dob" value="${item.getDateOfBirth()}" />
	    				<% Date date = (Date) pageContext.getAttribute("dob"); 
	    				String dob = date.toString().substring(8, 10)+" / "+date.toString().substring(4, 7)+" / "+date.toString().substring(24, 28); %>
	    				<td><% out.print(dob); %></td>
    					<td><c:out value="${item.getEmail().toUpperCase()}" /></td>
    					<td><c:out value="${item.getPhoneNo()}" /></td>
    					<td><c:out value="${item.getGender().toUpperCase()}" /></td>
    					<td><c:out value="${item.getAddress().toUpperCase()}" /></td>
    					<td><c:out value="${item.getSubject().toUpperCase()}" /></td>
    					<td><c:out value="${item.getRole().toUpperCase()}" /></td>
  					</tr>
					</c:otherwise>
				</c:choose>
   				<br>
			</c:forEach>
		<%} %>
</table>
<% 	} } %>
</body>
</html>