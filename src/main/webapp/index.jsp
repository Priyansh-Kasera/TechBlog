<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<!-- CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/myStyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Tech Blog</title>
</head>
<body>
	
	<!--  navBar -->
	<%@ include file="normal_navbar.jsp" %>
	
	<!-- bannner -->
	<div class="container-fluid p-0 m-0 banner-background">
		
		<div class="jumbotron primary-background text-white">
			<div class="container">
				<h3 class="display-3">Welcome to TechBlog </h3>
				<p>A programming language is any set of rules that converts strings, or graphical program elements in the case of visual programming languages, to various kinds of machine code output.[citation needed] Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.</p>
				
				<button class="btn btn-outline-light btn-lg"> <span class="fa fa-user-plus"></span> Start! it's Free</button>
				<a href="login.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle"></span> Login</a>
			</div>
		
		</div>
	
	
	
	</div>
	
	<!-- cards -->
	
	<div class="container">
	
		<div class="row mb-2">
		
			<div class="col-md-4">
					<div class="card">
					 
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn primary-background text-white">Read more</a>
					  </div>
					</div>
			
			</div>
			
			<div class="col-md-4">
					<div class="card">
					 
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn primary-background text-white">Read more</a>
					  </div>
					</div>
			
			</div>
			
			<div class="col-md-4">
					<div class="card">
					 
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn primary-background text-white">Read more</a>
					  </div>
					</div>
			
			</div>
		
		</div>
		
		
		
		<div class="row">
		
			<div class="col-md-4">
					<div class="card">
					 
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn primary-background text-white">Read more</a>
					  </div>
					</div>
			
			</div>
			
			<div class="col-md-4">
					<div class="card">
					 
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn primary-background text-white">Read more</a>
					  </div>
					</div>
			
			</div>
			
			<div class="col-md-4">
					<div class="card">
					 
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn primary-background text-white">Read more</a>
					  </div>
					</div>
			
			</div>
		
		</div>
	

	</div>

<!-- Java script -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>