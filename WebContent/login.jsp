<!DOCTYPE html>
<html lang="en">
<head>
<title>Log-in</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="Loginlink.html"></jsp:include>
</head>
<body>

	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100">
				<form class="login100-form validate-form" method="post" action="UserLoginController">
					<span class="login100-form-logo"> <i
						class="zmdi zmdi-landscape"></i>
					</span> <span class="login100-form-title p-b-34 p-t-27"> Login </span>

					<div class="wrap-input100 validate-input"
						data-validate="Enter username">
						<input class="input100" type="text" name="username"
							placeholder="Username"> <span class="focus-input100"
							data-placeholder="&#xf207;"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Enter password">
						<input class="input100" type="password" name="password"
							placeholder="Password"> <span class="focus-input100"
							data-placeholder="&#xf191;"></span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" name="option" value="login">Login</button>
					</div>

					<div class="text-center p-t-90">
						<a class="txt1" href="forgotpassword.jsp"> Forgot Password? </a><br>
						<br> <a class="txt1" href="signup.jsp"> Sign-up </a>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>

	<jsp:include page="Loginscript.html"></jsp:include>

</body>
</html>