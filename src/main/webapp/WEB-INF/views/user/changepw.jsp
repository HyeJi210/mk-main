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
<title>비밀번호 변경</title> <!-- title 수정 (0506) -->
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
   <div class="container" style="margin-top: 35px; display:flex;  flex-direction: column; align-items: center;">
      <h1>비밀 번호 변경</h1><br />
      <table style="width: 85%; margin-left: auto; margin-right: auto;"
         class="table">
         <tr>
            <td style="width: 85%;">
               <form method="post" action="/user/changepw">
                  <div class="form-group">
                     <label>변경할 비밀번호:</label> 
                     <!-- 패스워드 길이 최소 8 ~ 최대 20자 까지, 필수로 입력하도록 수정 (0506) -->
                     <input type="password" minlength="8" maxlength="20" name="passwd" class="form-control w200" required="required" />
                  </div>
                  <hr />
                  <button type="submit" onClick="return confirm('변경하시겠습니까?') "
                  class="btn" style="background-color: #F3969A;"> 변경 
               </button>
      
               </form> <c:if test="${ param.error != null }">
                  <div class="mt5">다시 입력하세요..</div>
               </c:if>
            </td>
         </tr>
         
      </table>
   </div>

   <%@ include file="../include/bottom.jsp"%>

</body>
</html>

