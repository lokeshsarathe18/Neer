<!DOCTYPE html>
<%@page import="java.util.HashMap"%>
<%@page import="com.sjl.neer.user.UserDAO"%>
<%@page import="com.sjl.neer.product.ProductDAO"%>
<%@page import="com.sjl.neer.product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sjl.neer.company.CompanyDTO"%>
<%@page import="com.sjl.neer.company.CompanyDAO"%>
<html lang="en">
<head>
<jsp:include page="head.html"></jsp:include>
<title>Products</title>
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
				<div class="sidebar-brand-text mx-3">Welcome Lokesh</div>
			</a>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<br>
			<br>
			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link" href="home_user.jsp">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>Home</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="show_companies_user.jsp"> <i class="fas fa-fw fa-cog"></i>
					<span>Companies</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="show_orders_user.jsp"> <i class="fas fa-fw fa-wrench"></i>
					<span>Orders</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="show_products_user.jsp"> <i class="fas fa-fw fa-wrench"></i>
					<span>Products</span>
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

				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Tables</h1>
					<p class="mb-4">DataTables is a third party plugin that is used
						to generate the demo table below.</p>


<form action="show_products_user.jsp" method="post">
						<%
							HashMap<Integer, String> map = new UserDAO().getAllCompany_id_name();
						%>
						<select name="company_id">
							<%
								for (int key : map.keySet()) {
							%>
							<option name="company_id" value="<%=key%>"><%=map.get(key)%></option>
							<%
								}
							%>
						</select> <input type="submit" value="select company">
					</form>

			<%
						if (request.getParameter("company_id") != null) {
							ArrayList<ProductDTO> al = new ProductDAO()
									.getAllProductsByCompanyId(Integer.parseInt(request.getParameter("company_id")));
							if (al != null) {
					%>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Products....</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>Product No.</th>
											<th>Product Name</th>
											<th>Cost</th>
											<th>Option</th>
										</tr>
									</thead>
									<%
				int sn = 1;
					for (ProductDTO dto : al) {
			%>
									<tbody>
										<tr>
											<td><%=sn++%></td>
											<td><%=dto.getName()%></td>
											<td><%=dto.getCost()%></td>
											<td>
											<form action="user_addOrder.jsp" method="post">
											<input type="hidden" name="product_id" value=<%=dto.getProduct_id() %>>
											<input type="hidden" name="cost" value=<%=dto.getCost() %>>
											<input type="submit" name="submit" value="Order Now">
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
								out.print("<h2>There is no product available</h2>");
							}
						}
						%>
					
					</div>
					<!-- End of Content Wrapper -->

				</div>

				<!-- Footer -->
				<jsp:include page="footer.html"></jsp:include>
				<!-- End of Footer -->

			</div>
			<!-- End of Content Wrapper -->

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