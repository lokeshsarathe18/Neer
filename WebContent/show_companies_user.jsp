<!DOCTYPE html>
<%@page import="com.sjl.neer.user.UserDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sjl.neer.company.CompanyDTO"%>
<%@page import="com.sjl.neer.company.CompanyDAO"%>
<html lang="en">


<!-- 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////sudhanshu
/////////////////////////////css for map
 -->
<style>
#map {
	height: 100%;
}

html, body {
	height: 100%;
}
</style>
<!-- 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////sudhanshu
 -->

<!-- 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////sudhanshu
////////////////////////////////  javascript for map intialization
 -->

<script>
	//(23.25023790227152, 77.47747421264648)


function initMap() {
			var myLatLng0 = {
					<%
					ArrayList<String> alist= new UserDAO().getUserLocation((int)session.getAttribute("user_id"));
					if(alist == null){
						%>
						lat : 23.25023790227152,
						lng : 77.47747421264648
						<%
					}else{
						%>
						lat : <%=alist.get(0)%>,
						lng : <%=alist.get(1)%>
						<%
					}
					%>
			};
			
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 8,
			center : myLatLng0
		});
		<%
		ArrayList<CompanyDTO> al = new CompanyDAO().getAllCompanies();
		
		if(al!=null){
		for (CompanyDTO cdto : al) {%>
		 var company_name = '<%=cdto.getName()%>'
		 var lat = <%=cdto.getLat()%>
		 var Long = <%=cdto.getLng()%>
		 var add ='<form action="show_products_user.jsp" method="post">'+
		 '<div class="d-flex flex-row justify-content-center">'+
		 '<div class="p-4">'+
		 '<input type="hidden" name="company_id" '+'value='+
		 '<%=cdto.getCompany_id()%>'
				+ '>'
				+ '<input class="btn btn-dark" type="submit" name="submit" value="Show Products">'
				+ '</div>' + '</div>' + '</form>'

		latlngset = new google.maps.LatLng(lat, Long);

		var marker = new google.maps.Marker({
			map : map,
			title : company_name,
			position : latlngset
		});
		map.setCenter(marker.getPosition())

		var content = "<h2 style="+"color:#069"+">" + company_name
				+ "</h2><br> " + add

		var infowindow = new google.maps.InfoWindow()

		google.maps.event.addListener(marker, 'click', (function(marker,
				content, infowindow) {
			return function() {
				infowindow.setContent(content);
				infowindow.open(map, marker);
			};
		})(marker, content, infowindow));
<%}
			}%>
	///////////////////////////////////////////////////////////////////////////////////////

		////////////////////////////////////////////////////////////////////////////
	}
</script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA2JNF6b-cYRQGVAyySeAMSqs12dvKJdT8
&callback=initMap">
	
</script>


<head>
<jsp:include page="head.html"></jsp:include>
<title>Companies</title>
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
			<li class="nav-item active"><a class="nav-link"
				href="show_companies_user.jsp"> <i class="fas fa-fw fa-cog"></i>
					<span>Companies</span>
			</a></li>
			<li class="nav-item"><a class="nav-link"
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

				<div class="text-center">
					<a href="show_products_user.jsp"
						class="btn btn-primary btn-icon-split btn-lg"> <span
						class="text">Order Now !</span>
					</a>
				</div>									
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Tables</h1>
					<p class="mb-4">DataTables is a third party plugin that is used
						to generate the demo table below.</p>

					<%
						//ArrayList<CompanyDTO> al = new CompanyDAO().getAllCompanies();
						if (al != null) {
					%>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Companies....</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>Company No.</th>
											<th>Name</th>
											<th>City</th>
											<th>Covering Area</th>
											<th>Products</th>
										</tr>
									</thead>
									<%
										int sn = 1;
											for (CompanyDTO dto : al) {
									%>
									<tbody>
										<tr>
											<td><%=sn++%></td>
											<td><%=dto.getName()%></td>
											<td><%=dto.getCity()%></td>
											<td><%=dto.getCovering_area()%></td>
											<td>
												<form action="show_products_user.jsp" method="post">
													<input type="hidden" name="company_id"
														value="<%=dto.getCompany_id()%>"> <input
														type="submit" name="submit" value="Show Product">
												</form>
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
								out.print("<h2>There is no company available</h2>");
							}
						%>

					</div>
					<!-- //////////////////////////////////////////////map intialization//////////////////////////////////////////////////////////////////////////sudhanshu-->

					<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////sudhanshu -->

					<!-- End of Content Wrapper -->

				</div>


				<div id="map"></div>
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