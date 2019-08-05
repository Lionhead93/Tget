<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
		      color: #020B13 ;		  
			  background-color: #EBF7FF;
			  margin-top: 50px;				
			  font-family: 'Nanum Gothic', sans-serif;
		}
		a, hr{
			color: #FBFCFE ;	
		}
		.list-group-item{
			  margin-left:50px;	
			  color: #020B13;
 			  border: 1px solid #88e3f7;		   
 			  background-color: #EBF7FF; 
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
			color: #020B13 ;
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
			margin-left: 40px;
		}
/* 		#gradient{ */
/* 			background: linear-gradient(-45deg, rgba(246, 255, 0, .8), rgba(255, 0, 161, .8)) fixed */

/* 		} */
		#inputGroupSelect01, nav{
			background: rgba(4, 22, 37, 0.75);
			color: #c0c5c9;
		}
		#cyberWidget{
       		background-color: white;
       }  
       #footer{
			background-color: #1B1B1F;
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
	
		function fncAddReport(){
			
			//alert($("input[name='whiteNickname']").val());
			$("form[name='addReport']").attr("method" , "POST").attr("action" , "/community/addReport").submit();
			}

			$(function() {
				$( "button.btn.btn-info:contains('신고하기')" ).on("click" , function() {
					fncAddReport();
				});
			});
			
		 $(function() {
			
// 			 $( "button.btn.btn-info:contains('최신순')" ).on("click" , function() {
// 					$("#currentRegDate").val("0");
// 					fncGetUserList("1");
// 				});
			 
 			 $( "button.btn.btn-info:contains('등록')" ).on("click" , function() {
 				 
 					//self.location="/community/addContent"	
	 				var contentName= $("input[name='contentName']").val();
					var contentBody= $("textarea[name='contentBody']").val();
					
					if(contentName == null || contentName.length<1){
						alert("제목을 입력해 주세요.");
						return;
					}
					
					alert("등록 되었습니다.")
					$("form[name='addContent']").attr("enctype","multipart/form-data").attr("method" , "POST").attr("action" , "/community/addContent").submit();
 				});
			 
			 
			 $( "a[href='#']:contains('티켓 거래 공지')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=0";	
				
				});
			 
			 $( "a[href='#']:contains('자유게시판 이용 공지')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=1";	
				
				});
			 
			 $( "a[href='#']:contains('자주묻는질문')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=2";	
				
				});
			 
			 $( "a[href='#']:contains('삽니다')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=3";	
				
				});
			 
			 $( "a[href='#']:contains('팝니다')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=4";	
				
				});
			 
			 $( "a[href='#']:contains('수다방')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=5";	
				
				});
			 
 			 $( ".reportRing" ).on("click" , function() {
 				 	if('${user}'==''){
 				 		alert("로그인을 해주세요");
 				 		return;
 				 	}
 				 	$(this).attr("data-target","#addReportModal");
				 	var contentNo = $(this).attr("id").trim();
				 	$.ajax(
							{
								url : "/community/rest/getContent/"+contentNo ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(data) {
									$("input[name='contentNo']").val(data.contentNo);
									$("input[name='blackId']").val(data.userId);
									$("#reportContentBody").html(data.contentBody);
									$("#reportBlackId").html(data.userId);
								}
							});
				});
				
			 $( "a[href='#']:contains('환불 게시판')" ).on("click" , function() {
					self.location="/community/getRefundList";	
				
				});
			 
				
	 
			// 상세 조회
			$( ".col-md-4" ).on("click" , function() {
				self.location ="/community/getContent?contentNo="+$(this).parent().children('#contentNo').text().trim();
				
			});

			$( ".col-md-4" ).css("color" , "black");
			
			$("h7").css("color" , "red");
			
			$(".ct_list_pop:nth-child(n)").on("mouseenter", function(){
				$(this).css({
					"background-color":"#808080",
					"font-weight":"bolder"
				});
			})
			.on("mouseleave", function(){
				var style = {
						backgroundColor: "",//#ddd
						fontWeight:""
				};
				$(this).css(style);
			});
	
	});	
		 
		 $(function() {
				
				$(".good").on("click" , function() {
					
					var contentNo = $(this).attr("id").trim();
					var goodCount = $("span[name='"+contentNo+"']").text().trim();
					var result = parseInt(goodCount)+1;
					var content = $("span[name='"+contentNo+"']");
					$.ajax(
			    		{
			    	
			        method:"GET",
			        url : "/community/rest/updateGoodCount/"+contentNo,
			        dataType: "json",
			        header:{
			        	"Accept" : "application/json",
						"Content-Type" : "application/json"	
			        },
			        success : function(data){
 			        		content.text(result);
 			        
			        }
			        
			    	});
				});
		 });
		 
 		  $(function() {
				
				$(".bad").on("click" , function() {
				
					var contentNo = $(this).attr("id").trim();
					var badCount = $('a').closest("#"+contentNo+"").text().trim();
					alert(badCount);
					var result1 = parseInt(badCount)+1;
					var content1 = $('a').closest("#"+contentNo+"");
					
					$.ajax(
			    		{
			    	
			        method:"GET",
			        url : "/community/rest/updateBadCount/"+contentNo,
			        dataType: "json",
			        header:{
			        	"Accept" : "application/json",
						"Content-Type" : "application/json"	
			        },
			        success : function(data){
			        	
			        	if($.trim(data.result)=="bad"){
			        		content1.text(result1);
			        	} 
			        } 
			        
			    	});
				});
		 });
		
	</script>
	
