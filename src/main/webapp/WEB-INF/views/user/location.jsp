<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url var="R" value="/" />
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>딸기마켓 내동네 인증하기</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="res/index.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cute+Font|Poor+Story&display=swap&subset=korean"
	rel="stylesheet">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=511ad37e23e2cc8925d6778ea7a8b0ba"></script>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		function getLocation(position) {
			var latitud = position.coords.latitude;
			var longitude = position.coords.longitude;

			var mapContainer = document.getElementById("map") // 지도를 표시할 DIV
			var mapOption = {
				center : new daum.maps.LatLng(latitud, longitude) // 지도의 중심좌표
				,
				level : 3
			// 지도의 확대레벨
			};
			// 지도를 생성
			var map = new daum.maps.Map(mapContainer, mapOption);
			// 마커가 표시될 위치
			var markerPosition = new daum.maps.LatLng(latitud, longitude);
			// 마커를 생성
			var marker = new daum.maps.Marker({
				position : markerPosition
			});
			marker.setMap(map);
		}
		if (navigator.geolocation) {
			navigator.geolocation.getCurrentPosition(getLocation, function(
					error) {
				consol.log(error.message);
			});
		} else {
			consol.log("Geolocation을 지원하지 않는 브라우저 입니다.");
		}
	});
	/* function Insert(){
		function getLocation(position) {
			var latitud = position.coords.latitude;
			var longitude = position.coords.longitude;
			
			$.ajax({
				url : '/user/location',
				type : 'post',
				data : 
			})
			
		}
	} */
</script>
<script type="text/javascript">
	var speed = 500
	function flashit() {
		var crosstable = document.getElementById ? document
				.getElementById("check_btn")
				: document.all ? document.all.myexample : ""
		if (crosstable) {
			if (crosstable.style.backgroundColor.indexOf("rgb(150, 255, 153)") != -1)
				crosstable.style.backgroundColor = "#ffffff"
			else
				crosstable.style.backgroundColor = "rgb(150, 255, 153)"
		}
	}
	setInterval("flashit()", speed)
</script>
<style>
div #map {
	margin: 20;
	width: 70%;
	height: 400px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
	margin-bottom: 60px;
	display: block;
	overflow: hidden;
	border-radius: 8px;
}

span {
	font-size: 25px;
	margin-left: auto;
	margin-right: auto;
	display: block;
	margin-right: auto;
}
</style>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<br />
	<div class="container">
		<div id="map"></div>


		<form action="/user/location" method="post">
			<div class="row">
				<div class="form-group">
					<!-- onchange="setState(this)" -->
					<label>내가사는지역:</label> <select id="state" name="state"
						class="form-control w300" required="required">
						<option value="">-----------지역을 골라주세요-----------</option>
						<c:forEach var="state" items="${state}">
							<option value="${state.id}">${state.name}</option>
						</c:forEach>
					</select>

				</div>
				<!-- <div class="wrap"></div> -->
				<div class="wrap">
					<label>내가사는동네:</label> <br /> <select id="city" name="city"
						class="form-control w300" required="required">
						<option value="">-----------동네를 골라주세요-----------</option>
						<%-- <c:forEach var="city" items="${city}">
							<option value="${city.id}" label="${city.name}" />
						</c:forEach> --%>
					</select>
					<script>
						$(
								function() {
									$('#state')
											.change(
													function() {
														//alert($(this).serialize());
														var state = $(this)
																.serialize();
														$
																.ajax({
																	url : '/user/loca',
																	type : 'post',
																	data : state,
																	success : function(
																			data) {
																		var searchArr = $(
																				'#city')
																				.find(
																						"option");
																		for ( var i in data) {
																			var $id = data[i].id;
																			var $name = data[i].name;

																			searchArr += "<option value=" +$id + ">"
																					+ $name
																					+ "</option>";

																		}
																		document
																				.getElementById("city").innerHTML = searchArr;
																		/* var tb = $("<table />");
																		for(var i in data){
																			var $id = data[i].id;
																			var $name = data[i].name;
																			
																			var row = $("<tr />").append(
																				$("<td />").text($id),
																				$("<td />").text($name)
																			);
																			tb.append(row);
																		}
																		$(".wrap").append(tb); */
																	}
																});
													});
								})
					</script>
				</div>
			</div>

			<span>내가 사는 동네가 맞나요?</span><br /> <span>맞으면 인증버튼을 눌러주세요!</span><br />
			<%-- <c:if test="${cnt != 0 }">
				<a href="" onclick="if(!confirm('이미 등록된 동네가 있습니다.')){return false;}"
					id="check_btn" style="font-size: 20px; margin: 10; color: black;"
					class="btn ba"> 
					인증하기
				</a>
			</c:if>
			<c:if test="${cnt == 0}"> --%>
				<button id="check_btn" class="btn ba" type="submit"
					onclick="return confirm('인증 하시겠습니까?')"
					style="font-size: 20px; margin: 10; color: black;">인증하기</button>
			<%-- </c:if> --%>
		</form>


	</div>



	<%@ include file="../include/bottom.jsp"%>
</body>
</html>