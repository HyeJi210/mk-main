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
<title>딸기마켓 제품보기</title>

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
<script src="/res/js/slidejquery.js"></script>
<script src="/res/js/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="/res/jquery.bxslider.min.css">
<style>
#gallery_wrap {
   margin: 0 auto;
   margin-top:10px;
   width: 640px;
}

.imgg {
   margin-left: auto;
   margin-right: auto;
   margin-top: 30px;
   margin-bottom: 60px;
   display: block;
   width: 500px;
   height: 400px;
   overflow: hidden;
   border-radius: 8px;
   display: block;
}

div .ab {
   margin-left: auto;
   margin-right: auto;
   display: block;
   width: 70%;
   height: 40px;
   margin-right: auto;
   display: block;
   width: 677px;
   height: 40px;
   margin-bottom: 30px;
   cursor: pointer;
}

div .abcc {
   margin-left: auto;
   margin-right: auto;
   display: block;
   width: 677px;
   height: 400px;
   margin-right: auto;
   display: block;
   margin-bottom: 10px;
}

div .a {
   margin-left: auto;
   margin-right: auto;
   display: block;
   width: 40px;
   height: 44px;
   margin-right: auto;
   display: block;
}

div .nick {
   margin-left: auto;
   margin-right: auto;
   display: block;
   width: 78px;
   height: 40px;
   margin-right: auto;
   display: block;
}

div .z {
   margin-left: auto;
   margin-right: auto;
   display: block;
   width: 132px;
   height: 44px;
   margin-right: auto;
   display: block;
}

.noimg {
   width: 30px;
   height: 30px;
   border-radius: 8px;
}

div .ddd{
   width: 677px;
   height: 100px;
   margin-left: auto;
   margin-right: auto;
}

</style>
<script>
   $(function() {
      $('.slide_gallery').bxSlider({
         auto : true,
         autoControls : true,
         stopAutoOnClick : true,
         pager : true,
         controls: true
      });
   });
