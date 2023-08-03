<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>



<meta charset="UTF-8">
<title>Train Schedule System</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Andada+Pro&display=swap" rel="stylesheet">



<style type="text/css">

.nav-head{
	top:10%;
	text-align: center;
	font-size:40px;
}

.nav-button {
  border-radius: 4px;
  background-color: white;
  border: none;
  color: black;
  text-align: center;
  font-size: 15px;
  padding: 10px;
  width: 250px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 4px;
}

.nav-button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.nav-button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.nav-button:hover span {
  padding-right: 25px;
}

.nav-button:hover span:after {
  opacity: 1;
  right: 0;
}


*{
	margin:0;
}

body{
	font-family: 'Andada Pro', serif;
	width:100%;
	font-size:18px;
}

table{
	margin-top:70px;
	width:90%;
	margin-left:auto;
	margin-right:auto;
	border-collapse:collapse;
}
table th{
	background-color:#00ABB3;
	font-size:20px;
}

table td,th {
  border: 1px solid #ddd;
  padding: 8px;
}

table tr:nth-child(even){
	background-color:#f2f2f2;
}

.optionbtn a{
	text-decoration:none;
	color:black;
	font-weight: 500;
}

.optionbtn{
	padding:5px 9px;
	border-radius:12px;
	font-size:17.5px;
}

#edit{
	background:white;
	color: black;
	border: 1px solid #386aff;
}
#edit:hover{
	background:yellow;
}

#delete{
	background:white;
	color: black;
	border: 1px solid #ff3838;
}
#delete:hover{
	background:#ff3838;
	opacity: 95%;
}

</style>
</head>

<body>
	<nav  class="navbar navbar-expand-md navbar-dark" style="background-color: #00ABB3"> 
		<ul>
			<h2 class="nav-head">TrainSchedule List</h2>
			<a href="<%=request.getContextPath()%>/new">
			<button type="button" class="nav-button"><span>Get New TrainShedule</span></button></a><br>
			<a href="adminHome.jsp">
			<button type="button" class="nav-button"><span>Get Back Home</span></button></a><br>
		</ul>
		</nav>


<table border="1" class="table table-bordered">
				<thead>
					<tr>
						<th>TrainID</th>
						<th>Arrival Time</th>
						<th>Departure Time</th>
						<th>Train Name</th>	
						<th>Availability</th>					
						<th>Actions</th>
					</tr>
				</thead>
				<tbody >
					
					<c:forEach var="trainScheduleList" items="${trainScheduleList}">

						<tr>
							<td><c:out value="${trainScheduleList.trainId}" /></td>
							<td><c:out value="${trainScheduleList.arrivalTime}" /></td>
							<td><c:out value="${trainScheduleList.depatureTime}" /></td>
							<td><c:out value="${trainScheduleList.trainName}" /></td>
							<td><c:out value="${trainScheduleList.availability}" /></td>
							
							<td>
								<button id="edit" class="optionbtn"><a href="edit?id=<c:out value='${trainScheduleList.trainId}'/>">Edit</a></button>
								<button id="delete" class="optionbtn"><a href="delete?id=<c:out value='${trainScheduleList.trainId}' />">Delete</a></button>
							</td>
						</tr>
					</c:forEach>
				
				</tbody>

		</table>
			
			
</body>
</html>