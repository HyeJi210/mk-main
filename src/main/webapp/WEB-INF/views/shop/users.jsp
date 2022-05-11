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
<title>딸기마켓 회원프로필</title>
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
div .orderproduct {
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
	margin-bottom: 600px;
	width: 800px;
	height: auto;
}

div .ab {
	margin-left: auto;
	margin-right: auto;
	margin-top: 30px;
	margin-bottom: 30px;
	display: block;
	width: 800px;
	height: auto;
	display: block;
}

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

.noimg {
	width: 30px;
	height: 30px;
	border-radius: 8px;
}
</style>
<body>
	<%@ include file="../include/nav.jsp"%>

	<div class="container">

		<div class="ab">
			<label style="margin-left: 10px;"><img
				src="/images/blank-profile-picture-973460_1280.png" class="noimg"></label>
			<span
				style="margin-left: 10px; font-size: 22px; font-weight: 600; line-height: 1.5; letter-spacing: -0.6px; color: #212529;"><b>${user.nickname}</b></span>
			<br /> <span style="margin-left: 50px; font-size: 17px;"> <c:choose>
					<c:when test="${fn:length(user.address) gt 8}">
						<c:out value="${fn:substring(user.address, 0, 7)}">
						</c:out>
					</c:when>
					<c:otherwise>
						<c:out value="${user.address}">
						</c:out>
					</c:otherwise>
				</c:choose>
			</span> <span style="margin-left: 6px; font-size: 17px;"> <c:choose>
					<c:when test="${fn:length(user.addrplus) gt 6}">
						<c:out value="${fn:substring(user.addrplus, 2, 5)}">
						</c:out>
					</c:when>
					<c:otherwise>
						<c:out value="${user.addrplus}">
						</c:out>
					</c:otherwise>
				</c:choose></span>

		</div>
		<div class="orderproduct" id="product">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active" href="#product">판매
						상품</a></li>
				<li class="nav-item"><a class="nav-link" href="#review">거래
						후기</a></li>
				<li class="nav-item"><a class="nav-link" href="#praise">매너
						칭찬</a></li>

			</ul>

			<div class="aa">
				<c:choose>
					<c:when test="${pcount == 0 }">
						<div class="empty" style="margin-top: 20px;">
							<span
								style="margin-top: 20px; margin-left: 20px; font-size: 20px;">게시물이
								없습니다</span> <br /> <a href="/user/write"
								style="margin-left: 20px; font-size: 18px; color: black;">중고제품
								판매하러 가기</a>
						</div>
					</c:when>
					<c:otherwise>
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
											<%-- <c:forEach var="l" items="${loca}">
												<c:if test="${l.user.id == p.user.id }"> --%>
													<span style="margin: 2; font-size: 15px; color: #868e96;">${p.user.state.name}
														${p.user.city.name}</span>
												<%-- </c:if>
											</c:forEach> --%>
										</div>
										<div class="d">
											<span style="font-size: 15px;"><b><fmt:formatNumber
														value="${p.price}" pattern="###,###,###" />원</b></span>
										</div>

										<div class="name">
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
											<span>조회수 ${p.click}</span>
										</div>
									</div>


								</c:if>

							</c:forEach>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<div class="orderproduct" id="review">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link" href="#product">판매
						상품</a></li>
				<li class="nav-item"><a class="nav-link active" href="#review">거래
						후기</a></li>
				<li class="nav-item"><a class="nav-link" href="#praise">매너
						칭찬</a></li>

			</ul>
		</div>

		<div class="orderproduct" id="praise">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link" href="#product">판매
						상품</a></li>
				<li class="nav-item"><a class="nav-link" href="#review">거래
						후기</a></li>
				<li class="nav-item"><a class="nav-link active" href="#praise">매너
						칭찬</a></li>

			</ul>
		</div>
	</div>

	<%@ include file="../include/bottom.jsp"%>
</body>
</html>