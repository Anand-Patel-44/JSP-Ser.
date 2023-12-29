<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
    <%@page import="com.project.icls.Orders"%>
  <%@page import="com.project.cdao.ordersDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String hidden = request.getParameter("hidden");
	String hidden2 = request.getParameter("hidden2");
	String c_id = request.getParameter("c_id");
	int b = Integer.parseInt(c_id);
	int a = Integer.parseInt(hidden2);
	Orders o = new Orders();
	o.setC_id(b);
	o.setMerch(hidden);
	o.setQuantity(a);
	ordersDAO.deleteOrder(o);
%>

<%= hidden  %>
<%= hidden2 %>
<%
response.sendRedirect("orders.jsp");
%>
</body>
</html>