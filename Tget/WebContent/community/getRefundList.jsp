<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	<title>T-GET</title>
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    	<meta name="description" content="Tab Styles Inspiration: A small collection of styles for tabs" />
		<meta name="keywords" content="tabs, inspiration, web design, css, modern, effects, svg" />
		<meta name="author" content="Codrops" />
    	

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/css/toolbar.css" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="/resources/css/tabs.css" />
		<link rel="stylesheet" type="text/css" href="/resources/css/tabstyles.css" />
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
		
	<style>
	body{	
		      color: #020B13;		  
			  background-color: #EBF7FF;
			  margin-top: 50px;				
			  font-family: 'Nanum Gothic', sans-serif;
		}
		a, hr{
			color: black;	
		}
		
		table{
			color: #020B13;
 			border: 1px solid #88e3f7;		   
 			background-color: #EBF7FF;
		}
		td, th{
			border: 1px solid #88e3f7;
			color: #EBF7FF ;
		}
		.col-md-2{
			padding-left: 50px;
		}	
		.col-lg-3{			
			margin-bottom: 20px;
		}
		.col-md-10{
			padding-left: 100px;
			padding-right: 100px;
		}
		.row.in{
			margin-left:50px;
			margin-right: 50px;
		}
		.border{
			padding-top: 20px;
			background-color: white;
		}
		section{
			margin-left: 40px;
		}
		
		#cyberWidget{
       		background-color: white;
       }  
       
		
		/* 	게시글 등록 Modal */
		.modal-dialog.modal-80size {
		  width: 300%;
		  height: 100%;
		  margin: 0;
		  padding: 0;
		}
		
		.modal-content.modal-80size {
		  color: black;
		  background-color: #D9E5FF;
		  height: auto;  
		  min-height: 150%;
		  border-radius: 0;
		}
		
		.modal.modal-center {
		  text-align: center;
		}
		
		@media screen and (min-width: 768px) {
		  .modal.modal-center:before {
		    display: inline-block;
		    vertical-align: middle;
		    content: " ";
		    height: 100%;
		   
		  }
		}
		
		.modal-dialog.modal-center {
		  display: inline-block;
		  text-align: left;
		  vertical-align: middle;
		}
    </style>
   	    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
		<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>	
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
		<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>		
		
		<script src="/resources/javascript/common.js" ></script>
		<script src="/resources/javascript/alarm.js" ></script>
		<script src="/resources/javascript/jquery.scrolly.min.js"></script>
		<script src="/resources/javascript/skel.min.js"></script>
		<script src="/resources/javascript/util.js"></script>
		<script src="/resources/javascript/main.js"></script>	
		<script src="//cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		 $(function() {
				
			 
 			 $( "button.btn.btn-outline-primary:contains('등록')" ).on("click" , function() {
 				
 				 //self.location="/community/addContent"	
	 				var contentName= $("input[name='contentName']").val();
					var contentBody= $("textarea[name='contentBody']").val();
					$(this).val($("#file").val());
					
					if(contentName == null || contentName.length<1){
						swal("제목을 입력해 주세요.","","error");
						return;
					}
					swal("등록 되었습니다.","","success")
					 .then(function(r){
						 $("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/community/addContent").submit();				
					 });
					
 				}); 
		 });
		 
		 $(function() {
			
			 var contentNo = "";
			 
			 $( "button.btn.btn-outline-primary:contains('확인')" ).on("click" , function() {
				 swal("환불처리 되었습니다.","","success")
				 .then(function(r){
					 self.location = "/community/updateRefund?contentNo="+contentNo;	 
				 });
				
			});
			 
			 $( ".refundCheck" ).on("click" , function() {
			 	 contentNo = $(this).attr("id").trim();
			 	 var refundVideo = '/resources/video/'+$(this).children("#refundVideo").text().trim();			 	
			 	 var display = "";			 	 
			 	display += '<video controls autoplay="autoplay" style="width: 500px;">';
			 	display += '<source id="refundShow" src="'+refundVideo+'" type="video/mp4">';
			 	display += '</video>';				
				$('#videoRow').html(display);
				
				$('#refundModal').modal('show');
			 	
			});			
	
	});			  
	</script>
	
