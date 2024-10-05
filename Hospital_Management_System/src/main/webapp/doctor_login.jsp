<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<main class="d-flex align-items-center bg-secondary banner-background"
		style="height: 70vh">
		<div class="container">
			<div clsss="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header bg-dark text-white text-center">
							<i class="fa-solid fa-user-plus fa-3x"></i> <br>
							<p>Doctor login</p>
						</div>
						<c:if test="${not empty sucMsg }">
							<p class="text-center text-success fs-3">${sucMsg}</p>
							<c:remove var="sucMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg }">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<div class="card-body">
							<form action="doctorLogin" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" name="doctor_email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" name="doctor_password" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								<div class="form-check">
									<input type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Check me out</label>
								</div>
								<button type="submit" class="btn btn-primary primary-background col-md-12">Submit</button>
							</form>
						</div>
					</div>
				</div>


			</div>
		</div>
	</main>



	<%@include file="component/footer.jsp"%>

</body>
</html>