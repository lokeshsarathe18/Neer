<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

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

<div id="map"></div>



<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>