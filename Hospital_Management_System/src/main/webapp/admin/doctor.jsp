<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<!--  java.util.List-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctors</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>


	<div class="container-fluid p-3">

		<div class="row">

			<div class="col-md-4">

				<div class="card">
					<p class="fs-3 text-center text-dark">Add Doctor</p>
					<c:if test="${not empty sucMsg }">
						<p class="text-center text-success fs-3">${sucMsg}</p>
						<c:remove var="sucMsg" scope="session" />

					</c:if>
					<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-3">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />

					</c:if>

					<form action="../addDoctor" method="post">
						<div class="mb-3">
							<label class="form-label">Full Name</label> <input type="text"
								class="form-control" name="username">
						</div>
						<div class="mb-3">
							<label class="form-label">DOB</label> <input type="date"
								class="form-control" name="dob">
						</div>
						<div class="mb-3">
							<label class="form-label">Qualification</label> <input
								type="text" class="form-control" name="qualification">
						</div>

						<div class="mb-3">
							<label class="form-label">Specialist</label> <select
								name="specialist" required class="form-control">
								<option>---select---</option>

								<%
								SpecialistDao dao = new SpecialistDao(DBConnect.getConn());
								List<Specialist> list = dao.getALlSpecialists();
								for (Specialist s : list) {
								%>

								<option><%=s.getSpecialistName()%></option>
								<%
								}
								%>

							</select>
						</div>
						<div class="mb-3">
							<label class="form-label">Email</label> <input type="email"
								class="form-control" name="email">
						</div>
						<div class="mb-3">
							<label class="form-label">Mob. No</label> <input type="text"
								class="form-control" name="mobno">
						</div>
						<div class="mb-3">
							<label class="form-label">Password</label> <input type="password"
								class="form-control" name="password">
						</div>

						<button type="submit" class="btn btn-primary">Submit</button>
					</form>



				</div>


			</div>




			<div class="col-md-8">
				<div class="card">

					<div class="card-body">

						<p class="fs-3 text-center">Doctor Details</p>
						<table class="table">
							<thead>
								<tr>

									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mob. No</th>
									<th scope="col">Action</th>

								</tr>


							</thead>

							<tbody>
								<%
								DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
								List<Doctor> list1 = dao2.getAllDoctors();
								for (Doctor d : list1) {
								%>

								<tr>

									<td><%=d.getUsername()%></td>
									<td><%=d.getDob()%></td>
									<td><%=d.getQualification()%></td>
									<td><%=d.getSpecialist()%></td>
									<td><%=d.getEmail()%></td>
									<td><%=d.getMobno()%></td>
									<td><a href="edit_doctor.jsp?id=<%=d.getId() %>" class="btn btn-sm btn-primary">Edit</a>
									 <a href="../deleteDoctor?id=<%=d.getId()%>" class="btn btn-sm btn-danger">Delete</a></td>

								</tr>




								<%
								}
								%>


							</tbody>


						</table>

					</div>

				</div>

			</div>


		</div>

	</div>
</body>
</html>