</head>

<body>
	
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<jsp:include page="/layout/tgetHeader.jsp" />

	<div class="text-right" style="margin-right: 85px; margin-top: 20px;">       	
		    	<p class="text-dark" ><strong>전체  ${totalCount } 건수</strong></p>
<!-- 		    	<button type="button" id="currentRegDate" class="btn btn-info">최신순</button> -->
		    	<button type="button" id="addContent" class="btn btn-info" data-toggle="modal" data-target="#addContentModal">글 쓰기</button>
				
		
	</div>	   

	<br/>	   
	 <div class="row" >
	  <div class="col-md-2 text-center" >	  
	      <div class="sticky-top" ><!--  sticky-top-->
		  <br/>
			 <div>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='0'}">
		       		<h6><strong>Community > 공지사항</strong></h6>
		       </c:if>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='1'}">
		       		<h6><strong>Community > 공지사항</strong></h6>
		       </c:if>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='2'}">
		       		<h6><strong>Community > 공지사항</strong></h6>
		       </c:if>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'}">
		       		<h6><strong>Community > 자유게시판</strong></h6>
		       </c:if>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='4'}">
		       		<h6><strong>Community > 자유게시판</strong></h6>
		       </c:if>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='5'}">
		       		<h6><strong>Community > 자유게시판</strong></h6>
		       </c:if>
		      
		   	 </div>
			<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='0'||search.searchCondition=='2'&&search.searchKeyword=='1'||search.searchCondition=='2'&&search.searchKeyword=='2'}">
				<ul class="list-group list-group-flush">
				<li class="list-group-item" ><a href="#" style=color:#020B13;>티켓 거래 공지</a></li>
				<li class="list-group-item"><a href="#" style=color:#020B13;>자유게시판 이용공지</a></li>
				<li class="list-group-item"><a href="#" style=color:#020B13;>자주묻는질문</a></li>
				</ul>
			</c:if>
			  
			<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
				<ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="#" style=color:#020B13;>삽니다</a></li>
				<li class="list-group-item"><a href="#" style=color:#020B13;>팝니다</a></li>
				<li class="list-group-item"><a href="#" style=color:#020B13;>수다방</a></li>
				</ul>
			</c:if>
			</div>
		</div>	
		
      <!--  table Start /////////////////////////////////////-->
 <div class="col-md-10 text-center">
     		
     		<div class="card text-center shadow rounded" style="margin-bottom: 10px; height:70px;">
		 <div class="card-body">	
			<div class="row">
				<div class="col-md-4"><p><strong>글 제목</strong>&ensp;<i class="fas fa-align-justify"></i></p></div>		     			        
				<div class="col-md-2"><p><strong>작성자</strong>&ensp;<i class="fas fa-user-edit"></i></p></div>	        
				<div class="col-md-2"><p><strong>작성일</strong>&ensp;<i class="far fa-calendar-alt"></i></p></div>
				<div class="col-md-1"><p><strong>조회수</strong></div>
				<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
				<div class="col-md-3"></div>		
				</c:if>
		    </div>
		</div>        
	</div>	
	
	<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='0'||search.searchCondition=='2'&&search.searchKeyword=='1'}">
		<c:forEach var="content" items="${list}">

	<div class="card text-center shadow rounded-pill" style="margin-bottom: 10px; height:40px;">
		 <div class="card-body" style="padding-top:10px;">	
			<div class="row">
				<div class="col-md-4" ><p>${content.contentName}</p></div>
				<div id="contentNo" style="display:none;">${content.contentNo}</div>		     			        
				<div class="col-md-2"><p>${content.userNickname}</p></div>
				<div id="userId" style="display:none;">${user.userId}</div>	        
				<div class="col-md-2"><p>${content.regDate}</p></div>
				<div class="col-md-1"><p>${content.viewCount }</p></div>
				<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
				<div class="col-md-3">
				</div>		
				</c:if>	
				</div>
				</div>
				</div>
	</c:forEach>	
	</c:if>
	
	<c:if test="${search.searchCondition=='2'&&search.searchKeyword!='0'&&search.searchCondition=='2'&&search.searchKeyword!='1'}">
	<c:forEach var="content" items="${list}">
	<c:if test="${content.contentCode=='0' || content.contentCode=='1'}">
	<div class="card text-center shadow rounded-pill" id="gradient" style="margin-bottom: 10px; height:40px; background-color:#cddefa;">
		 <div class="card-body" style="padding-top:10px;">	
			<div class="row">
				<div class="col-md-4" ><p><span class="text-danger"><strong>[공지]&ensp;</strong></span>${content.contentName}</p></div>
				<div id="contentNo" style="display:none;">${content.contentNo}</div>		     			        
				<div class="col-md-2"><p>${content.userNickname}</p></div>
				<div id="userId" style="display:none;">${user.userId}</div>	        
				<div class="col-md-2"><p>${content.regDate}</p></div>
				<div class="col-md-1"><p>${content.viewCount }</p></div>
				<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
				<div class="col-md-3">
				</div>		
				</c:if>	
				</div>
				</div>
				</div>
				</c:if>
	</c:forEach>
	<c:forEach var="content" items="${list}">
	<c:if test="${content.contentCode!='0' && content.contentCode!='1'}">
	<div class="card text-center shadow rounded-pill" style="margin-bottom: 10px; height:40px;">
		 <div class="card-body" style="padding-top:10px;">	
			<div class="row">
				<div class="col-md-4" ><p>${content.contentName}</p></div>
				<div id="contentNo" style="display:none;">${content.contentNo}</div>		     			        
				<div class="col-md-2"><p>${content.userNickname}</p></div>
				<div id="userId" style="display:none;">${user.userId}</div>	        
				<div class="col-md-2"><p>${content.regDate}</p></div>
				<div class="col-md-1"><p>${content.viewCount }</p></div>
				<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
				<div class="col-md-3">
				<p>
				<!-- 공감 -->
			   	  <a href="#" class="good" id="${content.contentNo}"  style=color:#020B13;><i class="fas fa-thumbs-up"></i></a>
			   	  <span name="${content.contentNo}" style=color:#020B13;>${content.goodCount}</span>
			   	  
			   	  <!-- 비공감 -->
			   	  <a href="#" class="bad" id="${content.contentNo}" style=color:#020B13;><i class="fas fa-thumbs-down"></i></a>
			   	  <a id="${content.contentNo}"  style=color:#020B13;>${content.badCount}</a> 
			   	  
			   	  <!-- 신고 하기 -->
			   	<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
				  <a href="#" class="reportRing" id="${content.contentNo}" data-toggle="modal"  style=color:#FFBF00>&ensp;<i class="fas fa-bell"></i></a>		  
				  </c:if> 
				</p></div>		
				</c:if>			  
		    </div>
		</div>        
	</div>
	</c:if>	
	</c:forEach>
	</c:if>
