<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<c:if test="${empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>
	<%@include file="component/navbar.jsp"%>
	
	<main class="d-flex align-items-center bg-secondary banner-background"
		style="height: 70vh">
	<div class="container p-4">
			<div clsss="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header bg-dark text-white text-center">
							<i class="fa-solid fa-user-plus fa-3x"></i> <br>
							<p>Change Password</p>
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
							<form action="UserchangePassword" method="post">
								<div class="form-group mb-3">
									<label >New Password</label>
									 <input type="text" name="newPassword" class="form-control" required>
								</div>
								<div class="form-group mb-3">
									<label >Old Password</label>
									 <input type="text" name="oldPassword" class="form-control" required>
								</div>
								<input type="hidden" value="${userObj.id}" name="uid">
								<button type="submit" class="btn btn-primary primary-background col-md-12">Change Password</button>
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