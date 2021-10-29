<%@page import="application.SchoolApp"%>
<%@page import="classes.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String username = request.getParameter("username");
	String pwd = request.getParameter("password");
	Boolean flag= false;
	session.setAttribute("flag", flag);
	if(username.equalsIgnoreCase("admin") && pwd.equalsIgnoreCase("admin")) {
		flag= true;
		session.setAttribute("flag", flag);
		response.sendRedirect("home.jsp");
	} 
	else {
		User user = SchoolApp.userDatabase.stream().filter(u->u.getEmail().equals(username) && u.getPassword().equals(pwd)).findFirst().orElse(null);
		if(user != null) {
			session.setAttribute("currentUser", user);
			response.sendRedirect("home.jsp");
		}
		else { %>
			<script>
				alert("Incorrect email or password.")
				window.history.back();
			</script>	
<%		}
	}
%>