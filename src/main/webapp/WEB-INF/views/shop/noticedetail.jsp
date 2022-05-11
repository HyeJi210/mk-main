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
<style>
div .abcc{
	width:677px;
	height:400px;
	margin-left:auto;
	margin-right:auto;
}
</style>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<div class="container">
		<br />
		<br />
		<div class="abcc">
			<h1><b>${notice.title}</b></h1><br/>
			<span style="font-size:15px;float:right;margin-right:10px;">조회수: ${notice.click }</span><br /><br />
			<span style="font-size: 18px;">안녕하세요 딸기에용~! 딸기마켓을 이용하다 궁금한 점이 있으셨나요?</span>  <br /><br />
			<span style="font-size: 18px;">딸기이웃분들이 자주 궁금해하는 부분들을 '자주 묻는 질문'에서 답해드릴려고 해요~  </span>
			<br /><br /> <br /><br /> 
			<span style="font-size: 18px; margin-bottom:20px;">${notice.detail}</span><br /><br/>
			
		</div>
		<a href="/shop/notice" style="float:right;margin-right:50px;"class="btn btn-dark">목록으로</a>
	</div>

	<%@ include file="../include/bottom.jsp"%>

</body>
</html>