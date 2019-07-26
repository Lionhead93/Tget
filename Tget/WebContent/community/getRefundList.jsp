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
    <title>T-GET</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/css/toolbar.css" />
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
		<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
				
		<script src="/resources/javascript/common.js" ></script>
		<script src="/resources/javascript/alarm.js" ></script>
		<script src="/resources/javascript/jquery.min.js"></script>
		<script src="/resources/javascript/jquery.scrolly.min.js"></script>
		<script src="/resources/javascript/skel.min.js"></script>
		<script src="/resources/javascript/util.js"></script>
		<script src="/resources/javascript/main.js"></script>	
   <script src="//cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
	<style>
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetUserList(currentPage) {
			
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/community/getRefundList").submit();
		}
		
		 $(function() {
				
			 
 			 $( "button.btn.btn-primary:contains('등록')" ).on("click" , function() {
 				
 				 //self.location="/community/addContent"	
	 				var contentName= $("input[name='contentName']").val();
					var contentBody= $("textarea[name='contentBody']").val();
					$(this).val($("#file").val());
					
					if(contentName == null || contentName.length<1){
						alert("제목을 입력해 주세요.");
						return;
					}
					
					alert("등록 되었습니다.");
					$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/community/addContent").submit();				
 				}); 
		 });
		 
		 $(function() {
					
			 $( "button.btn.btn-primary:contains('확인')" ).on("click" , function() {
				 alert("확인");
				 $("form[name='refundCheck']").attr("method" , "POST").attr("action" , "/community/updateRefund").submit();	
			});
			 
			 $( "button.btn.btn-info:contains('검증')" ).on("click" , function() {
			 	 alert("검증");
				 var contentNo = $(this).children("div").text().trim();
			 	 alert(contentNo);
			 	 $("input[name='contentNo']").val(contentNo);
			});
			 
	 
			$( "td:nth-child(2)" ).css("color" , "black");
			$("h7").css("color" , "red");
			
			$(".ct_list_pop:nth-child(n)").on("mouseenter", function(){
				$(this).css({
					"background-color":"#808080",
					"font-weight":"bolder"
				});
			})
			.on("mouseleave", function(){
				var style = {
						backgroundColor: "",
						fontWeight:""
				};
				$(this).css(style);
			});
	
	});	
	 
// 		  $(function() {
			 	
// 				$(".btn.btn-link").on("click" , function() {
// 					alert("야야야야야야야");
					
// 					var contentNo = $(this).children('#contentNo').text().trim();
					
// 					$.ajax( 
// 								{
// 									url : "/community/rest/getRefund/"+contentNo ,
// 									method : "GET" ,
// 									dataType : "json" ,
// 									headers : {
// 										"Accept" : "application/json",
// 										"Content-Type" : "application/json"
// 									},
// 									success : function(JSONData , status) {

// 										var displayValue = "<h6>"
// 																+"<img src=\"/video/"+JSONData.content.videoName+"\" width=\"300\" height=\"170\"><br/>"
// 																+"</h6>";
// 										$("h6").remove();
// 										$( "#"+contentNo+"" ).html(displayValue);
// 									}
// 							});
// 					}); 
		  
	</script>
	
</head>

<body>
	<jsp:include page="/layout/tgetToolbar.jsp" />
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>환불게시판</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${Page.totalCount } 건수, 현재 ${Page.currentPage}  페이지
		    	</p>
		    	
		    	<button type="button" id="addContent" class="btn btn-danger" data-toggle="modal" data-target="#addContentModal">글 쓰기</button>	    	
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
				  <div class="form-group">
				  
				  </div> 
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
			
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >글 제목</th>
            <th align="left">작성자</th>
            <th align="left">작성일</th>
            <th align="left">동영상 파일</th>
            <c:if test="${sessionScope.user.role == '2'}">
            <th align="left">검증 여부</th>	
            </c:if>
          </tr>
        </thead>
       
		<tbody>
		
		<form name="refundCheck">
			<input type="hidden" name="contentNo" value=""/>
		</form>
		  <c:set var="i" value="0" />
		  <c:forEach var="content" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left" class="btn btn-link">${content.contentName}
			  <div id="contentNo" style="display:none;">${content.contentNo}</div></td>
			  <td align="left">${content.userId}</td>
			  <td align="left">${content.regDate}</td>
			  <td align="left">	      			
					<a style="width: 18rem; height: 400px;" >
						<video controls id="videoplay"  style="width: 300px; height: 170px;">
							<source src="/resources/video/${content.videoName}" type="video/mp4">
						</video></a>
					
				</td>
			  <td align="left">
			  <c:if test="${sessionScope.user.role == '2'}">
			  <button type="button" id="contentModalButton" class="btn btn-info"  data-toggle="modal" data-target="#contentModal">
				<div style="display: none;">${content.contentNo}</div>검증</button>
			  </c:if>
			  </td>
			  <td align="left">
			  
			  </td> 
			  
			
			</tr>
          <tr>
		</tr>
          </c:forEach>
		
        </tbody>
      
      </table>
      
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<!-- PageNavigation End... -->
	 <div class="modal fade" id="contentModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-md" role="document">
					    <div class="modal-content">
					      <div class="modal-header"> 
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">환불 처리 하시겠습니까?</div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-primary">확인</button>
					        
					      </div>
					    </div>
					  </div> 
	</div>
	
	<!-- 게시글 등록 Modal -->		  
		<form>
		<div class="modal modal-center fade" id="addContentModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
	  <div class="modal-dialog modal-lg modal-center" role="document">
	    <div class="modal-content modal-80size">
<!-- 	      <div class="modal-header"> -->
<!-- 	        <h4 class="modal-title" id="myModalLabel"><strong>글 등록하기</strong></h4> -->
<!-- 	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
	        
<!-- 	      </div> -->
	      <div class="modal-body">
	 		
			<input type="hidden" id="boardCode" name=boardCode value="2" />
			<input type="hidden" id="contentCode" name=contentCode value="7" />
   			
   			 <select id="open" name="open">
				<option value="">공개 여부</option>
					<option value="0">공개</option>
					<option value="1">비공개</option>
			</select>	
			
			<div class="form-group">
		    <label for="userNickname" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userNickname" name="userNickname" value="${sessionScope.user.nickName}" readonly>
		      <input type="hidden" name="userId" value="${sessionScope.user.userId}">
		    </div>
		  </div>
 
		  <div class="form-group">
		    <label for="contentName" class="col-sm-offset-1 col-sm-3 control-label">글 제목</label>
		    
		      <input type="text" class="form-control" id="contentName" name="contentName">
		    
		  </div>
		
		  <label for="contentBody" class="col-sm-offset-1 col-sm-3 control-label">글 내용</label>
		  <hr>
		
		<textarea class="form-control" id="contentBody" name="contentBody"></textarea>
		<script type="text/javascript">
		CKEDITOR.replace('contentBody'
				, {height: 200});
		</script>
		<br/>  		
	      </div>
	      
	      <div class="form-group">
    		<label for="videoName">동영상</label>
    		<input type="file" class="form-control" id="videoName" name="file" value="${!empty content.videoName? content.videoName : ''}">
 		 </div>
 		 
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal">등록</button>
	        <button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>			  
	</form>
</body>

</html>