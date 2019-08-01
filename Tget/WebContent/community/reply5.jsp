<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html lang="ko">
<head>

<!--  meta  -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--  bootstrap CDN -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

<link rel="stylesheet" href="/resources/newTemplate/admin/css/loadingAnimation.css">

<script src="https://kit.fontawesome.com/e26616618e.js"></script>
<!--  CSS -->
<style>
.temp {
	height: 300px;
}

.btn.btn-default {
	width : 100%;
	height: 30px;
}
.commentDiv{
	background-color: #F0F0F0;
	min-height: 50px;
}
</style>
</head>
<body>

	<div class="container">

		<hr />
		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 비회원 처리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
		<c:if test="${sessionScope.user eq null}">
		<div class="row" id="moreView">
			<div class="col-sm-12 col-md-12" align="center">
				비회원은 댓글을 달 수 없습니다<a href="#" class="log-modal" data-toggle="modal" data-target="#login-modal">로그인 </a>후 이용해주시길 바랍니다.
			</div>
		</div>
		<br>
		</c:if>
		
		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 회원 처리  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
		<c:if test="${sessionScope.user != null}">
		<form name="replyGo">
		<div class="row">
			<div class="col-sm-10 col-md-10" align="center">
				<input type="text" name="replyContent" class="form-control repyContent"
					style="width: 100%; height: 50px" placeholder="댓글입력" />
			</div>
			<div class="col-sm-2 col-md-2" align="center">
				<button type="button" id="replyGo" class="replySubmit"
					style="background-color: #6190ed; color: white; width: 100%; height: 40px; border: 1px solid #1449b3">
					<h6>
						<b>댓글등록</b>
					</h6>
				</button>
			</div>
		</div>
		</form>
		<br>
		</c:if>
		
		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 댓글 처리  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
		<div class="replyList">
		<c:set var="i" value="0"/>
		<c:forEach var="comment" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<div class="row" id="${reply.replyNo}">
<!-- 				<div class="col-sm-1 col-md-1" align="center"> -->
<%-- 					<c:if test="${comment.profile != null }"> --%>
<%-- 					<img src="/resources/file/fileUser/${comment.profile}" style="border-radius: 10px; min-height: 88px; min-width: 82px; max-height: 88px; max-width: 82px;" /> --%>
<%-- 					</c:if> --%>
<%-- 					<c:if test="${comment.profile == null }"> --%>
<!-- 					<img src="https://via.placeholder.com/80" style="border-radius: 10px; min-height: 88px; min-width: 82px; max-height: 88px; max-width: 82px;" /> -->
<%-- 					</c:if> --%>
<!-- 				</div> -->
				<div class="col-sm-11 col-md-11" align="left">
					
					<h4 id="${reply.replyNo}" class="h4tag">
						<b>${reply.userNickname}</b>&nbsp; <small>${reply.regDate}</small>&nbsp; 
					</h4>
					<input type="hidden" name="commentNo" value="${reply.replyNo}">
					
					<div id="${reply.replyNo}" class="area">
					<h5  id="${reply.replyNo}" class="cmCont">${reply.replyBody}</h5>
					
					<c:if test="${user.role == '0' }">
					<span class="fas fa-trash-alt"></span>
					</c:if>
					<c:if test="${reply.userId == sessionScope.user.userId }">
					<span class="fas fa-pen"></span> 
					<span class="fas fa-trash-alt"></span>
					</c:if>
					<span class="fas fa-exclamation-triangle"></span>
<!-- 					<span class="fas fa-plus"></span> &nbsp;  -->
					<span id="${reply.commentNo}" class="far fa-thumbs-up"></span>
					<font id="${reply.commentNo}" class="font">	
					</font>
					</div>
				</div>
			</div>
			<br/>

		</c:forEach>
		</div>
		
		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 로딩 처리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
		<div class="loading-container">
			<div class="loading"></div>
			<div id="loading-text">loading</div>
		</div>
		
		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 더보기 버튼 처리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
