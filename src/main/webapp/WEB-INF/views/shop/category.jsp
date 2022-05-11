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
<title>딸기마켓 상품목록</title>
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
<!-- <script src="res/js/jquery.js"></script> -->

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

.abcd {
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
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function() {
		var abcdW = $(".abcd").width();
		var abcdH = $(".abcd").height();
		$(".abcd").mouseover(function() {
			$(this).animate({
				height : "270",
				width : "190"
			});
		}).mouseleave(function() {
			$(this).animate({
				width : abcdW,
				height : abcdH
			});
		});
	});
</script>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>

	<div class="container">
		<c:forEach var="p" items="${product}">
			<c:forEach var="pi" items="${product_image}">
				<c:if test="${p.id == pi.productid}">
					<div class="abcd well"
						onclick="location.href='/shop/product/${p.id}'">
						<img src="/images/s/s_${pi.filename}" class="imgg">

						<div class="name">
							<span style="font-size: 17px; color: #585858; font-weight: bold;"><b><c:choose>
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
						<%-- <div class="d">
								<label>글쓴이</label> <span>${p.user.nickname}</span>
							</div> --%>

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

	</div>

	<%-- ${test} --%>
	<%@ include file="../include/bottom.jsp"%>

</body>
</html>