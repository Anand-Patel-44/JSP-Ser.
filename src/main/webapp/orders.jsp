<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.ResultSet"%>
  <%@page import="com.project.cdao.ordersDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./imgCss/style.css">
<style>
.lout{
    font-weight: bold;
	color: rgb(207, 8, 48);
}
.box{
border:2px solid gray;
margin:10px;
border-radius:10px;
box-shadow:2px 2px 5px gray;
}
.item{
margin:1.3em;
}
.flex{
display:flex;
flex-wrap:wrap;
justify-content:space-around;
}
.h1{
text-align:center;
margin:1.2rem 0;
}
.delete{
color:white;
font-weight: 900;
border:none;
border-radius:8px;
background-color:green;
width:75%;
}
.delete:hover{
cursor:pointer;
background-color:#09AB4C;
}
.form{
display:flex;
justify-content:center;
align-items:center;
}
</style>
</head>
<body>

<%
		String user="";
		if(session.getAttribute("status")==null || (int)session.getAttribute("status")!=1){
			response.sendRedirect("Home");
		}
		else{
			user = session.getAttribute("username").toString();
		}
	%>


<header>
		<h1>Mesozoic Park</h1>
		<nav>
			<ul>
				<li><a href="orders.jsp">Ordered Merch</a></li>
				<li><a href="merch.jsp">Merch</a></li>
				<li><a href="tours.jsp">Tours</a></li>
				<li><a href="bookedtours.jsp">Booked Tours</a></li>
				<li><a class="lout" href="LogoutSer">Logout</a></li>
			</ul>
		</nav>
	</header>
	
	<%
		String c_id = session.getAttribute("userid").toString();
		ResultSet rs = ordersDAO.getOrdersData(c_id);
	%>
	<h1 class="h1">Your ordered Merch</h1>
	<div class="flex">
	<%while(rs.next()){ %>
	<div class="box">
	<% String product = rs.getString(2);
	String Quantity = rs.getString(3);
	%>
	<div class="item">Ordered Product:<%= rs.getString(2) %></div>
	<div class="item">Quantity:<%= rs.getString(3) %></div>
	<div class="item">Price:<%= rs.getString(4) %></div>
	<form action="deleteOrder.jsp" class="form">
	<input type="hidden" value="<%= c_id  %>" name="c_id" />
	<input type="hidden" value="<%= product  %>" name="hidden" />
	<input type="hidden" value="<%= Quantity %>" name="hidden2" />
	<input type="submit" value="Delete" class="delete"/>
	</form>
	</div>
	<%} %>
	</div>
</body>
</html>