</head>

<body>
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<jsp:include page="/layout/tgetHeader.jsp" />

	  
		    
		
      <!--  table Start /////////////////////////////////////-->

<div class="text-right" style="margin-right: 120px; margin-top: 20px;">  		    	
<!-- 		    	<button type="button" id="currentRegDate" class="btn btn-info">최신순</button> -->

		    	<button type="button" id="addContent" class="btn btn-outline-info" data-toggle="modal" data-target="#addContentModal"><i class="fas fa-pen-alt"></i>  게시글 작성</button>
			
		
	</div>
				
				<br/>
				<div class="row">
			  		<div class="col-md-2 text-center">	  
			      		<div class="sticky-top">
				  		<br/>
					 <div class="card text-center shadow-lg rounded" style="width: 15rem; color: #041625;">
						  <div class="card-header">
						 <div>
				       		<h6><strong>고객센터  > 환불게시판</strong></h6>
				   	 </div>
					</div>
				</div>	   
				<br/> 
				</div></div>
		      <div class="col-md-10 text-center">
		       <div class="row">
		       <c:forEach var="content" items="${list}" varStatus="j" >
		       <c:if test="${content.refundCheck=='1'}">
		        <div class="col-lg-3">
		        <div class="card shadow rounded">
		        <div class="car-body">
						<video controls autoplay="autoplay" id="videoplay"  style="width: 250px;">
							<source src="/resources/video/${content.videoName}" type="video/mp4">
						</video>      
			          <div style="text-align: left; padding-left: 30px;">
			          <hr class="my-4" >
			          <p>작성자 : ${content.userNickname}</p>
			          <p>글 제목 : ${content.contentName}</p>
			          <p>작성일 : ${content.regDate}</p></div>
			          <c:if test="${sessionScope.user.role=='2'}">
				      <a href="#" class="refundCheck" id="${content.contentNo}" data-target="#contentModal" data-toggle="modal" ><i class="far fa-check-circle" style="color:#020B13;font-size:20px;"></i>
				      <div id="refundVideo" style="display: none;">${content.videoName}</div></a>
				      </c:if> 
				      <br/><br/>   	
			      </div>
			      
			      </div>			      
		        </div><!-- /.col-lg-4 -->
		        </c:if> 
		        </c:forEach>
		        </div>
    </div>
 	</div>

 	
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
	 <div class="modal fade" id="refundModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content text-center">
					      <div class="modal-header"> 
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div id='videoRow'>
					      
					      </div>
					      <div class="modal-body text-center"><strong>환불 처리 하시겠습니까?</strong></div>
					      <br/>
					      <div class="text-center">
					        <button type="button" class="btn btn-outline-danger" data-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-outline-primary">확인</button>
					        
					      </div>
					      <br/>
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
   			<br/>
   			 <select id="open" name="open">
				<option value="">공개 여부</option>
					<option value="0">공개</option>
					<option value="1">비공개</option>
			</select>	
			<br/><br/>
			<div class="form-group">
		    <label for="userNickname" class="col-sm-offset-1 col-sm-3 control-label">작성자</label> 
		      <input type="text" class="form-control" id="userNickname" name="userNickname" value="${sessionScope.user.nickName}" readonly>
		      <input type="hidden" name="userId" value="${sessionScope.user.userId}">
		    
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
    		<label for="videoName" class="col-sm-offset-1 col-sm-3 control-label">동영상 업로드</label>
    		<input type="file" class="form-control" id="videoName" name="file" value="${!empty content.videoName? content.videoName : ''}">
 		 </div>
 		 
	      <div class="modal-footer">
	        <button type="button" class="btn btn-outline-primary" data-dismiss="modal">등록</button>
	        <button type="button" class="btn btn-outline-danger" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>			  
	</form>
	<script src="/resources/javascript/cbpFWTabs.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
				(function() {
	
					[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
						new CBPFWTabs( el );
					});
	
				})();
	</script>	
	
	
</body>
<jsp:include page="/layout/footer.jsp" />
</html>