<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<main class="bg-secondary banner-background p-5">
		<div class="container">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center bg-dark text-white">
						<i class="fa-regular fa-circle-user fa-3x"></i> <br> Register
						here
					</div>
					<c:if test="${not empty sucMsg }">
						<p class="text-center text-success fs-3">${sucMsg}</p>
						<c:remove var="sucMsg" scope="session"/>
					</c:if>
					
					<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-3">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session"/>
					</c:if>
					<div class="card-body">
						<form id="reg-form" action="user_register" method="post">
							<div class="form-group">
								<label for="user_name">User Name</label> <input name="user_name"
									type="text" class="form-control" id="user_name"
									placeholder="Enter name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="user_email" type="email" class="form-control"
									id="exampleInputEmail1" placeholder="Enter email"> <small
									id="emailHelp" class="form-text text-muted">We'll never
									share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="user_password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>

							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree to terms and conditions</label>
							</div>
							<br>
							<button type="submit"
								class="btn btn-primary primary-background col-md-12 ">
								Register</button>
							<!-- 							<i class="fa-solid fa-arrows-rotate"></i>
 -->
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>


	<%@include file="component/footer.jsp"%>
</body>
</html>