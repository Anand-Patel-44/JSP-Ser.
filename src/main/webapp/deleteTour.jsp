<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.project.cdao.BookingDAO"%>
    <%@page import="com.project.icls.Booking" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String c_id = request.getParameter("c_id");
String name = request.getParameter("name");
Booking b = new Booking();
b.setCustomerid(c_id);
b.setTourid(name);
BookingDAO.deleteBTour(b);
%>
<% 
response.sendRedirect("bookedtours.jsp");
%>
</body>
</html>