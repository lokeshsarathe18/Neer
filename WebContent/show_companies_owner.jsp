<%@page import="com.sjl.neer.company.CompanyDTO"%>
<%@page import="com.sjl.neer.company.CompanyDAO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="head.html"></jsp:include>
<title>Companies</title>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">


		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="home_owner.jsp">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">Welcome to Neer</div>
			</a>
			<!-- Divider -->
			<br>
			<br>
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link" href="home_owner.jsp">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>Home</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="show_companies_owner.jsp"> <i class="fas fa-fw fa-cog"></i>
					<span>Companies</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="show_orders_owner.jsp"> <i class="fas fa-fw fa-wrench"></i>
					<span>Orders</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="show_products_owner.jsp"> <i class="fas fa-fw fa-wrench"></i>
					<span>Products</span>
			</a></li>
						<li class="nav-item "><a class="nav-link"
				href="show_workers.jsp"> <i
					class="fas fa-fw fa-user"></i> <span>Workers</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="show_users.jsp"> <i
					class="fas fa-fw fa-users"></i> <span>Users</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->



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

				<div class="text-center">
					<a href="owner_addCompany.jsp"
						class="btn btn-primary btn-icon-split btn-lg"> <span
						class="text">Add Company</span>
					</a>
				</div>
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Tables</h1>
					<p class="mb-4">DataTables is a third party plugin that is used
						to generate the demo table below.</p>

					<%
						ArrayList<CompanyDTO> al = new CompanyDAO().getAllCompanies();
						if (al != null) {
					%>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Your
								Companies....</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>Company No.</th>
											<th>Name</th>
											<th>City</th>
											<th>Products</th>
											<th>Workers</th>
											<th>Options</th>
											<th>Options</th>
										</tr>
									</thead>
									<%
										int sn = 1;
											for (CompanyDTO dto : al) {
									%>
									<tbody>
										<tr>
											<td><%=sn++%></td>
											<td><%=dto.getName()%></td>
											<td><%=dto.getCity()%></td>
											<td>
												<form action="show_products_owner.jsp" method="post">
													<input type="hidden" name="company_id" value="<%=dto.getCompany_id()%>"> <input
														type="submit" name="submit" value="Show">
												</form> 
											</td>

											<td>
												<form action="show_workers.jsp" method="post">
													<input type="hidden" name="company_id" value="<%=dto.getCompany_id()%>">
													<input type="hidden" name="customer_type" value="w"> <input
														type="submit" name="submit" value="Show">
												</form>
												</td>
												
											<td><form action="owner_addProduct.jsp" method="post">
													<input type="hidden" name="company_id" value="<%=dto.getCompany_id()%>">
													 <input
														type="submit" name="submit" value="Add Product">
												</form>
												</td>
											<td><form action="owner_addWorker.jsp" method="post">
													<input type="hidden" name="company_id" value="<%=dto.getCompany_id()%>">
													 <input
														type="submit" name="submit" value="Add Worker">
												</form>
												</td>


										</tr>
									</tbody>
									<%
										}
									%>
								</table>
							</div>
						</div>
						<%
							} else {
								out.print("<h2>There is no company available</h2>");
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