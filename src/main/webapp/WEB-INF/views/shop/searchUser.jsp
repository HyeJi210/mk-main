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
<title>딸기마켓 회원검색결과</title>
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
	font-size:13px;
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
th {
	font-size: 20px; 
	color: #000000; 
	font-weight: bold;
	padding: 5px;
}

</style>
<body>
<%@ include file="../include/nav.jsp"%>
	<br />
	<div class="container" style="text-align: center;">
		<form action="/shop/searchUser" class="form-inline my-2 my-lg-0" style="text-align: right; display: block;">
			<span style="font-size: 15px; color: #000000; font-weight: bold;">회원 검색&nbsp;&nbsp;</span>
			<input class="form-control mr-sm-2" type="search" name="word" placeholder="닉네임을 입력하세요" aria-label="Search" style="width: 300px; font-size: 14px;">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">
				<span class="glyphicon glyphicon-search" style="margin-top: 10px; margin: 2px;"></span>
			</button>
		</form>
		<br />
		<br />

		<table border="2" style="margin: auto; text-align: center;">
			<tr>
				<th style="background-color: aliceblue; width: 100px;">
					번호
				</th>
				<th style="background-color: aliceblue; width: 150px;">
					닉네임
				</th>
				<th style="background-color: aliceblue; width: 500px;">
					주소
				</th>
			</tr>
			<c:forEach var="p" items="${list}">
				<tr>
					<th>
						<span><c:out value="${p[0]}"></c:out></span> <!-- 에러메시지 출력 -->
					</th>
					<th>
						<!-- 닉네임 누르면 회원 창으로 ㄱㄱ-->
						<span onclick="location.href='/shop/product/${p[0]}'"><c:out value="${p[1]}"></c:out></span>
					</th>
					<th>
						<c:out value="${p[2]}"></c:out>
					</th>
				</tr>
			</c:forEach>
		</table>
	</div>
<%@ include file="../include/bottom.jsp"%>
</body>
</html>