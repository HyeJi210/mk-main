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
<title>딸기마켓 내 1:1문의 상세보기</title>
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
div .abcc {
	width: 677px;
	height: 200px;
	margin-left: auto;
	margin-right: auto;
}
div .ddd{
	width: 677px;
	height: 100px;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<br />
	<div class="container">
		<br /> <br />
		<div class="abcc">
			<h1>
				<b>제목: </b>${ask.title}</h1>
			<br /> <span style="font-size: 18px;"><b>문의내용: </b>${ask.detail}</span>
			<br />
			<hr />
		</div>

		<!--  댓글  -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="ddd">
				<label for="content">comment</label>
				<form name="answerInsertForm">
					<div class="input-group">
						<input type="hidden" name="ask" value="${idd}" /> <input
							type="text" class="form-control w400" id="content" name="content"
							placeholder="답변을 입력하세요."> <span class="input-group-btn">
							<button class="btn btn-dark" type="button" name="answerInsertBtn">등록</button>
						</span>
					</div>
				</form>
			</div>
		</sec:authorize>

		<div class="ddd" style="margin-bottom: 100px;">
			<div class="answerList"></div>
		</div>
	</div>
	<%@ include file="AnswerS.jsp"%>
	<%@ include file="../include/bottom.jsp"%>

</body>
</html>