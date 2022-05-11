<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>딸기마켓 글쓰기</title>
<style>
.aa {
	font-size: 1.8em;
}
.select_img img{
	margin:20px 0;
}
.select_img{
	width: 100px;
	height: 100px;
}
</style>
</head>
<body>
	<%@ include file="../include/nav.jsp"%>
	<div class="container">
		<hr />
		<br />

		<sec:authentication property="user.id" var="currentid" />
		<div class="aa">
			<form action="/user/fileinsert" method="post"
				enctype="multipart/form-data" autocomplete="off">
				<input type="hidden" id="userid" name="userid" value="${currentid}">
				
				<div class="form-group">
					<label for="file">파일 업로드 </label>
					<input multiple="multiple" type="file" name="files" required />
				</div>
				
				<div class="form-group">
					<label for="title">Title</label><input type="text"
						class="form-control w200" id="title" name="title"
						placeholder="제목을 입력하세요" required />
				</div>
				
				<div class="form-group">
					<label for="category">Category</label> <select id="category"
						name="category" class="form-control w200">
						<c:forEach var="c" items="${category}">
							<option value="${c.id}">${c.name}</option>
						</c:forEach>
					</select>
				</div>
				
				<div class="form-group">
					<label for="price">Price</label><input type="text"
						class="form-control w200" id="price" name="price"
						placeholder="가격을 입력하세요" required />
				</div>
				
				<div class="form-group">
					<label for="detail">Detail</label><input type="text"
						class="form-control w4h2" id="detail" name="detail"
						placeholder="설명을 입력하세요" required />
				</div>
				
				<br />
				<button type="submit" class="btn btn-dark">작성</button>
			</form>
		</div>
		<br />
		<hr />
	</div>

	<%@ include file="../include/bottom.jsp"%>
</body>
</html>