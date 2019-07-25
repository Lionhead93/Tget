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
	
	body {
            margin-top: 70px;
            
       }
			.dropbtn {
	  background-color: #7FFFD4;
	  color: white;
	  padding: 16px;
	  font-size: 16px;
	  border: none;
	}
	
	.dropdown {
	  position: relative;
	  display: inline-block;
	}
	
	.dropdown-content {
	  display: none;
	  position: absolute;
	  background-color: #f1f1f1;
	  min-width: 160px;
	  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  z-index: 1;
	}
	
	.dropdown-content a {
	  color: black;
	  padding: 12px 16px;
	  text-decoration: none;
	  display: block;
	}
	
	.dropdown-content a:hover {background-color: #7FFFD4;}
	
	.dropdown:hover .dropdown-content {display: block;}
	
	.dropdown:hover .dropbtn {background-color: #7FFFD4;}
	
/* 	게시글 등록 Modal */
		.modal-dialog.modal-80size {
	  width: 300%;
	  height: 100%;
	  margin: 0;
	  padding: 0;
	}
	
	.modal-content.modal-80size {
	  height: auto;
	  min-height: 80%;
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
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/community/getContentList").submit();
		}
		
 
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
 					$("form").attr("method" , "POST").attr("action" , "/community/addContent").submit();
					
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
				 	//alert($(this).val())
				 	self.location="/community/addReport?contentNo="+$(this).attr("id").trim();
				});
				
			 $( "a[href='#']:contains('환불 게시판')" ).on("click" , function() {
					self.location="/community/getRefundList";	
				
				});
			 
	 
			// 상세 조회
			$( "td:nth-child(2)" ).on("click" , function() {
				self.location ="/community/getContent?contentNo="+$(this).children('#contentNo').text().trim();
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
						backgroundColor: "",//#ddd
						fontWeight:""
				};
				$(this).css(style);
			});
	
	});	
		 
		 $(function() {
				
				$(".good").on("click" , function() {
					
					//div:contains("contentNo")
					//'div[name="contentNo"]'
					//'div[id="contentNo"]'
					var contentNo = $(this).attr("id").trim();
					var goodCount = $("span[name='"+contentNo+"']").text().trim();
					alert(goodCount);
					var result = parseInt(goodCount)+1;
					alert(result);
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
			        		alert("11");
 			        		content.text(result);
 			        
			        }
			        
			    	});
					alert("ok");
				});
		 });
		 
 		  $(function() {
				
				$(".bad").on("click" , function() {
				
					var contentNo = $(this).attr("id").trim();
					var badCount = $('a').closest("#"+contentNo+"").text().trim();
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
						//alert("찍혀라");
 								
						$.ajax( 
								
								{
									url : "/community/rest/getSearchWeather/",
									method : "POST" ,
// 									dataType : "json" ,
									data : JSON.stringify({
										lat : lat,
										lon : lon,
									}),
									headers : {
										
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {
										//alert(JSONData);
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
	<!--  화면구성 div Start /////////////////////////////////////-->
<div class="container">		
		
		<div class="page-header text-info">
	       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='0'}">
	       		<h3>Community > 공지사항</h3>
	       </c:if>
	       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='1'}">
	       		<h3>Community > 공지사항</h3>
	       </c:if>
	       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='2'}">
	       		<h3>Community > 공지사항</h3>
	       </c:if>
	       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'}">
	       		<h3>Community > 자유게시판</h3>
	       </c:if>
	       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='4'}">
	       		<h3>Community > 자유게시판</h3>
	       </c:if>
	       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='5'}">
	       		<h3>Community > 자유게시판</h3>
	       </c:if>
	      
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	  
		    	<p class="text-primary">
		    		전체  ${totalCount } 건수
		    	</p>
		    	<button type="button" id="addContent" class="btn btn-danger" data-toggle="modal" data-target="#addContentModal">글 쓰기</button>
				<button type="button" id="weatherModalButton" class="btn btn-info" data-toggle="modal" data-target="#weatherModal">날씨 안내</button>
				<button type="button" class="btn btn-warning">길 찾기 안내</button>
		<br/><br/><br/>
		   
				
		   
	 <div class="row">
	  <div class="col-md-2 text-center">
	  <br/><br/><br/><br/><br/>
	  
		<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='0'||search.searchCondition=='2'&&search.searchKeyword=='1'||search.searchCondition=='2'&&search.searchKeyword=='2'}">
			<ul class="list-group list-group-flush">
			<li class="list-group-item"><a href="#">티켓 거래 공지</a></li>
			<li class="list-group-item"><a href="#">자유게시판 이용 공지</a></li>
			<li class="list-group-item"><a href="#">자주 묻는 질문</a></li>
			</ul>
		</c:if>
		  
		<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
			<ul class="list-group list-group-flush">
			<li class="list-group-item"><a href="#">삽니다</a></li>
			<li class="list-group-item"><a href="#">팝니다</a></li>
			<li class="list-group-item"><a href="#">수다방</a></li>
			</ul>
		</c:if>
		</div>	
		
      <!--  table Start /////////////////////////////////////-->
     	<div class="col-md-10 text-center">
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left">글 제목</th>
<!--              <th align="left">글 내용</th>  -->
            <th align="left">작성자</th>
            <th align="left">작성일</th>
			
            <th align="left">공감/비공감</th>	
            <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
            <th align="left">신고</th>
            </c:if>	
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="content" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left" class="btn btn-link">${content.contentName}
			  <!--  <div id="contentNo" name="contentNo">${content.contentNo}</div>-->
			  <div id="contentNo" style="display:none;">${content.contentNo}</div></td>
			 <!-- <input type="hidden" id="contentNo" name=contentNo value="${content.contentNo}" /> --> 
			   
<%--  			  <td align="left">${content.contentBody}</td> --%>
			  <td align="left">${content.userId}</td>
			  <!-- <div id="userId" style="display:none;">${content.userId}</div></td> -->
			  <td align="left">${content.regDate}</td> 
			    
		   	  
		   	  
		   	  <!-- 공감 -->
		   	  <td align="left"><a href="#" class="good" id="${content.contentNo}"><i class="fas fa-thumbs-up"></i></a>
<%-- 		   	  <button class="btn btn-info" id="${content.contentNo}">공감</button> --%>
		   	  <span name="${content.contentNo}">${content.goodCount}</span>
		   	  
		   	  <!-- 비공감 -->
		   	  <a href="#" class="bad" id="${content.contentNo}"><i class="fas fa-thumbs-down"></i></a>
<%-- 		   	 <button class="btn btn-danger" id="${content.contentNo}">비공감</button> --%>
		   	 <a id="${content.contentNo}">${content.badCount}</a> 
		   	 
		   	 <!-- 신고 하기 -->
		   	 <c:if test="${search.searchCondition=='2'}">
			  <td align="left"><a href="#" class="reportRing" id="${content.contentNo}"><i class="fas fa-bell"></i></a>
<%-- 			  <button type="button" value="${content.contentNo}" class="btn btn-warning">신고</button> --%>
			  </td>
			  </c:if>
				</td>
  					 
			
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
					    <div class="modal-weather">
					      <div class="modal-header"> 
					        <h5 class="modal-title" id="modalCenterTitle"><strong>날씨 안내</strong></h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					     
					      </div>     
					   </div>
					          
					      <div class="modal-footer">
<!-- 					        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button> -->
<!-- 					        <button type="button" class="btn btn-primary">확인</button> -->
					        
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
</div>
</body>

</html>