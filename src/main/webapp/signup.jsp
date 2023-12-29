<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./imgCss/style.css">
</head>
<body>
	<header>
		<h1>Mesozoic Park</h1>
		<nav>
			
		</nav>
	</header>
	<h1 class="hea">Sign up</h1>
	<div class="container">
	
	
	<div >
		<form action="SignupSer" method="post">
		<input type="text" name="fname" placeholder="Name" required>
		<input type="email" name="femail" placeholder="Email" required>
		<input type="password" name="fpass" placeholder="Password" required>
		<input class="sub" type="submit" value="Submit">
		</form>
	</div>
	</div>
	<div class="formbelow">Already a customer? <a href="login.jsp">Log in</a></div>
</body>
</html>