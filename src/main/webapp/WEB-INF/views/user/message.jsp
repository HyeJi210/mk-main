<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url var="R" value="/" />
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>딸기마켓 쪽지보내기</title>
<!-- jQuery -->
<script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
body {
	font-family: 'Poor Story', cursive;
}
</style>
</head>
<body>
	<div class="container">
		<h3>쪽지보내기</h3>
		<hr />
		<div class="mes_send" style="display: block;">
			<span style="margin-right: 5px;">받는사람</span> <span>${receiveU.nickname}(<c:choose>
					<c:when test="${fn:length(receiveU.userId) gt 5}">
						<c:out value="${fn:substring(receiveU.userId, 0, 4)}***">
						</c:out>
					</c:when>
					<c:otherwise>
						<c:out value="${receiveU.userId}">
						</c:out>
					</c:otherwise>
				</c:choose>)
			</span>
			<hr />
		</div>
		<div class="mes_write">
			<form:form method="post" modelAttribute="message" autocomplete="off">
				<div class="form-group">
					<form:input path="title" required="required"
						placeholder="제목을 입력해주세요" class="form-control w100" />
				</div>
				<div class="form-group">
					<form:input path="detail" required="required" style="height:200px;"
						placeholder="쪽지 내용을 입력해주세요" class="form-control" />
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-dark"
						onclick="if(confirm('쪽지를 보내시겠습니까?')){window.close();window.opener.location.href='/user/msg/send';}">보내기</button>
					<a href="#" class="btn btn-default" onclick="window.close();">취소</a>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>