<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url var="R" value="/" />
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.4.1/minty/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link
	href="https://fonts.googleapis.com/css?family=Cute+Font|Poor+Story&display=swap&subset=korean"
	rel="stylesheet">
<link rel="stylesheet" href="${R}res/font.css">
<style>
</style>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light">
			<a href="${R}shop/index"><img src="/images/strawberry.jpg" align="middle"
				style="height: 60px; weight: 60px;"></a><a class="navbar-brand"
				style="color: pink; font-family: 'Poor Story', cursive; font-size: 4em; margin-right: 20px;"
				href="${R}shop/index">딸기마켓</a>
			<!-- <button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button> -->
			<form action="/shop/search" class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search" name="word"
					placeholder="Search" aria-label="Search"
					style="width: 250px;">
				<button class="btn btn-outline-success my-2 my-sm-0"
					style="margin-top: 15px;" type="submit">
					<span class="glyphicon glyphicon-search"
						style="margin-top: 10px; margin: 2px;"></span>
				</button>
			</form>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav mr-auto">
					<sec:authorize access="not authenticated">
						<li class="nav-item" style="margin-top: 13px;">
							<a href="/shop/login" class="nav-item" style="font-family: 'Poor Story', cursive; font-size: 13px; color: black; margin: 5px;">로그인</a>
						</li>
						<li class="nav-item" style="margin-top: 13px;">
							<a href="/shop/register" class="nav-item" style="font-family: 'Poor Story', cursive; color: black; font-size: 13px; margin: 5px;">회원가입</a>
						</li>
					</sec:authorize>
					<sec:authorize access="authenticated">
						<sec:authentication property="user.id" var="currentid" />
						<li class="nav-item" style="margin-top: 13px;">
							<a href="/shop/users/${currentid}" class="nav-item" style="font-family: 'Poor Story', cursive; color: black; font-size: 13px;">
								<span class="glyphicon glyphicon-user" style="margin-right: 3px;"></span>내 정보
							</a>
						</li>
						<li class="nav-item" style="margin-top: 13px;">
							<a class="nav-item" style="font-family: 'Poor Story', cursive; color: black; font-size: 13px; margin: 3px;" href="${R}user/logout_processing">로그아웃</a>
						</li>
						<li class="nav-item" style="margin-top: 13px;">
							<a href="/user/interest" class="nav-item" style="font-family: 'Poor Story', cursive; color: black; font-size: 13px; margin: 3px; color: black;">관심 상품</a>
						</li>
						<li class="nav-item" style="margin-top: 13px;">
							<a href="/user/write" class="nav-item" style="font-family: 'Poor Story', cursive; color: black; font-size: 13px; margin: 3px; color: black;">글쓰기</a>
						</li>
						<li class="nav-item" style="margin-top: 13px;">
							<a href="/shop/searchUser?word=" class="nav-item" style="font-family: 'Poor Story', cursive; color: black; font-size: 13px; margin: 3px; color: black;">회원 검색</a>
						</li>
						<li class="nav-item" style="margin-top: 13px;">
							<a href="/user/location" class="nav-item" style="font-family: 'Poor Story', cursive; color: black; font-size: 13px; margin: 3px; color: black;">동네 인증</a>
						</li>
						<!-- 
						<li class="nav-item" style="margin-top: 13px;">
							<a href="/user/msg/send" class="nav-item" style="font-family: 'Poor Story', cursive; color: black; font-size: 13px; margin: 3px; color: black;">쪽지함</a>
						</li>
						-->
					</sec:authorize>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"><b>문의사항</b> </a>
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">

							<a class="btn btn-light btn-xs" href="/shop/notice">공지사항</a> <br />
							<a class="btn btn-light btn-xs" href="/shop/notice">자주묻는질문</a>
							<sec:authorize access="authenticated">
								<a class="btn btn-light btn-xs" href="/user/changepw">비밀번호 변경</a>
								<a class="btn btn-light btn-xs" href="/user/asklist">1:1문의</a>
							</sec:authorize>
						</div></li>
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="nav-item"><a class="nav-link"
							href="${R}admin/index"><b>관리자</b></a></li>
					</sec:authorize>
				</ul>
			</div>
		</nav>
		<hr />

		<div>
			<ul>
				<li><a href="${R}shop/hotproduct"
					style="color: red; font-size: 1.5em; margin-right: 10px; ">인기상품</a></li>
				<c:forEach var="c" items="${category}">
					<li><a href="${R}shop/category/${c.id}"
						style="color: black; font-size: 1.5em; margin-right: 10px;">${c.name}</a></li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>