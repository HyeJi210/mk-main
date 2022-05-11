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
<title>딸기마켓</title>
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
</head>
<style>
.imgg {
	width: 100%;
	position: relative;
	height: 130px;
	overflow: hidden;
	border-radius: 8px 8px 0 0;
	/* max-width: 200px;
	max-height: 200px;
	overflow: hidden; */
}

.imggg {
	width: auto;
	height: auto;
}

.pl {
	width: 220px;
	height: 280px;
	margin: 10px;
}

ul.aa li {
	list-style-type: none;
	float: left;
	margin-left: 20px;
	display: inline-block;
}

div .abcd {
	height: 250px;
	width: 180px;
	float: left;
	margin: 25px;
	cursor: pointer;
}

div .well {
	padding: 0px;
	background-color: #f8f9fa;
	border-radius: 8px;
}

div .name {
	padding: 5px;
	font-size: 13px;
}

div .d {
	padding: 5px;
	border-bottom: 1px solid #e9ecef;
}

h1 {
	margin-left: 30px;
	margin-right: auto;
	display: block;
}

div .aa {
	width: 1100px;
	height: 500px;
}

p .bb {
	width: 100%;
	height: 250px;
	/* align: center; */
	/* margin-left:auto;
	margin-right:auto;
	display:block; */
	/* text-align: center;
	align:center; */
}

.child {
	line-height: 20px;
	display: table-cell;
	font-size: 15px;
}

.itemm {
	display: none;
}

.mimg {
	weight: 75%;
	height: 75%;
}

.maindv {
	width: 100%;
	height: 60%;
}

.sunwi {
	font-size: 2em;
	position: absolute;
	left: 980px;
	color: gray;
}
</style>
<body>
	<%@ include file="../include/nav.jsp"%>
	<br />
	<div class="container">
		<hr />
		<!-- <span class="child" style=""><b>인기검색어</b></span><br /> -->
		<!-- <button type="button" class="btn orderOpne_bnt" style="color: black;">
			<span class="glyphicon glyphicon-chevron-down" style="margin: 4px;"></span>
		</button>
		<script>
			$(".orderOpne_bnt").click(function() {
				$(".itemm").slideDown();
				$(".orderOpne_bnt").slideUp();
			});
		</script>
		<div class="itemm">
			<button type="button" class="btn cancel_btn">
				<span class="glyphicon glyphicon-chevron-up"
					style="color: black; margin: 4px;"></span>닫기
			</button>
			<script>
				$(".cancel_btn").click(function() {
					$(".itemm").slideUp();
					$(".orderOpne_bnt").slideDown();
				});
			</script> -->
		<div class="maindv">
			<img src="/images/main.JPG" class="mimg"> 
			<a href="/shop/search?word=${scnt[0].name}">
				<span class="sunwi" style="top: 30%;">1. ${scnt[0].name} (${scnt[0].cnt})</span>
			</a>
			<a href="/shop/search?word=${scnt[1].name}">
				<span class="sunwi" style="top: 35%;">2. ${scnt[1].name} (${scnt[1].cnt})</span>
			</a> 
			<a href="/shop/search?word=${scnt[2].name}">
				<span class="sunwi" style="top: 40%;">3. ${scnt[2].name} (${scnt[2].cnt})</span>
			</a> 
			<a href="/shop/search?word=${scnt[3].name}">
				<span class="sunwi"	style="top: 45%;">4. ${scnt[3].name} (${scnt[3].cnt})</span>
			</a> 
			<a href="/shop/search?word=${scnt[4].name}">
				<span class="sunwi" style="top: 50%;">5. ${scnt[4].name} (${scnt[4].cnt})</span>
			</a> 
			<a href="/shop/search?word=${scnt[5].name}">
				<span class="sunwi" style="top: 55%;">6. ${scnt[5].name} (${scnt[5].cnt})</span>
			</a> 
			<a href="/shop/search?word=${scnt[6].name}">
				<span class="sunwi" style="top: 60%;">7. ${scnt[6].name} (${scnt[6].cnt})</span>
			</a>
		</div>
		
		<hr />
		<div class="aa">
			<h1>딸기마켓 최근 상품</h1>
			<c:forEach var="p" items="${product}">
				<c:forEach var="pi" items="${product_image}">
					<c:if test="${p.id == pi.productid}">
						<div class="abcd well"
							onclick="location.href='/shop/product/${p.id}'">
							<img src="/images/s/s_${pi.filename}" class="imgg">

							<div class="name">
								<span
									style="font-size: 17px; color: #585858; font-weight: bold;"><b><c:choose>
											<c:when test="${fn:length(p.title) gt 13}">
												<c:out value="${fn:substring(p.title, 0, 12)}...">
												</c:out>
											</c:when>
											<c:otherwise>
												<c:out value="${p.title}">
												</c:out>
											</c:otherwise>
										</c:choose></b></span>
							</div>
							<div>
								<span style="margin: 2; font-size: 15px; color: #868e96;">${p.user.state.name}
									${p.user.city.name}</span>
							</div>
							<div class="d">
								<span style="font-size: 15px;"><b><fmt:formatNumber
											value="${p.price}" pattern="###,###,###" />원</b></span>
							</div>

							<div class="name">

								<%-- <c:if test="${cnt.product.id == p.id }"> --%>
								<!-- <span style="margin-right: 10px;">관심 0</span> -->
								<%-- </c:if> --%>
								<span>조회수 ${p.click}</span>

								<c:forEach var="c" items="${cnt}">
									<c:choose>
										<c:when test="${p.id == c.id}">
											<span style="margin-left: 2px;">관심: ${c.cnt}</span>
										</c:when>
										<c:when test="${c.id == null}">관심: 0</c:when>
									</c:choose>
								</c:forEach>
								<c:forEach var="c" items="${commentcnt}">
									<c:choose>
										<c:when test="${p.id == c.id}">
											<span style="margin-left: 2px;">댓글: ${c.cnt}</span>
										</c:when>
										<c:when test="${c.id == null}">댓글: 0</c:when>
									</c:choose>
								</c:forEach>


							</div>
						</div>


					</c:if>

				</c:forEach>
			</c:forEach>



		</div>

		<div class="container">${weather_info}</div>

		<script>
			$(document).ready(function() {
				drawTable();
			})

			function drawTable() {
				$(".tbl_weather").attr("class", "table");
			}
		</script>

		<%-- <c:forEach var="cnt" items="${cnt}"> --%>
		<%-- <span>${cnt}</span> --%>
		<%-- </c:forEach> --%>
	</div>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>