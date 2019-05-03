<%@page import="com.sjl.neer.utility.NeerOTP"%>
<%@page import="com.sjl.neer.user.UserDTO"%>
<%@page import="com.sjl.neer.user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Colorlib Templates">
<meta name="author" content="Colorlib">
<meta name="keywords" content="Colorlib Templates">

<!-- Title Page-->
<title>New Order</title>

<!-- Icons font CSS-->
<link
	href="frontend/regform/vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">
<link
	href="frontend/regform/vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<!-- Font special for pages-->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Vendor CSS-->
<link href="frontend/regform/vendor/select2/select2.min.css"
	rel="stylesheet" media="all">
<link href="frontend/regform/vendor/datepicker/daterangepicker.css"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="frontend/regform/css/main.css" rel="stylesheet" media="all">
</head>
<%
	int user_id = (int) session.getAttribute("user_id");
	UserDTO dto = new UserDAO().getAddress(user_id);
%>
<body>
	<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
		<div class="wrapper wrapper--w680">
			<div class="card card-4">
				<div class="card-body">
					<h2 class="title">Order</h2>
					<form method="POST" action="OrderController">

						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">Country</label> <input
										class="input--style-4" type="text" name="country"
										value="<%=dto.getCountry()%>">
								</div>
							</div>
							<div class="col-2">
								<div class="input-group">
									<label class="label">State</label> <input
										class="input--style-4" type="text" name="state"
										value="<%=dto.getState()%>">
								</div>
							</div>
						</div>


						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">City</label> <input class="input--style-4"
										type="text" name="city" value="<%=dto.getCity()%>">
								</div>
							</div>
							<div class="col-2">
								<div class="input-group">
									<label class="label">Address</label> <input
										class="input--style-4" type="text" name="address"
										value="<%=dto.getAddress()%>">
								</div>
							</div>
						</div>


						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">Latitude</label> <input
										class="input--style-4" type="text" name="lat"
										value="<%=dto.getLat()%>">
								</div>
							</div>
							<div class="col-2">
								<div class="input-group">
									<label class="label">Longitude</label> <input
										class="input--style-4" type="text" name="lng"
										value="<%=dto.getLng()%>">
								</div>
							</div>
						</div>
						<div class="row row-space">
							<div class="col-2">
								<div class="input-group">
									<label class="label">Quantity</label> <input
										class="input--style-4" type="text" name="quantity"> <input
										type="hidden" name="product_id"
										value="<%=request.getParameter("product_id")%>"> <input
										type="hidden" name="cost"
										value="<%=request.getParameter("cost")%>"> <input
										type="hidden" name="otp" value="<%=NeerOTP.RandomOTP()%>">
								</div>
							</div>


							<div class="col-2">
								<div class="input-group">
									<label class="label">Delivery Date</label> <input
										class="input--style-4" type="text" name="Delivery_Date_Time"
										>
								</div>
							</div>

						</div>



						<div class="p-t-15">
							<button class="btn btn--radius-2 btn--blue" type="submit"
								value="add_order" name="option">Submit</button>
						</div>
				</div>
			</div>




			</form>
		</div>
	</div>
	</div>
	</div>

	<!-- Jquery JS-->
	<script src="frontend/regform/vendor/jquery/jquery.min.js"></script>
	<!-- Vendor JS-->
	<script src="frontend/regform/vendor/select2/select2.min.js"></script>
	<script src="frontend/regform/vendor/datepicker/moment.min.js"></script>
	<script src="frontend/regform/vendor/datepicker/daterangepicker.js"></script>

	<!-- Main JS-->
	<script src="frontend/regform/js/global.js"></script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->
<body>

</body>
</html>