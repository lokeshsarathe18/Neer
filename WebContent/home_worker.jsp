<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="head.html"></jsp:include>
<title>Home_Worker</title>
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
				href="home_worker.jsp">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">Welcome Worker</div>
			</a>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<br>
			<br>
			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="home_worker.jsp"> <i class="fas fa-fw fa-tachometer-alt"></i>
					<span>Home</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="show_orders_worker.jsp">
					<i class="fas fa-fw fa-wrench"></i> <span>Orders</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="show_users_worker.jsp">
					<i class="fas fa-fw fa-users"></i> <span>Users</span>
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
				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->

					<!-- End Page Heading -->

					<!-- Content Row -->

					<!-- End Content Row -->

					<div class="row">

						<!-- Area Chart -->

						<!-- Area Chart -->


						<!-- Pie Chart -->

						<!-- Pie Chart -->
					</div>

					<!-- Content Row -->
					<div class="row">

						<!-- Content Column -->
						<div class="col-lg-6 mb-4">

							<!-- Project Card Example -->

							<!-- Project Card Example -->


							<!-- Color System -->

							<!-- Color System -->
						</div>

						<div class="col-lg-6 mb-4">

							<!-- Illustrations -->

							<!-- Illustrations -->

							<!-- Approach -->

							<!-- Approach -->
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

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