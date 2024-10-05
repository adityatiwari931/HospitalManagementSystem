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
<title>editDoctors</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>


	<div class="container-fluid p-3">

		<div class="row">

			<div class="col-md-4 offset-md-4">

				<div class="card">
					<p class="fs-3 text-center text-dark">Edit Doctor Details</p>
					<c:if test="${not empty sucMsg }">
						<p class="text-center text-success fs-3">${sucMsg}</p>
						<c:remove var="sucMsg" scope="session" />

					</c:if>
					<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-3">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session" />

					</c:if>
					
					<% 
					int id = Integer.parseInt(request.getParameter("id"));
					DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
					Doctor d = dao2.getDoctorById(id);	
					%>
					

					<form action="../updateDoctor" method="post">
						<div class="mb-3">
							<label class="form-label">Full Name</label> <input type="text"
								class="form-control" name="username" value="<%= d.getUsername()%>">
						</div>
						<div class="mb-3">
							<label class="form-label">DOB</label> <input type="date"
								class="form-control" name="dob" value="<%= d.getDob()%>">
						</div>
						<div class="mb-3">
							<label class="form-label">Qualification</label> <input
								type="text" class="form-control" name="qualification" value="<%=d.getQualification()%>">
						</div>

						<div class="mb-3">
							<label class="form-label">Specialist</label> <select
								name="specialist" required class="form-control">
								<option><%= d.getSpecialist()%></option>

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
								class="form-control" name="email" value="<%=d.getEmail() %>">
						</div>
						<div class="mb-3">
							<label class="form-label">Mob. No</label> <input type="text"
								class="form-control" name="mobno" value="<%=d.getMobno()%>">
						</div>
						<div class="mb-3">
							<label class="form-label">Password</label> <input 
								 value="<%=d.getPassword()%>" required type="text" class="form-control" name="password">
						</div>
						
						<input type="hidden" name="id" value="<%=d.getId()%>">

						<button type="submit" class="btn btn-primary col-md-12">Update</button>
					</form>



				</div>


			</div>




		</div>

	</div>
</body>
</html>