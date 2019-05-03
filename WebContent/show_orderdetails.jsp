<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.sjl.neer.worker.WorkerDAO"%>
<%@page import="com.sjl.neer.order.OrderDAO"%>
<%@page import="com.sjl.neer.order.OrderDTO"%>
<%@page import="com.sjl.neer.product.ProductDAO"%>
<%@page import="com.sjl.neer.product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="head.html"></jsp:include>
<title>Orders Details</title>
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
						if (request.getParameter("order_id") != null) {
							OrderDTO dto = new OrderDAO().getOrder(Integer.parseInt(request.getParameter("order_id")));
							if (dto != null) {
					%>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Order
								Details....</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>Customer Name</th>
											<td><%=dto.getUnique_id()%></td>
										</tr>
										<tr>
											<th>Product Name</th>
											<td><%=dto.getProduct_name()%></td>
										</tr>
										<tr>
											<th>Quantity</th>
											<td><%=dto.getOrdered_quantity()%></td>
										</tr>
										<tr>
											<th>Amount</th>
											<td><%=dto.getAmount()%></td>
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
										<%
											String Customer_type = (String) session.getAttribute("Customer_type");
													if (Customer_type.equalsIgnoreCase("w")) {
										%>
										<tr>
											<form method="post" action="OrderController">
											<th>OTP</th>
											<td><input type="text" name="otp"
												placeholder="Enter otp">
												<input type="hidden" name="order_id" value="<%=dto.getOrder_id() %>">
												</td>
											<td>

												<button class="btn btn--radius-2 btn--blue" type="submit"
													value="order_delivered" name="option">Submit</button>

											</td>
											</form>
											<%
												}
											%>
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
								out.print("<h2>There is no order of your users available</h2>");
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