<!DOCTYPE html>
<%@page import="com.sjl.neer.order.OrderDTO"%>
<%@page import="com.sjl.neer.order.OrderDAO"%>
<%@page import="com.sjl.neer.product.ProductDAO"%>
<%@page import="com.sjl.neer.product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sjl.neer.company.CompanyDTO"%>
<%@page import="com.sjl.neer.company.CompanyDAO"%>
<html lang="en">
<head>
<jsp:include page="head.html"></jsp:include>
<title>Orders</title>
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
			<li class="nav-item active"><a class="nav-link"
				href="show_orders_user.jsp"> <i class="fas fa-fw fa-wrench"></i>
					<span>Orders</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
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

					<%
						ArrayList<OrderDTO> al = new OrderDAO().getAllOrdersByUserId((int) session.getAttribute("user_id"));
						if (al != null) {
					%>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Your
								Orders....</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>Order No.</th>
											<th>Product Name</th>
											<th>Quantity</th>
											<th>Amount</th>
											<th>Ordered Date</th>
											<th>Status</th>
											<th>OTP</th>
											

											<th>Order Details</th>
										</tr>
									</thead>
									<%
										int sn = 1;
											for (OrderDTO dto : al) {
									%>
									<tbody>
										<tr>
											<td><%=sn++%></td>
											<td><%=dto.getProduct_name()%></td>
											<td><%=dto.getOrdered_quantity()%></td>
											<td><%=dto.getAmount()%></td>
											<td><%=dto.getCreated_date_time()%></td>
											<td><%
											if(dto.getStatus().equalsIgnoreCase("xx")){
												out.print("Order Placed");
											}
											else{
												out.print("Not Verified");
											}
											%></td>
											<td><%=dto.getOtp()%></td>
											
											<td>
											<form action="show_orderdetails.jsp" method="post">
											<input type="hidden" name="order_id" value=<%=dto.getOrder_id() %>>
											<input type="submit" name="submit" value="view">
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
								out.print("<h2>There is no order of your users available</h2>");
							}
						%>
						<!-- End of Main Content -->

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