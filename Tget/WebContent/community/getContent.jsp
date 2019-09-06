<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    	<meta name="description" content="Tab Styles Inspiration: A small collection of styles for tabs" />
		<meta name="keywords" content="tabs, inspiration, web design, css, modern, effects, svg" />
		<meta name="author" content="Codrops" />
    	<title>T-GET</title>

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/css/toolbar.css" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="/resources/css/tabs.css" />
		<link rel="stylesheet" type="text/css" href="/resources/css/tabstyles.css" />
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
		
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
		<script src="/resources/javascript/modernizr.custom.js"></script>
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
		
       
		
		/* 	게시글 등록 Modal */
		.modal-dialog.modal-80size {
		  color: #020B13;
		  width: 300%;
		  height: 100%;
		  margin: 0;
		  padding: 0;
		}
		
		.modal-content.modal-80size {
		  color: #020B13;
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
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	  function fncUpdateContent(){
		  var contentName= $("input[name='contentName']").val();
			var contentBody= $("textarea[name='contentBody']").val();
			
			if(contentName == null || contentName.length<1){
				swal("제목을 입력해 주세요.","","error");
				return;
			}
			
			swal("수정 되었습니다.","","success")
			.then(function(r){
				$("form[name='updateContent']").attr("method" , "POST").attr("action" , "/community/updateContent").submit();
			});
			
			}

			$(function() {
				$( "button.btn.btn-info:contains('수정')" ).on("click" , function() {
					fncUpdateContent();
				});
			}); 
	 
	 $(function() {
			
			
			$( "#ok" ).on("click" , function() {
			
				history.go(-1); 
			});
		
	
			 $( "#updateSubmit" ).on("click" , function() {
				 	
				 	var contentName= $("input[name='contentName']").val();
					var contentBody= $("textarea[name='contentBody']").val();
					
					if(contentName == null || contentName.length<1){
						swal("제목을 입력해 주세요.","","error");
						return;
					}
					
					swal("수정 되었습니다.","","success")
					.then(function(r){
						$("form[name='updateContent']").attr("method" , "POST").attr("action" , "/community/updateContent").submit();
					});
					
 											
				});
	 });
	
	 
	</script>
	
</head>

<body>
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<jsp:include page="/layout/tgetHeader.jsp" />

	 <div class="row" >
	  <div class="col-md-2 text-center" >	  
	      <div class="sticky-top" ><!--  sticky-top-->
		  <br/>
			 <div class="card text-center shadow-lg rounded" style="width: 15rem; color: #041625;">
						  <div class="card-header">
						 <div>
		       		<h6><strong>게시글 > 상세조회 </strong></h6>

			   	 </div>
			</div>
		</div>
		<br/>
		</div></div>
		
		<div class="col-md-10 text-center">
      <div class="card text-center shadow-lg rounded">
	<br/>
		 <div class="card-body">
		 <h3><strong>${content.contentName}</strong></h3>
		 <br/><br/>
		<div class="row">
	  		<div class="col-md-3"><strong>작성자</strong></div>
			<div class="col-md-3 text-left">${content.userNickname}</div>
			<div class="col-md-3"><strong>작성일</strong></div>
			<div class="col-md-3 text-left">${content.regDate}</div>
		</div>
		
		<br/>
		<div class="card shadow-sm rounded" style="margin-left: 60px;margin-right: 60px;">
		<div class="card-body">
		${content.contentBody}
		</div>
		</div>
		<br/>
		<div class="text-center">
		    <button type="button" id="ok" class="btn btn-outline-primary"  >확&nbsp;인</button>
			<button type="button" id="${content.contentNo}" class="btn btn-outline-danger" data-toggle="modal" data-target="#updateContentModal">수 정</button>
		</div>
<%--  		<jsp:include page="/community/reply5.jsp"/>  --%>
		<br/>	
		
 					</div>
 				
 			</div>
 		</div>
 	</div>
 	
 		<div class="modal fade" id="updateContentModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content modal-80size">
					  <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="modalCenterTitle"><strong>수정하기</strong></h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body" id="updateContentModalBody"> 	    
		  
			    <form name="updateContent">
			
			    	<div class="col"><strong>작성자</strong>&nbsp;&nbsp;&nbsp; <span id="contentUserNickname"></span>${content.userNickname}</div>
					<br/>
					<div class="col"><strong>글 제목</strong><br/><br/>  <input class="col" type="text" id="contentName" name="contentName" value="${content.contentName}"></div>
					<br/>
					<div class="col"><strong>글 내용</strong> <hr/>  <textarea id="contentBody" name="contentBody">${content.contentBody}</textarea>
					<script type="text/javascript">
					CKEDITOR.replace('contentBody'
							, {height: 200});
					</script></div>			    
					<br>
					<hr>
					<input type='hidden' name='contentNo' value='${content.contentNo}'/>
				</form>		
				   
				<div class="modal-footer">
		       
		        <button type="button" id="updateSubmit" class="btn btn-outline-info" data-dismiss="modal">수정</button>

		        <button type="button" class="btn btn-outline-danger" data-dismiss="modal">취소</button>
		      </div>
				</div></div>	        
						      </div>
						    </div>
						  </div>
 	 
</body>
<jsp:include page="/layout/footer.jsp" />
</html>