<%@page import="java.util.HashMap"%>
<%@page import="com.sjl.neer.user.UserDAO"%>
<%@page import="com.sjl.neer.user.UserDTO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="head.html"></jsp:include>
<title>User Details</title>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">




		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->

				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<ul class="navbar-nav ml-auto">
						<!-- noti,message,userinfo -->
						<jsp:include page="notification.jsp"></jsp:include>
						<jsp:include page="message.jsp"></jsp:include>
						<jsp:include page="userinfo.jsp"></jsp:include>
					</ul>

				</nav>
				<!-- End of Topbar -->

				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Tables</h1>
					<p class="mb-4">DataTables is a third party plugin that is used
						to generate the demo table below.</p>

					<%
						if (session.getAttribute("user_id") != null) {
							UserDTO dto = new UserDAO().getUser((int) session.getAttribute("user_id"));
							if (dto != null) {
					%>



					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">User
								Details....</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>User Name</th>
											<td><%=dto.getUnique_id()%></td>
										</tr>
										<tr>
											<th>Name</th>
											<td><%=dto.getName()%></td>
										</tr>
										<tr>
											<th>Gender</th>
											<td><%=dto.getGender()%></td>
										</tr>
										<tr>
											<th>DateOfBirth</th>
											<td><%=dto.getDob()%></td>
										</tr>
										<tr>
											<th>Mobile NO</th>
											<td><%=dto.getMobile_no()%></td>
										</tr>
										<tr>
											<th>Status</th>
											<td><%=dto.getStatus()%></td>
										</tr>
										<tr>
											<th>Date-Time</th>
											<td><%=dto.getCreated_date_time()%></td>
										</tr>
										<tr>
											<th>Address</th>
											<td><%=dto.getAddress() + ", " + dto.getCity() + ", " + dto.getState() + ", " + dto.getCountry()%></td>
										</tr>

										<tr align="center">
											<th >
												<form  action="updateprofile.jsp" method="post">
													<input type="hidden" name="user_id"
														value=<%=dto.getUser_id()%>> <input  type="submit"
														name="submit" value="Update Profile ">
												</form>
											</th>
										</tr>

									</thead>



									<%
										}
									%>
								</table>
							</div>
						</div>
						<%
							} else {
								out.print("<h2>There is no user available</h2>");
							}
						%>
						<!-- End of Main Content -->

						<!-- Footer -->
						<jsp:include page="footer.html"></jsp:include>
						<!-- End of Footer -->

					</div>
					<!-- End of Content Wrapper -->

				</div>
			</div>
		</div>
	</div>

	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<jsp:include page="scroll.html"></jsp:include>
	<!-- Scroll to Top Button-->

	<!-- Logout Modal-->
	<jsp:include page="logoutmodal.html"></jsp:include>
	<!-- End Logout Modal-->
	<jsp:include page="script.html"></jsp:include>
</body>
</html>