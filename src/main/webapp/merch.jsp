<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="java.sql.ResultSet"%>
  <%@page import="com.project.cdao.MerchDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="./imgCss/style.css">
<style>
.lout{
    font-weight: bold;
	color: rgb(207, 8, 48);
}
.box-main{
	border:2px solid gray;
	width:15em;
	border-radius:10px;
	box-shadow:2px 2px 5px gray;
}
.div{
margin-top:2em;
margin-left:2em;
}
.flex{
display:flex;
justify-content:center;
align-items:center;
}
img{
height:10rem;
width:10rem;
}
.sub{
bg-color:green;
width:15rem;
margin-left:2em;
}
.form{
display:flex;
justify-content:space-around;
margin-top:1.5em;
flex-wrap:wrap;
}
.item{
margin:0.5em;
}
</style>
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
	<form action="MerchBookingSer"  method="post" >
	<div  class="form">
	<% 
	ResultSet rs = MerchDAO.getMerchData();
	while(rs.next()){
	%>
	<div class="box-con">
	<div class="box-main">
	
	<div class="item">Item Name:<%= rs.getString(1) %></div>
	<div class="flex"><img src="<%=rs.getString(2)%>"/></div>
	<div class="item">Disc:<%= rs.getString(3) %></div>
	<div class="item">Size:<%= rs.getString(4) %></div>
	<div class="item">Rs:<%= rs.getString(5) %></div>
	<div class="item"><span>Select:</span>
	<input type="radio" value="<%=rs.getString(1)%>" name="merch" required/></div>
	</div>
	</div>
	<%} %>
	
	</div>
	<div class="div">Quantity:<input type="number" name="quantity" value="1" max="10" min="1" required/></div>
	<input type="submit" value="Buy" class="sub"/>
	</form>
</body>
</html>