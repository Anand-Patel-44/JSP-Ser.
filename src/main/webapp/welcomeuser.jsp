<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./imgCss/style.css">
<style>
.title1{
	padding:30px;
}
.what{
margin:2rem;
margin-bottom:1rem;
padding:30px;
}
p{
margin:2rem;
margin-right:1rem;
margin-top:1rem;
}
.outer{
display:flex;
align-items:center;
font-size:1.1rem;
}
img{
margin:1rem;
}
h3{
margin-left:2rem;
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
	
	<h1 class="title1" style="text-align:center;">Welcome <%= user %> To Mesozoic Park</h1>
	<h2 class="what">What is Mesozoic Era?</h2>
	<div class="outer">
	<p>
		The Mesozoic Era[3] is the second-to-last era of Earth's geological history, lasting from about 252 to 66 million years ago, comprising the Triassic, Jurassic and Cretaceous Periods. It is characterized by the dominance of archosaurian reptiles, such as the dinosaurs; a hot greenhouse climate; and the tectonic break-up of Pangaea. The Mesozoic is the middle of the three eras since complex life evolved: the Paleozoic, the Mesozoic, and the Cenozoic.

The era began in the wake of the Permian–Triassic extinction event, the largest well-documented mass extinction in Earth's history, and ended with the Cretaceous–Paleogene extinction event, another mass extinction whose victims included the non-avian dinosaurs, pterosaurs, mosasaurs, and plesiosaurs. The Mesozoic was a time of significant tectonic, climatic, and evolutionary activity. The era witnessed the gradual rifting of the supercontinent Pangaea into separate landmasses that would move into their current positions during the next era. The climate of the Mesozoic was varied, alternating between warming and cooling periods. Overall, however, the Earth was hotter than it is today. Dinosaurs first appeared in the Mid-Triassic, and became the dominant terrestrial vertebrates in the Late Triassic or Early Jurassic, occupying this position for about 150 or 135 million years until their demise at the end of the Cretaceous. Archaic birds appeared in the Jurassic, having evolved from a branch of theropod dinosaurs, then true toothless birds appeared in the Cretaceous. The first mammals also appeared during the Mesozoic, but would remain small—less than 15 kg (33 lb)—until the Cenozoic. Flowering plants appeared in the Early Cretaceous and would rapidly diversify throughout the end of the era, replacing conifers and other gymnosperms (sensu lato), like Ginkgoales, cycads and Bennettitales as the dominant group of plants.
	</p>
	<div>
	<img src="imgCss/images/tera.jpeg" alt="alt"/>
	</div>
	</div>
	
	<h2 class="what">What is Mesozioc Park?</h2>
	<div class="outer">
	<div>
	<p>In the heart of a lush, secluded valley surrounded by ancient forests and mist-covered mountains, a team of visionaries embarked on a journey to bring the wonders of the Mesozoic era to life. Their dream materialized in the form of "Mesozoic Park," a theme park that transported visitors back in time to an age when dinosaurs ruled the Earth.
	</p>
	<p>Mesozoic Park, with its fusion of education and entertainment, left an indelible mark on the hearts and minds of its visitors. It became a symbol of innovation, showcasing the beauty and grandeur of the Mesozoic era. As families departed with memories of roaring dinosaurs and prehistoric adventures, Mesozoic Park stood as a testament to the timeless fascination with the giants that once roamed the Earth. The Mesozoic magic lived on, echoing through the ages.</p>
	</div>
	
	<img src="imgCss/images/logo.jpeg"/>
	</div>
	<h2 class="what">Rides</h2>
	<div>
		<div>
			<h3>The Mesozoic Gateway
			</h3>
			<p>
As visitors entered through the grand Mesozoic Gateway, they were greeted by life-sized replicas of towering dinosaurs, their roars echoing through the air. The journey into the past had begun, and adventure awaited around every corner. The park's creators had meticulously recreated the landscapes of the Triassic, Jurassic, and Cretaceous periods, ensuring an authentic and immersive experience.
			</p>
			<h3> Mesozoic Safari Expedition
			</h3>
			<p>
			One of the park's highlights was the Mesozoic Safari Expedition, a guided tour through vast landscapes populated by animatronic dinosaurs. Visitors boarded specially designed safari vehicles equipped with panoramic viewing windows, allowing them to witness the wonders of the Mesozoic up close. Traversing through dense jungles and expansive plains, the safari showcased the majestic Stegosaurus, the swift Velociraptor, and the awe-inspiring Tyrannosaurus rex.
			
			</p>
			<h3> DinoDiscovery Dome
			</h3>
			<p>
			The DinoDiscovery Dome was a state-of-the-art educational facility where paleontologists and scientists conducted interactive sessions. Visitors had the opportunity to participate in fossil digs, handle replicas of real dinosaur bones, and engage in discussions about the latest discoveries in paleontology. The dome aimed not only to entertain but also to inspire a passion for learning about Earth's ancient history.
			
			</p>
			<h3>Prehistoric Playground
			</h3>
			<p>
			
DinoWorld Park catered to visitors of all ages, including the little explorers. The Prehistoric Playground featured dinosaur-themed rides, climbing structures resembling ancient trees, and interactive play areas. Children could imagine themselves as junior paleontologists, discovering hidden fossils and engaging in activities designed to spark their curiosity about the prehistoric world.
			
			</p>
			<h3>
			Mesozoic Feasts and Treats
			</h3>
			<p>
			No adventure would be complete without culinary delights. DinoWorld Park offered Mesozoic-inspired cuisine, allowing visitors to dine surrounded by life-sized dinosaur statues. From "TriceraTacos" to "StegoSteaks," the menu was a fusion of creative gastronomy and paleontological whimsy. The Mesozoic-themed food added an extra layer of enjoyment to the overall experience.
			</p>
			<h3>Nightfall Spectacular
			</h3>
			<p>
			As the sun dipped below the horizon, the Nightfall Spectacular began. The park transformed with vibrant lights, illuminating the animatronic dinosaurs in a breathtaking display. A soundtrack of ancient echoes and mesmerizing light shows transported visitors to a magical world where the boundary between past and present blurred.
			</p>
		</div>
	</div>
</body>
</html>




