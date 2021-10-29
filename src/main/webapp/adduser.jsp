<%@page import="classes.HeadMaster"%>
<%@page import="classes.Teacher"%>
<%@page import="menu.ValidationsUtils"%>
<%@page import="application.SchoolApp"%>
<%@page import="classes.Student"%>
<%@page import="classes.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Status</title>
<style type="text/css">
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

footer {
    position: absolute;
    bottom: 100px;
    left: 50px;
    height: 35px;
    margin: 0px 50px 0px 0px;
    color: #000;
    text-align: right;
    padding: 10px 30px;
}

.alert {
  padding: 20px;
  background-color: #f44336;
  color: white;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}

</style>
</head>
<body>
<br> <br>
<div class="vertical-menu">
  <a href="home.html" class="active">Home</a>
</div>
<br> <br>

<%String firstName = request.getParameter("firstname");
String lastName = request.getParameter("lastname");
String middleName = request.getParameter("middlename");
String date = request.getParameter("dob");
Date dateOfBirth = new SimpleDateFormat("dd-MMM-yyyy").parse(date); 
String email = request.getParameter("email");
String password = request.getParameter("pwd1");
String confirmPassword = request.getParameter("pwd2");
String phoneNo = request.getParameter("phone");
String gender = request.getParameter("gender");
String address = request.getParameter("address");

String role = (String) session.getAttribute("userRole");

User user = null;


if(role.equalsIgnoreCase("student")) {
	user = new Student(firstName, lastName, middleName, dateOfBirth, email, password, phoneNo, gender, address, role);
} else if(role.equalsIgnoreCase("teacher")) {
	String subject = request.getParameter("subject");
	user = new Teacher(firstName, lastName, middleName, dateOfBirth, email, password, phoneNo, gender, address, role, subject);
} else if(role.equalsIgnoreCase("headmaster")) {
	String subject = request.getParameter("subject");
	user = new HeadMaster(firstName, lastName, middleName, dateOfBirth, email, password, phoneNo, gender, address, role, subject);
}

if(SchoolApp.userDatabase.isEmpty()) {
	user.setId(1);
} else {
	user.setId(SchoolApp.userDatabase.size()+1);
}

ValidationsUtils validationsUtils = new ValidationsUtils();
if((validationsUtils.checkEmailDuplicate(email)) && (validationsUtils.checkPhoneDuplicate(phoneNo))){
	SchoolApp.userDatabase.add(user); 
	response.sendRedirect("allusers.jsp");
	%>
<% } else { %>

<div class="alert">
  <span class="closebtn" onclick="javascript:history.back()">&times;</span> 
  <strong>User Already Exists!</strong> Try Again!!!.
</div>
<% }%>

<!--  
<footer>
  <p><a href="javascript:history.back()">Go Back</a></p>
</footer>
-->
</body>
</html>