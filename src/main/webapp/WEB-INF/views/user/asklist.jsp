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
<title>딸기마켓 내 1:1문의목록</title>
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
	<br />
	<div class="container">
		<a href="/user/ask" class="btn btn-dark" style="float:right; margin-right:80px;">1:1 문의하기</a><br />
		<table style="width: 85%; margin-left: auto; margin-right: auto;"
			class="table table-hover">
			<thead>
				<tr style="text-align: center;">
					<th>제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${acnt != 0}">
					<c:forEach var="a" items="${asklist}">
						<tr style="text-align: center;">
							<td><a href="/user/askdetail/${a.id}">${a.title}</a></td>
							<td><span style="margin-left: 30px; font-size: 16px;"><fmt:formatDate
									value="${a.writedate}" pattern="yyyy.MM.dd HH:mm:ss" /></span></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${acnt == 0}">
					<td colspan="2" align="center" style="height: 70px;">작성된 1:1 문의글이 업습니다</td>
				</c:if>
			</tbody>
		</table>
	</div>

	<%@ include file="../include/bottom.jsp"%>

</body>
</html>