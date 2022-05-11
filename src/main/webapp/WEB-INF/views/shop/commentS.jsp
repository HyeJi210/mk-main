<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	var id = '${id}'; //게시글 번호

	$('[name=commentInsertBtn]').click(function() { //댓글 등록 버튼 클릭시 
		var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
		commentInsert(insertData); //Insert 함수호출(아래)
	});

	//댓글 목록 
	function commentList() {
      $
            .ajax({
               url : '/comment/list',
               type : 'get',
               data : {
                  'id' : id
               },
               success : function(data) {
           
                  var a = '';
                  $
                        .each(
                              data,
                              function(key, value) {
                                // a += '<div class="commentArea" style="border:1px solid darkgrey;padding:1%; margin-bottom: 15px; font-size:15px; display:block;">';
                                 a += '<div style="font-size:15px" class="commentInfo'+value.id+'">'
                                       + '작성자 : <a href="/shop/users/' + value.user.id + '">' + value.user.nickname + "</a>";
								/* 관리자만 product 댓글 삭제할 수 있도록 설정 (0506) <-- 관리자 및 댓글 작성자만 삭제할 수 있도록 하고싶은데... */	   
                                 a += '<sec:authorize access="hasRole('ROLE_ADMIN')"> <a onclick="commentDelete('
                                       + value.id
                                       + ');" style="cursor:pointer;float:right; display:hidden"> <b>삭제 </b></a> </sec:authorize></div>'; //bottom 왜 자동으로 안내려가는지..... ㅠ
								a += '<sec:authorize access="hasRole('ROLE_STUDENT')"> <a onclick="commentDelete('
                                       + value.id
                                       + ');" style="cursor:pointer;float:right;"> <b></b></a> </sec:authorize></div>'; //bottom 왜 자동으로 안내려가는지..... ㅠ  
                                 a += '작성일: ' + value.writedate;
                                 a += '<div class="commentContent'+value.id+'" style="font-size:20px"> <p> '
                                       + value.content + '</p>';
                                 a += ' </div></div>';
                              });
                  $(".commentList").html(a);
               }
            });
   }

	 //댓글 등록
	function commentInsert(insertData) {
		$.ajax({
			url : '/comment/insert',
			type : 'post',
			data : insertData,
			success : function(data) {
				if (data == 1) {
					commentList(); //댓글 작성 후 댓글 목록 reload
					$('[name=content]').val('');
				}
			}
		});
	}

	//댓글 삭제 
	function commentDelete(pid) {
		$.ajax({
			url : '/comment/delete/' + pid,
			type : 'post',
			success : function(data) {
				if (data == 1)
					commentList(id); //댓글 삭제후 목록 출력 
			}
		});
	}

	$(document).ready(function() {
		commentList(); //페이지 로딩시 댓글 목록 출력 
	});
</script>
