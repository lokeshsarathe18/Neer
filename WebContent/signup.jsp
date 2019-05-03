<!DOCTYPE html>
<html lang="en">
<head>
<title>Sign-up</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="Loginlink.html"></jsp:include>
</head>
<body>

	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100">
				<form class="login100-form validate-form" method="post"
					action="UserLoginController">
					<span class="login100-form-logo"> <i
						class="zmdi zmdi-landscape"></i>
					</span> <span class="login100-form-title p-b-34 p-t-27"> Signup </span>

					<div class="wrap-input100 validate-input"
						data-validate="Enter username">
						<input class="input100" type="text" name="unique_id"
							placeholder="USERNAME"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input"
						data-validate="Enter name">
						<input class="input100" type="text" name="name" placeholder="NAME">
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100">
						<label class="input100">GENDER</label> <input checked="checked"
							type="radio" value="male" name="gender" placeholder="gender" />Male
						<input type="radio" value="female" name="gender" />Female <span
							class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="DOB">
						<input class="input100" type="text" placeholder="ENTER DOB"
							required="" name="dob" id="dob1" /> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100">
						<input class="input100" type="text" name="picture"
							placeholder="PICTURE"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100"
						>
						<label class="input100">Customer Type</label> <input
							checked="checked" type="radio" value="u" name="customer_type" />User
						<input type="radio" value="w" name="customer_type" />Worker <input
							type="radio" value="o" name="customer_type" />Owner <span
							class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Mno">
						<input class="input100" type="text" onchange="checkDuplicateMno()"
							id="mno" placeholder="MOBILE NUMBER" required="" name="mobile_no" /> <span
							class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input"
						data-validate="Enter password">
						<input class="input100" type="password" name="password"
							placeholder="PASSWORD"> <span class="focus-input100"></span>
					</div>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" name="option" value="next">Signup</button>
					</div>
					<div class="text-center p-t-90">
						<a class="txt1" href="login.jsp"> Login </a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="dropDownSelect1"></div>
	<jsp:include page="Loginscript.html"></jsp:include>
</body>
</html>