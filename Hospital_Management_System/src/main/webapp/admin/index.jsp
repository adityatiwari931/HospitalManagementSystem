<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty adminObj}">
		<c:redirect url="../admin_login.jsp"></c:redirect>
	</c:if>

	<h1 class="text-center">Admin Dashboard</h1>

	<c:if test="${not empty sucMsg }">
		<p class="text-center text-success fs-3">${sucMsg}</p>
		<c:remove var="sucMsg" scope="session" />
	</c:if>

	<c:if test="${not empty errorMsg }">
		<p class="text-center text-danger fs-5">${errorMsg}</p>
		<c:remove var="errorMsg" scope="session" />
	</c:if>
	<%
	DoctorDao dao = new DoctorDao(DBConnect.getConn());
	%>
	
	<div class="row mx-4">
		<div class="col-md-4">
			<div class="card shadow">
				<div class="card-body">
					<div
						class="card-header primary-background text-dark text-center fs-5">
						<h1>

							<i class="fa-solid fa-user-doctor "></i><br>
							<p>Doctor</p>
						</h1>
					</div>
					<h2>
						<p class="text-center"><%=dao.countDoctor() %></p>
					</h2>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card shadow">
				<div class="card-body">
					<div
						class="card-header primary-background text-dark text-center fs-5">
						<h1>

							<i class="fa-solid fa-user"></i></i><br>
							<p>User</p>
						</h1>
					</div>
					<h2>
						<p class="text-center"><%=dao.countUser() %></p>
					</h2>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card shadow">
				<div class="card-body">
					<div
						class="card-header primary-background text-dark text-center fs-5">
						<h1>

							<i class="fa-regular fa-calendar-check"></i><br>
							<p>Total Appointment</p>
						</h1>
					</div>

					<h2>
						<p class="text-center"><%=dao.countAppointment() %></p>
					</h2>

				</div>
			</div>
		</div>

	</div>
	<br>
	<div class="row mx-4">
		<div class="col-md-4">
			<div class="card shadow" data-bs-toggle="modal"
				data-bs-target="#exampleModal">
				<div class="card-body">
					<div
						class="card-header primary-background text-dark text-center fs-5">
						<h1>

							<i class="fa-solid fa-user-doctor "></i><br>
							<p>Specialist</p>
						</h1>
					</div>
					<h2>
						<p class="text-center"><%=dao.countSpecialist() %></p>
					</h2>

				</div>
			</div>
		</div>
	</div>



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="../addSpecialist" method="post">

						<div class="form-group">

							<label>Enter Specialist Name</label> <input name="specName"
								type="text" class="form-control">

						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>

					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
</body>
</html>