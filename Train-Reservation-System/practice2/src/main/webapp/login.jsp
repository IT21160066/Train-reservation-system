<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	*{
		padding:0;
		margin:0;
		font-family: 'Open Sans Condensed', sans-serif;
	}
	
	body{
		width:100%;
 		height:100vh;
	/* 	background: rgb(1,0,98); 
		background: linear-gradient(0deg, rgba(1,0,98,1) 0%, rgba(0,0,0,1) 100%); */
		background-image:url("https://static.bangkokpost.com/media/content/dcx/2022/11/03/4509420.jpg");
	}
	
	form{
	 	display: flex;
  		justify-content: center;
  		align-items: center;
  		width:30%;
  		border: 3px solid green; 
		flex-direction:column;
		margin:auto;
		font-size:20px;
		padding:30px;
		background: rgba(255,255,255,0.8); 
		position:absolute;
		top:25%;
	
	}
	
	form input{
		margin:20px;
		height:30px;
		width:300px;
		font-size:16px;
		border:none;
		border-bottom:solid black 2px;
		background:transparent;
		color:black;
	}
	
	form input:focus{
	outline:none;
	background:transparent;
	}
	
	
	.loginbtn{
		width:100px;
		color:white;
		background:black;
		border:solid black 1px;
		transition:all 0.3s ease-in;
	}
	
	.loginbtn:hover{
		color:black;
		background:white;
		
	}
	.showhome{
	padding:8px 10px;
	margin-left:auto;
	margin-right:auto;
	}
	.showhome a{
	text-decoration:none;
	color:black;
	padding:8px 10px;
	}
	.loginnav{
	width:100%;
	background:black;
	height:60px;
	position:relative;
	box-shadow: 0 4px 10px rgba(0,0,0,0.5);
	}
	.loginnav a{
		margin: 0;
  		position: absolute;
  		top: 50%;
  		-ms-transform: translateY(-50%);
  		transform: translateY(-50%);
  		padding:6px 15px;
  		background:blue;
  		color:white;
  		margin-left:20px;
  		border-radius:5px;
  		text-decoration:none;
	}
	
	.aboveform{
		display:flex;
		justify-content:center;
	}
	
</style>
</head>
<body>
	<nav class="loginnav">
	<a href="home.jsp" class="showhome">Home</a>
	</nav>
	
	
	<div class="aboveform">
	<form action="login" method="post">
		User Name:
		<input type= "text" name ="username" required>
		Password:
		<input type= "password" name ="password" required>
		
		<input  class="loginbtn" type="submit" name ="login" Value = "login">
		
	</form>
	</div>
	
	
	
</body>
	<script>
	const queryString = window.location.search;
	console.log(queryString);
	
	const urlParams = new URLSearchParams(queryString);
	const id = urlParams.get('id')
	console.log(id);
		
		if(id=='error'){
			alert("Invalid loging!");
		}
		

 	</script>
</html>