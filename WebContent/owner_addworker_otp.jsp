
<%@page import="java.util.HashMap"%>
<%@page import="com.sjl.neer.utility.NeerOTP"%>
<%
	if (request.getMethod().equalsIgnoreCase("post")) {
		if (request.getParameter("unique_id") != null) {
			String unique_id = request.getParameter("unique_id");
			HashMap<String, Object> map = new UserDAO().getUserID_MobileNo(unique_id);
			int otp = NeerOTP.RandomOTP();
			NeerOTP.MessageOTP(map.get("mobile_no").toString(), otp, unique_id);
%>
<!DOCTYPE html>
<%@page import="com.sjl.neer.user.UserDAO"%>
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
<title>New Product</title>

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

<body>
	<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
		<div class="wrapper wrapper--w680">
			<div class="card card-4">
				<div class="card-body">
					<h2 class="title">Add worker</h2>
					<form method="POST" action="WorkerController">

						<div class="row row-space">


							<div class="col-2">
								<div class="input-group">
									<input class="input--style-4" type="text" name="otp"
										value="<%=otp%>">
										<input class="input--style-4" type="text" name="user_id"
										value="<%=map.get("user_id")%>">
										<input class="input--style-4" type="text" name="company_id"
										value="<%=request.getParameter("company_id")%>">
										 <label class="label">Enter
										OTP</label> <input class="input--style-4" type="text" name="checkotp">
								</div>
							</div>
						</div>

						<div class="p-t-15">
							<button class="btn btn--radius-2 btn--blue" type="submit"
								value="add_product" name="option">Submit</button>
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
</html>
<%
	}
	} else {
		response.sendRedirect("show_workers.jsp");
	}
%>