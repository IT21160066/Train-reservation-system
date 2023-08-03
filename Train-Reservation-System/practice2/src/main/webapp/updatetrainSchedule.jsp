<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Train Schedule System</title>

<style type="text/css">

body{

	 background-image: url("https://digitalplacesolutions.com/wp-content/uploads/2018/11/IMG_1167.jpg");
	 background-repeat: no-repeat;
	 background-size: 100%  850px;
}

#current-time{

	display: flex;
	justify-content: center;
	width: 100%;
	align-items: center;
	text-align: center;
	font-size: 35px;
	position: relative;
	color: #4a254a;
}

.form-head{
	
	text-align: center;	
}

.form1 {

	background-color: #00ABB3;
	width:50%;
	margin-left:auto;
	margin-right:auto;
	position:absolute;
	padding: 16px;
	font-weight:600; 
	
	top:2.5%;
	left:25%;
	border-radius: 15px;
	overflow:hidden;
	box-shadow: 0 8px 50px rgba(0,0,0,0.4);
	opacaity: 50%;
}
	
form input{

	display:flex;
	flex-direction:column;
	width:50%;
	height:36px;
	padding:0px;
	border:none;
	border-radius:5px;
}

</style>

</head>
<body>
	
	<div class="form1">
		<form method="POST" action="update">
		
			<h2 class="form-head">UpdateTrain Schedule</h2> 
			
			<div id="current-time">
			</div>
				
			<label for="driverName" class="form-label">Train ID : </label>
  			<input type="text" class="form-control" required name="trainId" value="<c:out value='${oldtrainShedule.trainId}' />" 
  			readonly placeholder="Train Schedule ID ">
  			<br/>
			
			<label for="trainName" class="form-label">Train Name : </label>
  			<input type="text" class="form-control" name="trainName"  value="<c:out value='${oldtrainShedule.trainName}' />
  			"placeholder="Enter train name :" required>
  			<br/>
  			
  			<label for="arrivalTime" class="form-label">Arrival Time : </label>
  			<input type="text" class="form-control" name="arrivalTime" value="<c:out value='${oldtrainShedule.arrivalTime}' />
  			"placeholder="Enter arrival time:" required>
			<br/>
			
			<label for="departureTime" class="form-label">Departure Time : </label>
  			<input type="text" class="form-control" name="depatureTime" value="<c:out value='${oldtrainShedule.depatureTime}' />
  			"placeholder="Enter departure time :" required>
  			<br/>
  			
  			<label for="availability" class="form-label">Availability : </label>
  			<select name="availability" class="form-control" required>
				<option class="option" value="yes"> Yes </option>
				<option class="option" value="no"> No </option>
			</select>
  			<br/>
  			
  			<div class="d-grid gap-2 col-6 mx-auto">
  				<button type="submit" class="btn btn-outline-dark">Update Schedule</button>
  			</div>
		</form>
	</div>
</body>

<script>

	 function time(){
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
			 document.getElementById("current-time").innerText = hour + " : " + minute + " : " + second + " " + period;
			 // Set Timer to 1 sec (1000 ms)
			 setTimeout(time, 1000);
			}
			 // Function to update time elements if they are less than 10
			 // Append 0 before time elements if they are less than 10
			function update(t) {
			 if (t < 10) {
			 return "0" + t;
			 }
			 else {
			 return t;
			 }
			}
			time();
	
</script>

</html>