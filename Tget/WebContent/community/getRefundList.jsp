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
		      color: #020B13 ;		  
			  background-color: #EBF7FF;
			  margin-top: 50px;				
			  font-family: 'Nanum Gothic', sans-serif;
		}
		a{
			color: #FBFCFE ;	
		}
		hr{
			border: 1px groove white;
		}
		.list-group-item{
			  margin-left:50px;	
			  color: #FBFCFE ;
			  border: 1px groove white;		  
			  background-color: #062038;
		}
		table{
			background-color: #193147;
		}
		td, th{
			border: 1px solid white;
			color: #FBFCFE ;
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
			background-color: #193147;
		}
		section{
			margin-left: 100px;
		}
		#inputGroupSelect01, nav{
			background: rgba(4, 22, 37, 0.75);
			color: #c0c5c9;
		} 
		
       #footer{
			background-color: #1B1B1F;
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
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
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
			
			 var contentNo = "";
			 
			 $( "button.btn.btn-primary:contains('확인')" ).on("click" , function() {
				self.location = "/community/updateRefund?contentNo="+contentNo;
			});
			 
			 $( ".refundCheck" ).on("click" , function() {
			 	 contentNo = $(this).attr("id").trim();
			});			
	
	});			  
	</script>
	
</head>

<body>
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<jsp:include page="/layout/tgetHeader.jsp" />

	    
		    <div class="text-right" style="margin-right: 130px; margin-top: 30px;">
		    	
		    	
		    	<button type="button" id="addContent" class="btn btn-info" data-toggle="modal" data-target="#addContentModal">글 쓰기</button>	    	
		    </div>
		    
<div class="row">
	  <div class="col-md-2 text-center">	  
	      <div class="sticky-top">
		  <br/>
			 <div>
		       		<h6><strong>Community > 환불게시판</strong></h6>
		      	          
		   	 </div>
			</div>
		</div>		
      <!--  table Start /////////////////////////////////////-->
      <div class="col-md-10 text-center">
		      
		      	<div class="text-center">
		      		<button class="btn btn-outline-light" disabled><strong>총  ${totalCount} 건</strong></button>			 		 
				</div>
				<br/> 
		      <div class="row in">
		       <c:forEach var="content" items="${list}" varStatus="j" > 
		        <div class="col-lg-3">
		        <div class="text-center">
		        <div class="border">
						<video controls id="videoplay"  style="width: 250px;">
							<source src="/resources/video/${content.videoName}" type="video/mp4">
						</video>      
			          <hr class="my-4">
			          <p>작성자 : ${content.userNickname}</p>
			          <p>글 제목 : ${content.contentName}</p>
			          <p>작성일 : ${content.regDate}</p>
			          <c:if test="${content.refundCheck=='1'}">
				          <p class="text-warning">         
				          	*검증 대기중	
				          	<c:if test="${sessionScope.user.role=='2'}">
				          	<a href="#" class="refundCheck" id="${content.contentNo}" data-target="#contentModal" data-toggle="modal" ><i class="fas fa-user-check"></i></a></c:if>			          
				          </p>
				          	</c:if>
				          <c:if test="${content.refundCheck=='0'}">
				          <p class="text-success">
				          	*검증 완료	
				          </p>
				          </c:if>
	    	
			      </div>
			      </div>
			      
		        </div><!-- /.col-lg-4 -->
		        </c:forEach>
    </div>
 	</div>
 </div>
 	
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
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
    		<label for="videoName">동영상 업로드</label>
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