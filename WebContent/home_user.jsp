<!DOCTYPE html>
<html lang="en">
<!--    map                          -->
<style>
#map {
	height: 100%;
}

html, body {
	height: 100%;
}
</style>

<script>
	//(23.25023790227152, 77.47747421264648)

	function initMap() {
			var myLatLng0 = {
					lat : 23.25023790227152,
					lng : 77.47747421264648
					
					};
			
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom :15,
			center : myLatLng0
		});
		

 
		 var avtivity_name = 'jitin'
		 var lat = 23.20
		 var Long = 77.49
		 var add ='<form action="activity_details.jsp" method="post">'+
		 '<div class="d-flex flex-row justify-content-center">'+
		 '<div class="p-4">'+
		 '<input type="hidden" name="activity_id" '+'value='+
		 '12'
				+ '>'
				+ '<input class="btn btn-dark" type="submit" name="show_details" value="details">'
				+ '</div>' + '</div>' + '</form>'

		latlngset = new google.maps.LatLng(lat, Long);

		var marker = new google.maps.Marker({
			map : map,
			title : avtivity_name,
			position : latlngset
		});
		map.setCenter(marker.getPosition())

		var content = "<h2 style="+"color:#111"+">" + avtivity_name
				+ "</h2><br> " + add

		var infowindow = new google.maps.InfoWindow()

		google.maps.event.addListener(marker, 'click', (function(marker,
				content, infowindow) {
			return function() {
				infowindow.setContent(content);
				infowindow.open(map, marker);
			};
		})(marker, content, infowindow));

		}
</script>


<script async defer
	src="https://maps.googleapis.com/maps/api/js?key= AIzaSyA2JNF6b-cYRQGVAyySeAMSqs12dvKJdT8
&callback=initMap">
</script>


<head>
<jsp:include page="head.html"></jsp:include>
<title>Home_User</title>
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
				href="home_user.jsp">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">Welcome User</div>
			</a>
			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<br>
			<br>
			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="home_user.jsp"> <i class="fas fa-fw fa-tachometer-alt"></i>
					<span>Home</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="show_companies_user.jsp"> <i class="fas fa-fw fa-cog"></i> <span>Companies</span>
			</a></li>
			<li class="nav-item"><a class="nav-link" href="show_orders_user.jsp">
					<i class="fas fa-fw fa-wrench"></i> <span>Orders</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
				href="show_products_user.jsp"> <i class="fas fa-fw fa-wrench"></i> <span>Products</span>
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

				<div class="text-center">
					<a href="show_products_user.jsp" class="btn btn-primary btn-icon-split btn-lg">
						<span class="text">Order Now !</span>
					</a>
				</div>
				
				<div id="map">Map</div>
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
	<jsp:include page="show_companies_map.jsp"></jsp:include>
	
</body>
</html>