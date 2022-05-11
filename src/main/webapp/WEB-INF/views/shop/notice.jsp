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
<title>딸기마켓 자주묻는질문</title>
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
<body>
	<%@ include file="../include/nav.jsp"%>
	<div class="container">
		<h1 style="margin:30"><b>자주묻는질문/공지사항</b></h1>
		<table class="table table-hover"
			style="width: 85%; margin-left: auto; margin-right: auto;">
			<thead>
				<tr style="text-align: center;">
					<th>제목</th>
					<th>작성일</th>
					<th>작성자</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${notice}">
					<tr style="text-align: center;">

						<td><a href="/shop/noticedetail/${n.id}">${n.title}</a></td>
						<td><span style="margin-left: 30px; font-size: 16px;"><fmt:formatDate
									value="${n.writedate}" pattern="yyyy.MM.dd HH:mm:ss" /></span></td>
						<td>관리자</td>
						<td>${n.click}</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>