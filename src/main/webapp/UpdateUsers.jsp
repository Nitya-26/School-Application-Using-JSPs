<%@page import="application.SchoolApp"%>
<%@page import="classes.Student"%>
<%@page import="classes.HeadMaster"%>
<%@page import="classes.Teacher"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="classes.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	User user = (User) session.getAttribute("user");
	Integer uId = user.getId();
	
	String date = request.getParameter("dob");
	Date dateOfBirth = new SimpleDateFormat("dd-MMM-yyyy").parse(date); 
	if(user.getRole().equalsIgnoreCase("teacher")) {
		user = new Teacher(request.getParameter("firstname"), request.getParameter("lastname"), request.getParameter("middlename"), 
				dateOfBirth, request.getParameter("email"), request.getParameter("pwd1"), request.getParameter("phone"), request.getParameter("gender"), 
				request.getParameter("address"), "teacher", request.getParameter("subject"));
	} else if(user.getRole().equalsIgnoreCase("headmaster")) {
		user = new HeadMaster(request.getParameter("firstname"), request.getParameter("lastname"), request.getParameter("middlename"), 
				dateOfBirth, request.getParameter("email"), request.getParameter("pwd1"), request.getParameter("phone"), request.getParameter("gender"), 
				request.getParameter("address"), "headmaster", request.getParameter("subject"));
	} else {
		user = new Student(request.getParameter("firstname"), request.getParameter("lastname"), request.getParameter("middlename"), 
				dateOfBirth, request.getParameter("email"), request.getParameter("pwd1"), request.getParameter("phone"), request.getParameter("gender"), 
				request.getParameter("address"), "student");
	}
	user.setId(uId);

	SchoolApp.userDatabase.set(uId - 1, user);
	response.sendRedirect("allusers.jsp");
	
%>
