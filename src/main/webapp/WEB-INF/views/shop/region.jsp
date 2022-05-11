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
<title>${stst} ${ctct} 인기상품</title>
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
	height: 700px;
}
</style>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<br />
	<div class="container">
		<h1>${stst} ${ctct} 인기상품</h1>
		<br /><br />
		<form name="url">
			<select id="state" name="url" onchange="moveurl(this.value);"
				style="margin-left: auto; margin-right: 20px;"
				class="form-control w200" required="required">
				<option value="/shop/hotproduct">지역을 골라주세요</option>
				<c:forEach var="state" items="${s}">
					<option value="/shop/region/${state.name}" <c:if test="${stst == state.name}">selected='selected'</c:if>>${state.name}</option>
				</c:forEach>
			</select>
			<script>
				function moveurl(url) {
					location.href = url;
				}
			</script>

		</form>
		<form name="url">
			<select id="city" name="url" onchange="moveurl(this.value);"
				style="margin-top: 3px; float: right; margin-right: 20px;"
				class="form-control w200">
				<option value="/shop/region/${stst}">동네를 골라주세요</option>
				<c:forEach var="city" items="${city}">
					<option value="/shop/region/${stst}/${city.name}" <c:if test="${ctct == city.name}">selected='selected'</c:if> >${city.name}</option>
				</c:forEach>
			</select>
			<script>
				function moveurl(urll) {
					location.href = urll;
				}
			</script>
		</form>


		<br /> <br />

		<c:forEach var="p" items="${product}">
			<c:forEach var="pi" items="${product_image}">
				<c:if test="${p.id == pi.productid}">
					<div class="abcd well"
						onclick="location.href='/shop/product/${p.id}'">
						<img src="/images/s/s_${pi.filename}" class="imgg">

						<div class="name">
							<span style="font-size: 17px; color: #585858; font-weight: bold;"><b><c:choose>
										<c:when test="${fn:length(p.title) gt 13}">
											<c:out value="${fn:substring(p.title, 0, 12)}">...
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
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>