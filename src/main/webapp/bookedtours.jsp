<%@page import="com.project.cdao.BookingDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./imgCss/style.css">
<style>
.outer{
margin:50px;
display:flex;
justify-content:flex-start;
flex-wrap:wrap;
}
.lout{
    font-weight: bold;
	color: rgb(207, 8, 48);
}
h1{
text-align:center;
margin-rop:0.5em;
}
.box{
border:2px solid gray;
margin-top:2em;
width:14em;
margin:80px;
border-radius:10px;
box-shadow:2px 2px 2px gray;
}
.box_item{

font-waight:bold;
font-size1:1.3em;
margin:2rem;

}
.del{
width:5rem;
border:none;
border-radius:8px;
background-color:green;
color:white;
font-waight:900;
}
.del:hover{
cursor:pointer;
background-color:#09AB4C;
}

.contus{
	font-size: 18px;
	background-color: green;
	margin-top:10px;
	padding:10px;
	color:white;
	width:70%;
	font-waight:900;
	border-radius: 10px;
}

.contus:hover{
cursor:pointer;
}

</style>
</head>
<body>
	<%
	String user = "";
	if(session.getAttribute("status") == null || (int) session.getAttribute("status")!=1){
		response.sendRedirect("CheckSes");
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
	<h1>Your booked tours </h1>
<%-- 	
	<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/roughwrk" user="root" password="base"/>
	<% String cust_id = (String) session.getAttribute("userid"); %>
	<sql:query var="rs" dataSource="${db}">select * from booked where c_id=<%= cust_id %></sql:query>

	<c:forEach items="${rs.rows}" var="b">
		
		<div>
			
			<h2>Visitors: ${b.nvisitors}</h2>
			<h2>Date: ${b.vdate}</h2>
			<h2>Price: ${b.totalprice}</h2>
		</div>	
		
	</c:forEach>
	
	<div></div>
	--%>
	<%
		String c_id = session.getAttribute("userid").toString();
		ResultSet rs = BookingDAO.getBooked(c_id);
	%>
	<div class="outer">
	<%while(rs.next()){ %>
	<% String tourName = rs.getString(2); %>
	<div class="box">
		<div class="box_item">
		Date:
			<%= rs.getString(4) %>
		</div>	
		<div class="box_item">
		
			<%= rs.getString(2) %>
		</div>	
		<div class="box_item">
		Number of People:
			<%= rs.getString(3) %>
		<div class="contus">Need Help? Contact us</div>
		</div>	
		</div>
	<%} %>
	</div>
</body>
</html>