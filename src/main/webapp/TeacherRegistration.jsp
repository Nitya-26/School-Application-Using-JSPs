<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Teacher Registration</title>
<meta name="viewport" content="width=device-width, initial-scale=1">  
<style>  
body{  
  font-family: Calibri, Helvetica, sans-serif;  
  background-color: pink;  
}  
.container {  
    padding: 50px;  
  background-color: lightblue;  
}  
  
input[type=text], input[type=password], textarea {  
  width: 100%;  
  padding: 15px;  
  margin: 5px 0 22px 0;  
  display: inline-block;  
  border: none;  
  background: #f1f1f1;  
}  
input[type=text]:focus, input[type=password]:focus {  
  background-color: orange;  
  outline: none;  
}  
 div {  
            padding: 10px 0;  
         }  
hr {  
  border: 1px solid #f1f1f1;  
  margin-bottom: 25px;  
}  
.registerbtn {  
  background-color: #4CAF50;  
  color: white;  
  padding: 16px 20px;  
  margin: 8px 0;  
  border: none;  
  cursor: pointer;  
  width: 28%;  
  opacity: 0.9;  
}
.resetbtn {  
  background-color: #5bb4de;  
  color: white;  
  padding: 16px 20px;  
  margin: 8px 0;  
  border: none;  
  cursor: pointer;  
  width: 28%;  
  opacity: 0.9;  
}  
.backbtn {  
  background-color: #0568fc ;  
  color: black;  
  padding: 16px 20px;  
  margin: 8px 0;  
  border: none;  
  cursor: pointer;  
  width: 28%;  
  opacity: 0.9;  
}  
.registerbtn:hover {  
  opacity: 1;  
}  
</style>

<script type="text/javascript">
function myFunction(x) {
	if (x.type === "password") {
		x.type = "text";
	} else {
		x.type = "password";
	}
}

function matchPassword() {
	var pw1 = document.getElementById("myInput1").value;
	var pw2 = document.getElementById("myInput2").value;
	if(pw1 != pw2) {
		alert("Passwords do not match");
	}
	else {
		var pattern =  /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
		if(!(pw1.match(pattern))) {
			alert("password should contain a uppercase, a lower case alphabet and an integer also with a special character with atleast length of 8");
		}
	}
}
</script>
  
</head>
<body>  
<%
	String str = "teacher"; 
	session.setAttribute("userRole", str);
%>
<form method="post" name ="form" action="adduser.jsp">  
  <div class="container">  
    <h1> Teacher Registration Form</h1>  
  <hr> 
<label> First Name </label> 
<input type="text" name="firstname" placeholder= "Enter Firstname" size="15" required />
<label> Last Name </label>    
<input type="text" name="lastname" placeholder="Enter Lastname" size="15"required />   
<label> Middle Name </label>   
<input type="text" name="middlename" placeholder="Enter Middlename" size="15"  />    

<label>Date of Birth </label>
 <input type="text" name="dob" placeholder="DD-MMM-YYYY" size="15" required/>  <br>

<label for="email">Email </label>  
 <input type="text" placeholder="Enter Email ID" name="email" required> 

<label for="password">Password</label>
 <input type="password" placeholder="Enter Password" name="pwd1" id="myInput1" required>
<input type="checkbox" onclick="myFunction(document.form.pwd1)">Show Password <br> <br>
<label for="password">Confirm Password</label>
 <input type="password" placeholder="Confirm Password" name="pwd2" id="myInput2" onchange="matchPassword()" required>
<input type="checkbox" onclick="myFunction(document.form.pwd2)">Show Password <br> <br> 
<label> Contact Number</label>   
<input type="text" name="phone" placeholder="Enter 10 digit phone number" size="10" required>   
<div>  
<label>Gender</label><br> <br>
<input type="radio" value="Male" name="gender" checked > Male
<input type="radio" value="Female" name="gender"> Female
</div> <br> 
<label> Current Address </label> <br>
<textarea name="address" cols="80" rows="3" placeholder="Enter Current Address" required="required"></textarea>  <br> 

<label> Subject </label>    
<input type="text" name="subject" placeholder="Enter the Subject" size="15"required /> <br>
<button type="submit" class="registerbtn">Register</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<button type="reset" class="resetbtn">Clear</button>   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<button type="button" onclick="history.back()" class="backbtn">Go back! </button>
   </div>
</form>  
</body>  
</html>  