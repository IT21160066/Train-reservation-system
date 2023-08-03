<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Sign Up</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Andada+Pro&display=swap" rel="stylesheet">
<style>
	body{
		width:100%;
		margin:0;
		height:100vh;
		font-family: 'Open Sans Condensed', sans-serif;
		/* background: rgb(1,0,98);
		background: linear-gradient(0deg, rgba(1,0,98,1) 0%, rgba(0,0,0,1) 100%); */
		background-image:url("https://static.bangkokpost.com/media/content/dcx/2022/11/03/4509420.jpg");
		
	}
	
	form{
		
		display:flex;
		flex-direction:column;
		width:50%;
		background:rgba(0,0,0,0.6);
		margin-left:auto;
		margin-right:auto;
		position:absolute;
		top:20%;
		left:25%;
		padding:20px;
		font-size:20px;
		border-radius:20px;
		color:white;
		border:solid green 1px;
	}
	
	form input{
		height:25px;
		margin:10px;
		border:none;
		focus:none;
		font-family: 'Open Sans Condensed', sans-serif;
		background:transparent;
		border-bottom:solid white 1px;
		font-size:15px;
		color:white;
	}
	
	form input:focus{
	outline:none;
	background:transparent;
	}
	
	#signupbtn{
		width:100px;
		border:solid white 1px;
		background:white;
		color:black;
	}
	
	.signupnav{
		width:100%;
	background:black;
	height:60px;
	position:relative;
	box-shadow: 0 4px 10px rgba(0,0,0,0.5);
	}
	
	
	.signupnav a{
		margin: 0;
  		position: absolute;
  		top: 50%;
  		-ms-transform: translateY(-50%);
  		transform: translateY(-50%);
  		padding:6px 15px;
  		background:blue;
  		color:white;
  		margin-left:20px;
  		border-radius:10px;
  		text-decoration:none;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="signupnav">
	<a href="home.jsp">Return to Home</a>
	</nav>
	
	<div>
	<form method ="post" action ="signup" >
		Name:
		<input type= "text" name ="name" required>
		Address:
		<input type= "text" name ="address" required>
		Email:
		<input type= "email" name ="email" required>
		NIC:
		<input type= "text" name ="nic" required>
		Username:
		<input type= "text" name ="username" required>
		Password:
		<input type= "text" name ="password" required>
		
		<input id="signupbtn" type= "submit" name ="signup" value ="Sign Up">
	</form>
	
	</div>
</body>


</html>