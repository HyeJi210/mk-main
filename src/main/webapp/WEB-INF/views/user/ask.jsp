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
<title>딸기마켓 1:1문의</title>
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
<script language="javascript">
	function captureReturnKey(e) {
		if (e.keyCode == 13 && e.srcElement.type != 'textarea')
			return false;
	}
</script>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<br />
	<div class="container">
		<form:form method="post" modelAttribute="ask" autocomplete="off"
		   onkeydown="return captureReturnKey(event)">
		   <sec:authentication property="user.id" var="currentid" />
		   <form:hidden path="user" value="${currentid}" />
		   <div class="form-group">
			  <label>제목:</label>
			  <form:input path="title" class="form-control w400"
				 required="required" />
		   </div>
		   <div class="form-group">
			  <label>내용:</label>
			  <form:textarea path="detail" class="form-control w4h2" style="font-size: large;"
				 required="required" />
		   </div>
		   <button type="submit" style="background-color: #F3969A;"
			  onclick="return confirm('작성 하시겠습니까?')" class="btn">작성</button>
		</form:form>
	 </div>

	<%@ include file="../include/bottom.jsp"%>

</body>
</html>