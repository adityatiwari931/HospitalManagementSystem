<%@page import="java.sql.Connection"%>
<%@page import="com.db.DBConnect"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<%@include file="component/allcss.jsp"%>

<style type="text/css">
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/doc1.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/doc2.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
			<div class="carousel-item">
				<img src="img/doc3.jpg" class="d-block w-100" alt="..."
					height="500px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>



	<div class="container p-3">
		<p class="text-center fs-3">Key Features of Hospital</p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-sm-6 mb-3">
						<div class="card shadow">
							<div class="card-body">
								<h5 class="card-title">Special Title Treatment</h5>
								<p class="card-text">With supporting text below as a natural
									lead-in to additional content.</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6 mb-3">
						<div class="card shadow">
							<div class="card-body">
								<h5 class="card-title">Special Title Treatment</h5>
								<p class="card-text">With supporting text below as a natural
									lead-in to additional content.</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="card shadow">
							<div class="card-body">
								<h5 class="card-title">Special Title Treatment</h5>
								<p class="card-text">With supporting text below as a natural
									lead-in to additional content.</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="card shadow">
							<div class="card-body">
								<h5 class="card-title">Special Title Treatment</h5>
								<p class="card-text">With supporting text below as a natural
									lead-in to additional content.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 d-flex justify-content-center">
				<img alt="" src="img/doc4.jpg" height="300px"
					style="max-width: 100%; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);">
			</div>
		</div>
	</div>
	
	
	<hr>
	
	
	
	<div class="container p-3">
		<p class="text-center fs-2">Our Team</p>
		<div class="row">
			<div class="col-md-3">
				<div class="card shadow" style="width: 18rem;">
					<div class="card-body text-center">
						<img alt="" src="img/doc4.jpg" height="250px" >
						<h5 class="card-title fw-bold fs-5">Dr. Aditya Tiwari</h5>
						<p class="card-text fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card shadow" style="width: 18rem;">
					<div class="card-body text-center">
						<img alt="" src="img/doc4.jpg" height="250px" >
						<h5 class="card-title fw-bold fs-5">Dr. Ajay</h5>
						<p class="card-text fs-7">(Cheif Doctor)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card shadow" style="width: 18rem;">
					<div class="card-body text-center">
						<img alt="" src="img/doc4.jpg" height="250px">
						<h5 class="card-title fw-bold fs-5">Dr. Updesh Rajput</h5>
						<p class="card-text fs-7">(Mental Health Specialist)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card shadow" style="width: 18rem;">
					<div class="card-body text-center">
						<img alt="" src="img/doc4.jpg" height="250px">
						<h5 class="card-title fw-bold fs-5">Dr. Deepanshu</h5>
						<p class="card-text fs-7">(MD & Cheif Doctor)</p>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-3">
				<div class="card shadow" style="width: 18rem;">
					<div class="card-body text-center">
						<img alt="" src="img/doc4.jpg" height="250px" >
						<h5 class="card-title fw-bold fs-5">Dr. Aditya Tiwari</h5>
						<p class="card-text fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card shadow" style="width: 18rem;">
					<div class="card-body text-center">
						<img alt="" src="img/doc4.jpg" height="250px" >
						<h5 class="card-title fw-bold fs-5">Dr. Ajay</h5>
						<p class="card-text fs-7">(Cheif Doctor)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card shadow" style="width: 18rem;">
					<div class="card-body text-center">
						<img alt="" src="img/doc4.jpg" height="250px">
						<h5 class="card-title fw-bold fs-5">Dr. Updesh Rajput</h5>
						<p class="card-text fs-7">(Mental Health Specialist)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card shadow" style="width: 18rem;">
					<div class="card-body text-center">
						<img alt="" src="img/doc4.jpg" height="250px">
						<h5 class="card-title fw-bold fs-5">Dr. Deepanshu</h5>
						<p class="card-text fs-7">(MD & Cheif Doctor)</p>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-3">
				<div class="card shadow" style="width: 18rem;">
					<div class="card-body text-center">
						<img alt="" src="img/doc4.jpg" height="250px" >
						<h5 class="card-title fw-bold fs-5">Dr. Aditya Tiwari</h5>
						<p class="card-text fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card shadow" style="width: 18rem;">
					<div class="card-body text-center">
						<img alt="" src="img/doc4.jpg" height="250px" >
						<h5 class="card-title fw-bold fs-5">Dr. Ajay</h5>
						<p class="card-text fs-7">(Cheif Doctor)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card shadow" style="width: 18rem;">
					<div class="card-body text-center">
						<img alt="" src="img/doc4.jpg" height="250px">
						<h5 class="card-title fw-bold fs-5">Dr. Updesh Rajput</h5>
						<p class="card-text fs-7">(Mental Health Specialist)</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card shadow" style="width: 18rem;">
					<div class="card-body text-center">
						<img alt="" src="img/doc4.jpg" height="250px">
						<h5 class="card-title fw-bold fs-5">Dr. Deepanshu</h5>
						<p class="card-text fs-7">(MD & Cheif Doctor)</p>
					</div>
				</div>
			</div>
		</div>
	</div>

<%@include file="component/footer.jsp" %>

</body>
</html>