</div>
 </div>    
	<!-- 게시글 등록 Modal -->		  
		<form name='addContent'>
		<div class="modal modal-center fade" id="addContentModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
	  <div class="modal-dialog modal-lg modal-center" role="document">
	    <div class="modal-content modal-80size">

			<div class="modal-body" id="addContentModalBody" style="padding:30px;">
			
				<div style="margin-bottom:10px;">
					<select class="btn btn-outline-dark custom-select" id="boardCode" name="boardCode" style="width:200px;">
						<option selected>게시판 선택</option>
			    	    <c:if test="${sessionScope.user.role == '2'}">	  
			    		  <option value="0">공지사항</option>
			    	    </c:if>
			    	 	<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
			    		  <option value="1">자유게시판</option>
			    		</c:if>
			    		<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='6'||search.searchCondition=='2'&&search.searchKeyword=='7'}">
			    		  <option value="2">고객센터</option>
			    		</c:if>
	  				</select>
	  			
		  			<select class="btn btn-outline-dark custom-select" id="contentCode" name="contentCode" style="width:200px;">
						<option selected>게시글 선택</option>
			    	  <c:if test="${sessionScope.user.role == '2'}">	  
			    		<option value="0">티켓 거래 공지</option>
			    		<option value="1">자유게시판 이용 공지</option>
			    		<option value="2">자주묻는질문</option>
			    	  </c:if>
			    		<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'}">
			    		<option value="3">삽니다</option>
			    		</c:if>
			    		<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='4'}">
			    		<option value="4">팝니다</option>
			    		</c:if>
			    		<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='5'}">
			    		<option value="5">수다방</option>
			    		</c:if>
			    		<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='6'||search.searchCondition=='2'&&search.searchKeyword=='7'}">
			    		<option value="6">1:1 문의하기</option>
			    		<option value="7">환불 게시판</option>
			    		</c:if>	
		  			</select>
	  			
		  			<select class="btn btn-outline-dark custom-select" id="open" name="open" style="width:200px;">
						<option selected>공개 여부</option> 
			    		<option value="0">공개</option>
			    	  	<option value="1">비공개</option>
		  			</select>
				</div>
				<hr style="background-color:white"/>

			
			
