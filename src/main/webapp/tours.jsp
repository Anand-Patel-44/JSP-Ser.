<%@page import="com.project.cdao.TourDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
*{
	margin:0;
	padding:0;
	font-family:Arial;
}

li a{
    text-decoration: none;
    font-size: 18px;
    color: white;
}

.lout{
    font-weight: bold;
	color: rgb(207, 8, 48);
}

nav a:hover{
	color:rgb(239, 255, 11);
}

header h1{
    color: wheat;
    font-family: Arial, Helvetica, sans-serif;
}
header{
    display: flex;
    justify-content: space-between;
    padding: 1.5em 4em;
    align-items: center;
    background-color: rgb(0, 128, 38);
}

ul{
    display: flex;
}

.hea{
	margin: 30px 0;
	text-align: center;
	
}

li{
    list-style-type: none;
    margin: 0.5em 1.5em;
}



.main{
	padding:50px 80px;

}

.inner{
	display:flex;
	justify-content: space-evenly;
	align-items:center;
	margin:30px 0;
}

input{
	font-size:18px;
	padding:0.3em 0.6em;
}
.tourcls{
	padding: 0.3em 0.5em;
	border-radius:15px;
	box-shadow:3px 0px 3px grey;
}

.tourcls >*{
	margin: 20px;
	
}

.sub{
	width:fit-content;
	padding: .5em 1em;
	border:none;
	border-radius:10px;
	color:white;
	background-color: green;
}

.sub:hover{
cursor:pointer;
}

.lower{
	padding: 20px 80px;
}

.lower>div{
	margin:30px 0;
}
.imgdiv{
	width:95%;
	height:220px;
	border-radius:10px 10px 0 0;
	display:flex;
	justify-content: center;
	align-items: center;
}
img{
	width:320px;
	height: 200px;
	border-radius:10px 10px 0 0;
	
}
.descp{
	width: 320px;
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
				<li><a href="./merch.jsp">Merch</a></li>
				<li><a href="tours.jsp">Tours</a></li>
				<li><a href="bookedtours.jsp">Booked Tours</a></li>
				<li><a class="lout" href="LogoutSer">Logout</a></li>
			</ul>
		</nav>
	</header>
	
	<form action="BookingSer" method="post">
	<div class="main">	
	<div class="inner">
		<%
			ResultSet rs = TourDAO.getTourdata();
			while(rs.next()){
		%>
		<div class="tourcls">
			<div class="imagediv"><img src="<%=rs.getString(4) %>"></div>
			<h2><%= rs.getString(1) %></h2>
			<h3>What we offer: </h3>
			<div class="descp"><%= rs.getString(3) %></div>
			<h3>$<%= rs.getString(2) %></h3>
			<div>Select: <input type="radio" name="tour" value="<%= rs.getString(1) %>" required></div>
		</div>
		<%}%>
		</div>
		<div class="lower">
		<div>
			<h3>Select the date you wish to start the tour on: </h3>
			<input type="date" name="vdate" required>
		</div>
		<div>
		<h3>Enter the number of visitors: </h3>
			<input type="number" name="nvisitors" min="1" max="30" value="1" required>
		</div>
		<div>
			<input class="sub" type="submit" value="Confirm and Book">
		</div>
	</div>
	</div>
	</form>
	
</body>
</html>