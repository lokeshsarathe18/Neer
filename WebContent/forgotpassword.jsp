<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="head.html"></jsp:include>
<title>Forgot Password</title>
</head>
<body class="bg-gradient-primary">
	<br>
	<br>
	<br>
	<div class="container">
		<!-- Outer Row -->
		<div class="row justify-content-center">
			<div class="col-xl-10 col-lg-12 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block">
								<img src="frontend/dashboard/img/a.jpg" alt="lokesh" width="100%" height="100%">
							</div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-2">Forgot Your Password?</h1>
										<p class="mb-4">We get it, stuff happens. Just enter your
											email address below and we'll send you a link to reset your
											password!</p>
									</div>
									<form class="user">
										<div class="form-group">
											<input type="email" class="form-control form-control-user"
												id="exampleInputEmail" aria-describedby="emailHelp"
												placeholder="Enter Email Address..." required>
										</div>
										<a href="login.jsp"
											class="btn btn-primary btn-user btn-block"> Reset
											Password </a>
									</form>
									<hr>
									<div class="text-center">
										<a class="small" href="signup.jsp">Create an
											Account!</a>
									</div>
									<div class="text-center">
										<a class="small" href="login.jsp">Already have an
											account? Login!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="script.html"></jsp:include>
</body>
</html>