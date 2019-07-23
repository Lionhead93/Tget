<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<style>
		
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
	
	function showReplyList(){

		var url = "/rest/getReqlyList";

		var paramData = {"contentNo" : "${content.contentNo}"};

		$.ajax({

            type: 'POST',

            url: url,

            data: paramData,

            dataType: 'json',

            success: function(result) {

            	var htmls = "";

            	if(result.length < 1){
            	
            	htmls = "등록된 댓글이 없습니다.";
            	} else {

            	$(result).each(function(){

            	htmls += '<div class="media text-muted pt-3" id="replyNo' + this.replyNo + '">';

            	htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';

            	htmls += '<title>Placeholder</title>';

            	htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';

            	htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';

            	htmls += '</svg>';

            	htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

            	htmls += '<span class="d-block">';

            	htmls += '<strong class="text-gray-dark">' + this.userId + '</strong>';

            	htmls += '<span style="padding-left: 7px; font-size: 9pt">';

            	htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.replyNo + ', \'' + this.userId + '\', \'' + this.content + '\' )" style="padding-right:5px">수정</a>';

            	htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.replyNo + ')" >삭제</a>';

            	htmls += '</span>';

            	htmls += '</span>';

            	htmls += this.content;

            	htmls += '</p>';

            	htmls += '</div>';

            	});	//each end

            	}

            	$("#replyList").html(htmls);

            	}	// Ajax success end

		});	// Ajax end
		
		$(document).ready(function(){

			showReplyList();

		});
		
		//댓글 저장 버튼 클릭 이벤트

		$(document).on('click', '#btnReplySave', function(){

			var replyBody = $('#replyBody').val();

			var userId = $('#userId').val();



			var paramData = JSON.stringify({"replyBody": replyBody

					, "userId": userId

					, "contentNo":'${content.contentNo}'

			});

			

			var headers = {"Content-Type" : "application/json"

					, "X-HTTP-Method-Override" : "POST"};

			

			$.ajax({

				url: "${saveReplyURL}"

				, headers : headers

				, data : paramData

				, type : 'POST'

				, dataType : 'text'

				, success: function(result){

					showReplyList();

					

					$('#replyBody').val('');

					$('#userId').val('');

				}

				, error: function(error){

					console.log("에러 : " + error);

				}

			});

		});

		function fn_editReply(replyNo, userId, replyBody){

			var htmls = "";

			htmls += '<div class="media text-muted pt-3" id="replyNo' + replyNo + '">';

			htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';

			htmls += '<title>Placeholder</title>';

			htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';

			htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';

			htmls += '</svg>';

			htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';

			htmls += '<span class="d-block">';

			htmls += '<strong class="text-gray-dark">' + userId + '</strong>';

			htmls += '<span style="padding-left: 7px; font-size: 9pt">';

			htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + replyNo + ', \'' + userId + '\')" style="padding-right:5px">저장</a>';

			htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';

			htmls += '</span>';

			htmls += '</span>';		

			htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';

			htmls += replyBody;

			htmls += '</textarea>';

			

			htmls += '</p>';

			htmls += '</div>';

			

			$('#replyNo' + replyNo).replaceWith(htmls);

			$('#replyNo' + replyNo + ' #editContent').focus();

		}
		
		function fn_updateReply(replyNo, userId){

			var replyEditContent = $('#editContent').val();

			

			var paramData = JSON.stringify({"replyBody": replyEditContent

					, "replyNo": replyNo

			});

			

			var headers = {"Content-Type" : "application/json"

					, "X-HTTP-Method-Override" : "POST"};

			

			$.ajax({

				url: "${updateReplyURL}"

				, headers : headers

				, data : paramData

				, type : 'POST'

				, dataType : 'text'

				, success: function(result){

	                                console.log(result);

					showReplyList();

				}

				, error: function(error){

					console.log("에러 : " + error);

				}

			});

		}
		
		function fn_deleteReply(replyNo){

			var paramData = {"replyNo": replyNo};

			

			$.ajax({

				url: "${deleteReplyURL}"

				, data : paramData

				, type : 'POST'

				, dataType : 'text'

				, success: function(result){

					showReplyList();

				}

				, error: function(error){

					console.log("에러 : " + error);

				}

			});

		}


</script>


	
</head>

<body>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		 <!-- Reply Form {s} -->

			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">

				<form:form name="form" id="form" role="form" modelAttribute="reply" method="post">

				<form:hidden path="contentNo" id="contentNo"/>

				<div class="row">

					<div class="col-sm-10">

						<form:textarea path="replyBody" id="replyBody" class="form-control" rows="3" placeholder="댓글을 입력해 주세요">${reply.replyBody}</form:textarea>

					</div>

					<div class="col-sm-2">

						<form:input path="userId" class="form-control" id="reg_id" placeholder="댓글 작성자">${sessionScope.user.userId}</form:input>

						<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" style="width: 100%; margin-top: 10px">등록</button>

					</div>

				</div>

				</form:form>

			</div>

			<!-- Reply Form {e} -->

			

			<!-- Reply List {s}-->

			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">

				<h6 class="border-bottom pb-2 mb-0">댓글 목록</h6>

				<div id="replyList"></div>

			</div> 

			<!-- Reply List {e}-->

</div>
 

 
</body>
</html>
