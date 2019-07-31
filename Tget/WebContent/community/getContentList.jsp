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
	

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	body{	
		      color: #FBFCFE ;		  
			  background-color: #062038;
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
		#tgetHeader{
			margin-top:30px;
		   color: #FBFCFE;	
	       padding-bottom: 200px;
	       margin-bottom: 30px;
	       		background: url(/resources/images/pic05.jpg) no-repeat center center fixed; 
				  -webkit-background-size: cover;
				  -moz-background-size: cover;
				  -o-background-size: cover;
				  background-size: cover;	
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
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
	
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
			 
			 $( "button.btn.btn-warning:contains('길 찾기 안내')" ).on("click" , function() {
				 var popOption = "left=500, top=100, width=600, height=600, resizable=no, location=no;"	                    
		             window.open("/community/getSearchLoad","T-get 길 찾기 ",popOption);	
				 
				});
			 
			 $( "a[href='#']:contains('티켓 거래 공지')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=0";	
				
				});
			 
			 $( "a[href='#']:contains('자유게시판 이용 공지')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=1";	
				
				});
			 
			 $( "a[href='#']:contains('자주 묻는 질문')" ).on("click" , function() {
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
			$( "td:nth-child(1)" ).on("click" , function() {
				self.location ="/community/getContent?contentNo="+$(this).children('#contentNo').text().trim();
			});

			$( "td:nth-child(1)" ).css("color" , "black");
			
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
 		  
 		 $(function getSearchWeather(lat, lon) {
			
				$("button.btn.btn-info:contains('날씨 안내')").on("click" , function() {
						
 								
						$.ajax( 
								
								{
									url : "/community/rest/getSearchWeather/",
									method : "POST" ,

									data : JSON.stringify({
										lat : lat,
										lon : lon,
									}),
									headers : {
										
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {
									
										var displayValue ="날씨 : "+JSONData.weather+"<br/>"
														+"온도 : "+JSONData.temp+"℃<br/>"
														+"풍속 : "+JSONData.wind+"m/s<br/>"
														+"흐림 : "+JSONData.clouds+"%<br/>";
										
										$(".modal-body").html(displayValue);
									}
							});
				});		
			});	
	</script>
	
</head>

<body>
	
	<jsp:include page="/layout/tgetToolbar.jsp" />
	
	<div id="tgetHeader" class="text-center">
	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="text-center">	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->	    	
		    	<button type="button" id="addContent" class="btn btn-danger" data-toggle="modal" data-target="#addContentModal">글 쓰기</button>
				<button type="button" id="weatherModalButton" class="btn btn-info" data-toggle="modal" data-target="#weatherModal">날씨 안내</button>				
				<button type="button" class="btn btn-warning">길 찾기 안내</button>
				<p class="text-primary">
		    		전체  ${totalCount } 건수
		    	</p>
		<br/><br/><br/>
	</div>	   
		
      <!--  table Start /////////////////////////////////////-->
     <div class="col-md-10 text-center">
     	
	      <table class="table" >	      
	        <thead>
	          <tr>
	          	
	            <th>글 제목</th>
	            <th>작성자</th>
	            <th>작성일</th>				
	            <th>공감/비공감</th>	
	            <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
	            <th>신고</th>
	            </c:if>	
	          </tr>
	        </thead>
	       
			<tbody>
			
			  <c:forEach var="content" items="${list}">
				<tr>
				  
				  <td>${content.contentName}
				  <!--  <div id="contentNo" name="contentNo">${content.contentNo}</div>-->
				  <div id="contentNo" style="display:none;">${content.contentNo}</div></td>
				 <!-- <input type="hidden" id="contentNo" name=contentNo value="${content.contentNo}" /> --> 
				   
	<%--  		  <td align="left">${content.contentBody}</td> --%>
				  <td>${content.userId}</td>
				  <!-- <div id="userId" style="display:none;">${content.userId}</div></td> -->
				  <td>${content.regDate}</td> 
				    
			   	  
			   	  
			   	  <!-- 공감 -->
			   	  <td><a href="#" class="good" id="${content.contentNo}"><i class="fas fa-thumbs-up"></i></a>
			   	  <span name="${content.contentNo}">${content.goodCount}</span>
			   	  
			   	  <!-- 비공감 -->
			   	  <a href="#" class="bad" id="${content.contentNo}"><i class="fas fa-thumbs-down"></i></a>
			   	  <a id="${content.contentNo}">${content.badCount}</a> 
			   	  </td>
			   	  
				   	 <!-- 신고 하기 -->
			   	<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
				  <td align="left"><a href="#" class="reportRing" id="${content.contentNo}" data-toggle="modal" ><i class="fas fa-bell"></i></a>	
				  </td>
				  </c:if>
				  	
			</tr>
          <tr>
		</tr>
          </c:forEach>
			
	        </tbody>
	      
	      </table>
      </div>
	  <!--  table End /////////////////////////////////////-->
	</div>  
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
	<!-- 날씨 안내 Modal -->
	<div class="modal fade" id="weatherModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-md" role="document">
					    <div class="modal-content modal-80size">
					    <div class="modal-weather">
					      <div class="modal-header"> 
					        <h5 class="modal-title" id="modalCenterTitle"><strong>날씨 안내</strong></h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body" id="getWeatherModalBody">
					     
					      </div>     
					   </div>
					          
					      <div class="modal-footer">
<!-- 					        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button> -->
<!-- 					        <button type="button" class="btn btn-primary">확인</button> -->
					        
					      </div>
					    </div>
					    </div>
					  </div> 
	<!-- 게시글 등록 Modal -->		  
		<form name='addContent'>
		<div class="modal modal-center fade" id="addContentModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
	  <div class="modal-dialog modal-lg modal-center" role="document">
	    <div class="modal-content modal-80size">

	      <div class="modal-body" id="addContentModalBody">
	      <select id="boardCode" name="boardCode">
   			 	<option value="">게시판 선택</option>
		   		<c:if test="${sessionScope.user.role == '2'}">
		   			<option value="0">공지사항</option>
		   			</c:if>
	   			 	<option value="1">자유게시판</option>
	   			 	<option value="2">고객센터</option>
   			 	</select> 
   			 	
   			 <select id="contentCode" name="contentCode">
   			 	<option value="">게시글 선택</option>
		   			 <c:if test="${sessionScope.user.role == '2'}">   			 		
			   			 	<option value="0">티켓 거래 공지</option>
			   			 	<option value="1">자유게시판 이용 공지</option>
			   				<option value="2">자주 찾는 질문</option>
			   		</c:if>
	   		
	   			 	<option value="3">삽니다</option>	
	   			 	<option value="4">팝니다</option>
	   			 	<option value="5">수다방</option>
	   			 	<option value="6">1:1 문의하기</option>
	   			 	<option value="7">환불 게시판</option>
   			 	</select>
   			 	
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
	      
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-info" data-dismiss="modal">등록</button>
	        <button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
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
					        <h5 class="modal-title" id="modalCenterTitle"><strong>신고하기</strong></h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body" id="addReportModalBody"> 	    
		  
			    <form name="addReport">
<!-- 			    	<div style='display:table-cell;vertical-align:middle'>신고자ID -->
<%-- 			      <input id="whiteId" name="whiteId" value="${sessionScope.user.userId}" readonly></div>  --%>
					
			    	<div class="col">작성자 : <span id="reportBlackId"></span></div>
					
					<div class="col">내용 :  <div id="reportContentBody"></div></div>
			    
				<br>
				<hr>
				<input type='hidden' name='blackId' value='' />
				<input type='hidden' name='contentNo' value=''/>				
				<input type='hidden' name='whiteId' value='${user.userId}'/>
				<input type='hidden' name='whiteNickname' value='${user.nickName}'/>
				<input type='hidden' name='reportCode' value='0'/>				
				
				
				<strong>신고 사유를 선택해주세요</strong>
			  	<div class='center'>
				<input type='checkbox' name='reportReasonCode' value='0'>부적절한 홍보 게시물<br>
				<input type='checkbox' name='reportReasonCode' value='1'>음란성 또는 청소년에게 부적합한 내용<br>
				<input type='checkbox' name='reportReasonCode' value='2' >특정인 대상의 비방/욕설<br>
				<input type='checkbox' name='reportReasonCode' value='3' >명예훼손/사생활 침해 및 저작권침해 등<br>
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