<%-- 		<c:if test="${totalCount > rank}"> --%>
<!-- 		<div class="col-md-12"> -->
<!-- 			<button type="button" class="btn btn-default moreView" value="1"> 더보기 </button> -->
<!-- 		</div> -->
<%-- 		</c:if> --%>
		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 하단 공백 처리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
		<div style="min-height: 50px;">
			
		</div>
 		
 		<!-- ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 모달 처리 ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->
		
				
	</div> <!--  END of Container -->
	
	<script type="text/javascript">	
	
 	var currentPage = 2;
	
 	$(document).ready(function(){
 		
 		$(".loading-container").hide();
		$(".commentContent").keydown(function(key){
			if(key.keyCode == 13){
				$(".commentSubmit").click();
			}
		});
	});
 	
	$(function(){
		
		// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 댓글 리스트  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		//$(document).on("click",".moreView",function(){
			
		var count = 0 ;
		
		$(window).scroll(function(){
			
			//console.log(${rank});
			
			if( $(this).scrollTop() +  $(this).height() + 484 > $(document).height() ){
				
				$.ajax({
					url : "/comment/json/listComment/${board.postNo}/"+currentPage,
					method : "POST",
					dataType : "JSON",
					headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
					},
					success : function(JSONData, status){
												
						$('.loading-container').hide();
						currentPage++;
						console.log(JSONData.list);
						
						var totalCount = JSONData.totalCount;
						//var reList = JSONData.reList;
						
						//console.log(reList);
						var list = JSONData.list; 
						
	 					if(list.length == 0 ){
	 						$(".moreView").remove();
	 						$('.loading-container').remove();
	 					}
	 					
//	 					var display = "<div class='col-sm-12 col-md-12 commentList'>";
						var display = "";
						$.each(list, function(index, comment){
							
							display +=
								"<div class='row' id='"+comment.commentNo+"'>" +
									"<div class='col-sm-1 col-md-1' align='center'>";	
									if(comment.profile != null){
										display += "<img src='https://via.placeholder.com/'"+comment.profile+" style='border-radius:10px; min-height: 80px; min-width: 60px; max-height: 80px; max-width: 80px; padding-top:5px;'/>";
									} else {
										display += "<img src='https://via.placeholder.com/80' style='border-radius:10px; min-height: 80px; min-width: 60px; max-height: 80px; max-width: 80px; padding-top:5px;'/>";
									}
									
									
							display +=
								"</div>" +
									"<div class='col-sm-11 col-md-11' align='left'>" + 
										"<h4 id="+comment.commentNo+" class='h4tag'>" +	
											"<b>"+comment.nickName+"</b>&nbsp; <small>"+comment.regDate+"</small>" + 
										"</h4>" +
		 								"<input type='hidden' name='commentNo' value='"+comment.commentNo+"'/>" +
							   			"<div id="+comment.commentNo+" class='area'>" +
											"<h5  id="+comment.commentNo+" class='cmCont'>"+comment.commentContent+"</h5>";
						    	
								if(comment.id == '${sessionScope.user.id}'){
				 					display += "<span class='fas fa-pen'></span>&nbsp;" + 
				 					           "<span class='fas fa-trash-alt'></span>&nbsp;";
								}
								
								display += 
											"<span class='fas fa-exclamation-triangle'></span>&nbsp;" + 
//	  										"<span class='glyphicon glyphicon-plus'></span>" +
	 	 									"<span id='"+comment.commentNo+"' class='far fa-thumbs-up'></span>&nbsp;"+
	 	 									"<font id='"+comment.commentNo+"' class='font'>" +
	 										"<b>"+comment.likeCount+"</b>"+
	 										"</font>" +
	 	 								"</div>" +
	 	 							"</div>" +
	 							"</div>" +
	 	 						"<br/>";
						}); // each END
						
						//display +="</div>";
//						console.log($(display).html());
						$(".commentList").append(display);
						
//						console.log(JSONData.totalCount);
//						console.log(list.length);															
					},
					beforeSend:function(){
						
					        $('.loading-container').show();

					},
					complete:function(){

						 	$('.loading-container').show();
					},
					error : function(request, status, error){							
						alert("Error");							
					}, // error END
					timeout:1000
				}); // ajax END
			} // scroll IF END
		});
	});

	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 댓글 등록  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	$(function() {
		
		$(document).on("click","#commentGo",function() {
			
			var commentData =  
			{
					commentContent : $("input[name=commentContent]").val(),
					postNo		   : $("input[name=postNo]").val(),
					boardCode 	   : $("input[name=boardCode]").val()
			} ;
			
			$.ajax({
				url : "/comment/json/addComment/",
				method : "POST",
				dataType : "Json",
				data : JSON.stringify(commentData),
				headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
							},
				success : function(JSONData, status){
																
	 							var display = 
	 								"<div class=row id="+JSONData.commentNo+">"
	 								+"<div class=col-sm-1 col-md-1 align=center>"
	 									+"<img src=https://via.placeholder.com/80 style='border-radius: 5px; min-height: 80px; min-width: 60px;'/>"
	 								+"</div>"
	 								+"<div class=col-sm-11 col-md-11 align=left>"
	 									+"<h4 id='"+JSONData.commentNo+"' class=h4tag>"
	 									+"<b>"+JSONData.nickName+"</b> &nbsp; <small>"+JSONData.regDate+"</small> &nbsp;"
	 									+"</h4>"
	 									+"<input type='hidden' name='commentNo' value='"+JSONData.commentNo+"'>"					
	 									+"<div id='"+JSONData.commentNo+"' class=area>"
	 									+"<h5  id='"+JSONData.commentNo+"' class=cmCont>"+JSONData.commentContent+"</h5>";
	 										
	 											if(JSONData.id == '${sessionScope.user.id}' ){
	 												display += "<span class='fas fa-pen'></span>  &nbsp;" 
		 												+"<span class='fas fa-trash-alt'></span>  &nbsp;" ;
	 											}
	 												
	 											display += "<span class='fas fa-exclamation-triangle'></span>  &nbsp;"
// 	 													+"<span class='fas fa-plus'></span> &nbsp;" 
			 											+"<span id='"+JSONData.commentNo+"' class='far fa-thumbs-up'></span>  &nbsp;"
	 													+"<font id='"+JSONData.commentNo+"' class='font'>"
	 														+"<b>"+JSONData.likeCount+"</b>"
	 													+"</font>"
	 									+"</div>"
	 								+"</div>"
	 							+"</div>"
	 							+"<br/>"
	 								
	 							
								$(".commentList").prepend(display);
							},
											
							error : function(request, status, error){							
								alert("Error");							
							}
					
						});
		});
	});
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 댓글 수정  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	$(function(){
		
		$(document).on("click", ".fa-pen", function() {
			
			var commentNo = $(this).parent().parent().children("input").val() ;
			
			$.ajax(
					{
						url : "/comment/json/getComment/"+commentNo,
						method : "POST",
						dataType : "Json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						
						success : function(JSONData, status){
							
							$("#"+commentNo+""+".cmCont").remove();
							$("#"+commentNo+""+".area").hide();
							
 							var modifyScreen = 
 								"<div class='ajax col-md-10'><input type='text' class='form-control' id='commentContent' name='commentContent' style='width: 100%; height: 50px' placeholder='"+JSONData.commentContent+"'/></div>";
							
 							var button = "<div class='ajax col-md-2'>" 								
 								+ "<a href='#' onclick='update(); return false;'> "
 								+ "<input type='hidden' id='commentNo' value='"+JSONData.commentNo+"'>"
 								+ "<button class='btn btn-default'>수정완료</button>" 								
 								+ "</div>"
 							
							$("#"+commentNo+""+".h4tag").append(modifyScreen);
 							$("#"+commentNo+""+".h4tag").append(button);
						},
										
						error : function(request, status, error){							
							alert("Error");							
						}
				
					}
			);
		});
		
		// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 삭제 처리  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		$(document).on("click", ".fa-trash-alt", function() {
			
			var commentNo = $(this).parent().parent().children("input").val();
			
			swal({
			  title: "정말 삭제 하시겠습니까 ?",
			  text: "당신의 소중한 한 마디가 사라지게 됩니다.",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  
				  $.ajax({
						url : "/comment/json/delComment/"+commentNo,
						method : "POST",
						dataType : "Json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status){
							
							$("#"+commentNo+""+".row").remove();
							
						},
					});
				  
			    swal("삭제완료 !", {
			      	icon: "success",
			    });
			  }
			});
		});
		
		// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 신고하기  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		$(document).on("click",".fa-exclamation-triangle",function() {

			popWin = window.open("/common/report.jsp",
								"popWin",
								"left=500, top=300, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		
		});
		

	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 좋아요 처리  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		$(document).on("click", ".far.fa-thumbs-up", function(){
			
			if(${sessionScope.user == null}){
				alert("로그인 합십쇼");
				return;
			}
				
			var commentNo = $(this).parent().parent().children("input").val();
			var id = '${sessionScope.user.id}';
				$.ajax({
					url : "/comment/json/check/"+commentNo+"/"+id,
					method : "POST",
					dataType : "Json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData, status){
						
						if(JSONData == 1){
							alert("이미 추천한 댓글입니다.");
							return;
						}
						
						if(JSONData == 0){
						$.ajax({
							url : "/comment/json/updateLikeCnt/"+commentNo+"/"+"plus",
							method : "POST",
							dataType : "Json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData, status){
								
								console.log("plus complete");
								
								$("#"+commentNo+""+".font >").remove();
								$("#"+commentNo+""+".font").html("<b>"+ JSONData.likeCount+"</b>");
								
							}
						});
						} // JSONDATA 0 END			
					}
				});
							
		});
	
	});
	
	
	// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 업데이트 처리  ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	function update(){
		
		if( $("#commentContent").val() == ''){
			alert("내용을 입력해주세요.");
			return;
		}
		
		var search 	= {commentNo : $("#commentNo").val(), commentContent : $("#commentContent").val()};
		var convertSearch = JSON.stringify(search);
		
 		$.ajax({
 					url : "/comment/json/updateComment/",
 					method : "POST",
 					dataType : "json",
 					data : convertSearch,
 					headers : {
 						"Accept" : "application/json",
 						"Content-Type" : "application/json"
 					},
					
 					success : function(JSONData, status){						
						
 						$("#"+JSONData.commentNo+""+".cmCont").remove();
 						$(".ajax").remove();
 						$("#"+JSONData.commentNo+""+".area").show();
 						
 						var modifyScreen = 	
 							"<div id="+JSONData.commentNo+" class='area'>"
 							+ "<h5 id="+JSONData.commentNo+" class='cmCont'>"+JSONData.commentContent+"</h5><div>";
						
 						$("#"+JSONData.commentNo+""+".h4tag").append(modifyScreen);
 	
					},
 					error : function(request, status, error){
						
 						alert("error");
						
 					}
 				});
	} // end of update function()
</script>
	
</body>
</html>