<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Andada+Pro&display=swap" rel="stylesheet">
	
	<title>Admin Home</title>
	
	<style>
		
		.row {
			width:50%;
			margin-left:25%;
			margin-right:25%;
			margin-top:100px;
			margin-bottom:100px;
			position:absolute;
			padding: 15px;
			border-radius: 15px;
			overflow:hidden;
			box-shadow: 0 8px 50px rgba(0,0,0,0.4);
		}
	</style>
	
</head>
<body>
	<header>
		<nav class="navbar fixed-top navbar-dark bg-dark">
  			<div class="container-fluid">
    			<span class="navbar-brand mb-0 h1">SRI LANKA RAILWAYS</span>
    			<%if(session.getAttribute("username")!= null){%>
					<%-- <li><a href=<%session.invalidate(); %>"home.jsp">Log Out</a></li> --%>
					<a href="logout">log Out</a>
				<%}%>
  			</div>
		</nav>
	</header>
	
	<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
  		<div class="carousel-inner">
    		<div class="carousel-item active">
      			<img src="https://cdn.theculturetrip.com/wp-content/uploads/2017/11/8584343778_7edb4ccf6d_k.jpg" class="d-block w-100" alt="...">
      			<div class="carousel-caption d-none d-md-block">
        			<h1>WELCOME TO ADMIN HOME PAGE</h1>
        			<h4>Sri Lanka Railways Online Portal</h4>
      			</div>
    		</div>
  		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-6">
		<div class="card text-dark bg-light">
  			<div class="card-body">
    			<h5 class="card-title">Train Schedule Management</h5>
    			<p class="card-text">Create, update and delete train schedules from here.</p>
    			<a href="<%=request.getContextPath()%>/list" class="btn btn-primary">Go to Train Schedule Management</a>
  			</div>
		</div>
		</div>
		
		<div class="col-sm-6">
		<div class="card text-dark bg-light">
  			<div class="card-body">
    			<h5 class="card-title">Train Driver Management</h5>
    			<p class="card-text">Insert, update and delete train drivers from here.</p>
    			<a href="#" class="btn btn-primary">Go to Train Driver Management</a>
  			</div>
		</div>
		</div>
	
	</div>
	
</body>
</html>