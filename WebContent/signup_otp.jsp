
<%
	if (session.getAttribute("otp") != null) {
%>
<!DOCTYPE html>
<%@page import="com.sjl.neer.user.UserDTO"%>
<html lang="en">
<head>
<title>Sign-up</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="Loginlink.html"></jsp:include>
</head>
<body>
	<%
		UserDTO dto = (UserDTO) session.getAttribute("dto");
	%>
	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('images/bg-01.jpg');">
			<div class="wrap-login100">
				<form class="login100-form validate-form" method="post"
					action="UserLoginController">
					<span class="login100-form-title p-b-34 p-t-27"> Signup </span> <br>
					<br>
					<div class="wrap-input100 validate-input" data-validate="Enter OTP">
						<input class="input100" type="text" name="checkotp"
							placeholder="Enter OTP"> <span class="focus-input100"></span>
						<input class="input100" type="text" name="otp"
							value="<%=session.getAttribute("otp")%>"> <input
							class="input100" type="hidden" name="unique_id"
							value="<%=dto.getUnique_id()%>">
					</div>
					<br> <br>
					<div class="container-login100-form-btn">
						<button class="login100-form-btn" name="option" value="signup">Signup</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="dropDownSelect1"></div>
	<jsp:include page="Loginscript.html"></jsp:include>
</body>
</html>
<%
	} else {
		response.sendRedirect("signup.jsp");
	}
%>