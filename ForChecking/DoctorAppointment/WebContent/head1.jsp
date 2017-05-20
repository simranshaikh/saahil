<!DOCTYPE html>
<html>
<head>
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
	
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

a:hover:not (.active ) {
	background-color: #333;
}

.active {
	background-color: #4CAF50;
}

li.last
         {
         float:right !important;
         }

</style>
</head>
<body>

	<ul>
		<li><a class="#"><img align="center" src="images/logo.jpg" alt="logo"
				style="height: 55px; width: 189px;" /></a>
		<li><a class="active" href="ViewMyAppointments.html">Home</a></li>
	
		<li class="last"><a class="active" href="DoctorPage.html">Logout</a></li>
		</span>
	</ul>

</body>
</html>