</script>
</head>
<body>
   <%@ include file="../include/nav.jsp"%>
   <div style="display: flex; flex-direction:column; align-itmes:center"> <!-- 0509 추가 : 가운데로 정렬??  -->
	<!-- 기존에 있었던 코드 
		<div class="container">
		<div id="gallery_wrap">
			<ul class="slide_gallery">
				<c:forEach var="pi" items="${pi}">
					<li><img src="/images/${pi.filename}" class="imgg"></li>
				</c:forEach>
			</ul>
		</div> -->
      

      <div class="ab" onclick="location.href='/shop/users/${p.user.id}'" style="margin-top: 30px;">
         <label>
            <img src="/images/blank-profile-picture-973460_1280.png" class="noimg">
         </label>
         <span style="margin-left: 10px; font-size: 18px; font-weight: 600; line-height: 1.5; letter-spacing: -0.6px; color: #212529;">
            <b>${p.user.nickname}</b>
         </span>
         <br /> 
         <span style="font-size: 16px;"> 
            <c:choose>
               <c:when test="${fn:length(p.user.address) gt 8}">
                  <c:out value="${fn:substring(p.user.address, 0, 7)}"> </c:out>
               </c:when>
               <c:otherwise>
                  <c:out value="${p.user.address}"> </c:out>
               </c:otherwise>
            </c:choose>
         </span> 
         <span style="font-size: 16px;"> 
            <c:choose>
               <c:when test="${fn:length(p.user.addrplus) gt 6}">
                  <c:out value="${fn:substring(p.user.addrplus, 2, 5)}">
                  </c:out>
               </c:when>
               <c:otherwise>
                  <c:out value="${p.user.addrplus}">
                  </c:out>
               </c:otherwise>
            </c:choose>
         </span>
      </div>
	  <!-- 0509 추가 : 이미지가 가운데로 보이도록 ? -->
      <div id="gallery_wrap">
         <ul class="slide_gallery">
            <c:forEach var="pi" items="${pi}">
               <li><img src="/images/s/s_${pi.filename}" class="imgg"></li>
            </c:forEach>
         </ul>
      </div>

      <div class="abcc">
         <span style="font-size: 20px;"><b>${p.title}</b></span>
         <span>&nbsp;|&nbsp;</span>
         <span style="font-size: 16px;">${p.category.name}</span>
         <br />
         
         <span style="font-size: 18px;"><b>${p.detail}</b></span>
         <br />

         <span style="color: orange; font-size: 18px;">${p.price}원</span>
         <br /> 

         <span style="font-size: 16px;"><fmt:formatDate value="${p.writedate}" pattern="yy.MM.dd HH:mm" /></span> 
         <br />
         
         <div>
            <label style="font-size: 18px;">조회수</label>
            <span style="height: 15px; margin-left: 5px; font-size: 20px;">${p.click}</span>
         </div>
            
         <div>
            <label style="font-size: 18px;">관심</label>
            <span style="height: 15px; margin-left: 5px; font-size: 20px;">${pcnt}</span>
         </div>

         <div>
            <label style="font-size: 18px;">댓글</label>
            <span style="height: 15px; margin-left: 5px; font-size: 20px;">${ccnt}</span>
         </div>

         <br />
         <sec:authorize access="not authenticated">
            <a href="" onclick="if(!confirm('로그인후 사용가능합니다')){return false;}" class="btn btn-dark"> 
               <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
               관심상품
            </a>
         </sec:authorize>

         <sec:authorize access="authenticated">
            <sec:authentication property="user.id" var="currentid" />
            <c:if test="${interest == 0}">
               <form:form method="post" modelAttribute="interest_product">
                  <form:hidden path="product" value="${p.id}" />
                  <form:hidden path="user" value="${currentid}" />
                  <button style="color: black;" type="submit" class="btn" onclick="return confirm('관심상품에 등록 하시겠습니까?')">
                     <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>관심상품
                  </button>
               </form:form>
            </c:if>
            <c:if test="${interest == 1}">
               <a href="/shop/delete/${p.id}" class="btn" style="color: black;" onclick="if(!confirm('관심상품에서 삭제 하시겠습니까?')){return false;}">
                  <span class="glyphicon glyphicon-star" style="color: red; margin-right: 5px;" aria-hidden="true"></span>관심상품
               </a>
            </c:if>
         </sec:authorize>

         <a href="/shop/category/${p.category.id}" class="btn btn-dark">목록으로</a>

         <sec:authorize access="authenticated">
           <!-- 0509 쪽지보내기 사용 안하므로 주석처리
		 	<c:if test="${p.user.id!=currentid}">
               <a onclick="window.open('/user/message/${p.user.nickname}','쪽지보내기','width=430,height=500,location=no,status=no,scrollbars=yes');" style="margin: 10;" class="btn btn-dark"> 
                  <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                  쪽지보내기
               </a>
            </c:if> -->

            <c:if test="${p.user.id==currentid}">
               <a href="/shop/pdelete/${p.id}" onclick="if(!confirm('상품을 삭제 하시겠습니까?')){return false;}" class="btn btn-dark">삭제</a>
            </c:if>
         </sec:authorize>


         <!--  댓글  -->
         <div class="container" style="margin: 40px 0px;">
            <form name="commentInsertForm">
               <div class="input-group">
                  <label for="content" style="display: block; font-size: 15px;">comment</label>
                  <input type="hidden" name="pid" value="${p.id}" /> 
                  <input type="text" class="form-control w400" id="content" name="content" placeholder="내용을 입력하세요."> 
                  <span class="input-group-btn">
                     <sec:authorize access="authenticated">
                        <sec:authentication property="user.id" var="currentid" />
                        <input type="hidden" name="uid" value="${currentid}" />
                     </sec:authorize>
                     <button class="btn btn-dark" type="button" name="commentInsertBtn">등록</button>
                  </span>
               </div>
            </form>
         </div>

         <sec:authorize access="not authenticated">
            <span style="font-size: 13px;">회원들만 댓글을 볼 수 있습니다</span>
            <br />
            <a href="/shop/login" style="font-family: 'Poor Story', cursive; font-size: 18px; color: black;">로그인하러 가기</a>
            <br />
            <a href="/shop/register" style="font-family: 'Poor Story', cursive; font-size: 18px; color: black;">회원 가입 하러 가기</a>
         </sec:authorize>
         <div class="container" style="margin-bottom: 200px;">
            <div class="commentList"></div>
         </div>


      </div>
      <br /> <br />
   </div>
   <%@ include file="commentS.jsp"%>
   <%@ include file="../include/bottom.jsp"%>
</body>
</html>