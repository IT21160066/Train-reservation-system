<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
@charset "UTF-8";
*{

	margin: 0;
	padding: 0;
	font-family: 'Open Sans Condensed', sans-serif;
}
body{
	
}
.nav{
	width:100%;
	display:flex;
	position:fixed;
	justify-content: space-between;
	align-items:center;
	background: black;
	box-shadow: 0 4px 10px rgba(0,0,0,0.5);
	z-index:1000;
	border-bottom:solid rgba(73, 91, 120,0.6) 1px;
}
#digital-clock {
 padding:20px 20px;
 font-size: 30px;
 text-align: center;
 color:white;
}
.loginAndcreateAcc {
	display:flex;
	flex-Direction:column;
	
}

.loginAndcreateAcc a{
	color:#c2c3c4;
	text-Decoration:none;
	margin-right:20px;
	transition: all 0.3s ease;	
}
.loginAndcreateAcc a:hover{
	color:white;
}



.nav-list ul{
	list-style-type: none;
	display:flex;
}
.nav-list ul li{
	padding:16px 14px;
}
.nav-list ul a{
	 font-family: 'Open Sans Condensed', sans-serif;
	text-decoration: none;
	font-size: 1.5rem;
	color: #c2c3c4;
	text-align: center;
	transition: color 0.3s ease;
	padding:3px;
	position:relative;
}
.nav-list ul a::before{
	position:absolute;
	content:"";
	height:2px;
	width:0;
	left:50%;
	bottom:0;
	background:red;
	transition: all 0.3s ease;
}

.nav-list ul a:hover::before{
	width:100%;
	left:0;
}

.nav-list ul a:hover{
	color:white;
}


/*
.home-image img{
	width:100%;
	height:100%;
	position:fixed;
}*/
.image{
	
	/* background: rgb(1,0,98); 
	background: linear-gradient(0deg, rgba(1,0,98,1) 0%, rgba(0,0,0,1) 100%); */
	width:100%;
	height:100vh;
	/* background-image: url('homepagebackground.jpg'); */
	
	background-image: url("https://i.insider.com/577d209b0aec9528208b4957?width=1000&format=jpeg&auto=webp");
	background-attachment:fixed;
	background-repeat:none;
	background-size:cover;
	color:white;
	display:flex;
	flex-direction:column;
	justify-content:center;
	align-items:center;
	position:relative;
}
.image:before{
	position:absolute;
	content:"";
	background:rgba(0,0,0,0.2);
	width:100%;
	height:100%;
	top:0;
	left:0;
}
.textonimage{
	/* position:absolute; */
	display:flex;
	flex-direction:column;
	text-align:center;
	z-index:0;
	color:white;
	/* background:rgba(0,0,0,0.4);
	padding:20px;
	border-radius:20px; */
	/* position:fixed; */
	/* opacity:0; */
}

.body{
	position:relative;
	height:100vh;
	width:100%;
	 background: rgb(1,0,98); 
	background: linear-gradient(0deg, rgba(1,10,20,1) 0%, rgba(0,0,0,1) 100%);
}

#homeDisplaytext{
	font-size:3rem;
}
#text{
	margin-top:50px;
	display: block;
	width: fit-content;
	position: relative;
	margin-left:auto;
	margin-right:auto;
	/*color: white; in initial stae it shuld be transparent*/
	color: transparent;
	animation: text_reveal .5s ease forwards; /*add animation to text*/
	animation-delay: 1s;
}

#text:nth-child(1){
	animation-delay: 1s;
}

#span {
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	width: 0;

	border-radius: 2px;
	background: crimson;
	animation: text_reveal_box 1.5s ease;
	animation-delay: .5s;
	
	
}

#hero h1:nth-child(1) span{
	animation-delay: .5s;
}


@keyframes text_reveal_box{
	50%{
		width: 100%;
		left: 0;
	}
	100%{
		width: 0;
		left: 100%;
	}
}

@keyframes text_reveal{
	100%{
		color: white;
	}
}
@keyframes text_reveal_name{
	100%{
		color: crimson;
	}
}

.image img{
	right:0;
	bottom:0;
	position:absolute;
	
}
</style>
</head>
<body>
	<div class="nav">
		<div id="logo">
			<div id = "digital-clock">
			
			</div>
		</div>
		<div class="nav-list">
			<ul>
				<li><a href="#home">Home</a></li>
				<li><a href="#gallery">Gallery</a></li>
				<li><a href="#history">History</a></li>
				<li><a href="#contact">Contact</a></li>
				<%if(session.getAttribute("username") != null){%>
					<li><a href="check.jsp">Book Ticket</a></li>
				<%}%>
			</ul>
		</div>
		<div class="loginAndcreateAcc">
			<%if(session.getAttribute("username")!= null){%>
					<%-- <li><a href=<%session.invalidate(); %>"home.jsp">Log Out</a></li> --%>
					<a href="logout">log Out</a>
				<%}else if(null==session.getAttribute("username")){%>
				<a href="login.jsp">Login</a>
				<%}%>
			
			<a href="signup.jsp">Create Account</a>
		</div>
	</div>
	
	
	<div class="image">
		<div class="textonimage">
			<h1 id="homeDisplaytext">BOOK YOUR NEXT TRAIN TICKET<span id=""></span></h1>
			<h2>Simple,fast rail booking.</h2>
			<%if(session.getAttribute("username")!= null){%>
				<h1 id="text">Hello <%=session.getAttribute("username") %><span id="span"></span></h1>
			<%}%>
		</div>
		
			<!-- <img src="https://cdn.pixabay.com/photo/2012/04/11/18/10/steam-29217_960_720.png" width="200px"> -->
	</div>

	<div class="body">

	</div>
</body>
<script>//--------------------java Sript----------------------------

 
 /* var homeimg = document.querySelector('#text'); */
 	var homeimg = document.querySelector('.image');
 	var text = document.getElementById('text');
 	console.log(text)
 	console.log(homeimg);
 /* console.log(document.querySelector('#text')); */
 
 window.addEventListener("scroll", function(){
												var offset = window.pageYOffset;
										
												homeimg.style.backgroundPositionY = offset*0.2*(-1)+"px";
												text.style.backgroundPositionY = offset*0.2*(-1)+"px";
																											}
 																												);

 

		
	
/*clock*/

function Time() {
 // Creating object of the Date class
 var date = new Date();
 // Get current hour
 var hour = date.getHours();
 // Get current minute
 var minute = date.getMinutes();
 // Get current second
 var second = date.getSeconds();
 // Variable to store AM / PM
 var period = "";
 // Assigning AM / PM according to the current hour
 if (hour >= 12) {
 period = "PM";
 } else {
 period = "AM";
 }
 // Converting the hour in 12-hour format
	 if (hour == 0) {
		 hour = 12;
	 } else {
		 if (hour > 12) {
	 		hour = hour - 12;
	 	}
	 }
	 // Updating hour, minute, and second
	 // if they are less than 10
	 hour = update(hour);
	 minute = update(minute);
	 second = update(second);
	 // Adding time elements to the div
	 document.getElementById("digital-clock").innerText = hour + " : " + minute + " : " + second + " " + period;
	 // Set Timer to 1 sec (1000 ms)
	 setTimeout(Time, 1000);
	}
 // Function to update time elements if they are less than 10
 // Append 0 before time elements if they are less than 10
	function update(t) {
 		 if(t < 10)
  		{
	 		return "0" + t;
	 	}else{
		 	return t;
	 	}
	}
	Time();

/*end of clock*/

</script>
</html>