<!-- 				<div class="form-group"> -->
			    <label for="userNickname" class="col" style="color:#020B13;font-size:17px;"><strong>작성자</strong></label><br/>
			    
			      <input type="text" class="form-control" id="userNickname" name="userNickname" value="${sessionScope.user.nickName}" style=width:200px; readonly>	     
			      <input type="hidden" name="userId" value="${sessionScope.user.userId}"><br/>
			        
			  
<!-- 			  	</div> -->
 		  
			  <div class="form-group">
			  
			    <label for="contentName" class="col-sm-offset-1 col-sm-3 control-label" style="color:#020B13;"><strong>글 제목</strong></label>   
			      <input type="text" class="form-control" id="contentName" name="contentName">
			  </div>
			
		  	<label for="contentBody" class="col-sm-offset-1 col-sm-3 control-label" style="color:#020B13;"><strong>글 내용</strong></label>
	
			<textarea class="form-control" id="contentBody" name="contentBody"></textarea>
			<script type="text/javascript">
				CKEDITOR.replace('contentBody'
					, {height: 200});
			</script>
			<br/>  		
	      
      	
	      <div class="modal-footer">
	        <button type="button" class="btn btn-info" data-dismiss="modal">등록</button>
	        <button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
	      </div>
	      </div>
		</div>	
	  </div>
	</div>			  
	</form>
	
	<!-- 신고하기 Modal -->
	<div class="modal fade" id="addReportModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content modal-80size">
					  <div class="modal-report">
					      <div class="modal-header">
					        <h5 class="modal-title" id="modalCenterTitle"><strong><span style="color:#020B13;">신고하기</span></strong></h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="background-color:#020B13">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <hr>
					      <div class="modal-body" id="addReportModalBody"> 	    
		  
			    <form name="addReport">
<!-- 			    	<div style='display:table-cell;vertical-align:middle'>신고자ID -->
<%-- 			      <input id="whiteId" name="whiteId" value="${sessionScope.user.userId}" readonly></div>  --%>
					
			    	<div class="col" style="color:#020B13;">작성자 : <span id="reportBlackId"></span></div>
					
					<div class="col" style="color:#020B13;">내용 :  <div id="reportContentBody"></div></div>
			    
				<br>
				<hr>
				<input type='hidden' name='blackId' value='' />
				<input type='hidden' name='contentNo' value=''/>				
				<input type='hidden' name='whiteId' value='${user.userId}'/>
				<input type='hidden' name='whiteNickname' value='${user.nickName}'/>
				<input type='hidden' name='reportCode' value='0'/>				
				
				
				<span style="color:#020B13;"><strong>신고 사유를 선택해주세요</strong></span>
			  	<div class='center'>
				<input type='checkbox' name='reportReasonCode' value='0' ><span style="color:#020B13;">&ensp;부적절한 홍보 게시물</span><br>
				<input type='checkbox' name='reportReasonCode' value='1'><span style="color:#020B13;">&ensp;음란성 또는 청소년에게 부적합한 내용</span><br>
				<input type='checkbox' name='reportReasonCode' value='2' ><span style="color:#020B13;">&ensp;특정인 대상의 비방/욕설</span><br>
				<input type='checkbox' name='reportReasonCode' value='3' ><span style="color:#020B13;">&ensp;명예훼손/사생활 침해 및 저작권침해 등</span><br>
				</div>
				
				</form>		
				   
				<div class="modal-footer">
		        <button type="button" class="btn btn-info" data-dismiss="modal">신고하기</button>
		        <button type="button" class="btn btn-warning" data-dismiss="modal">취소</button>
		      </div>
				</div></div>	        
						      </div>
						    </div>
						  </div>

</body>
<jsp:include page="/layout/footer.jsp" />
</html>