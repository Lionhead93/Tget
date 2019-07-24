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
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/community/getContentList").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 
		 });

		 $(function() {
			
			 $( "button.btn.btn-danger:contains('게시글 등록하기')" ).on("click" , function() {
					self.location="/community/addContent"	
				});
			 
			 $( "button.btn.btn-warning:contains('길 찾기 안내')" ).on("click" , function() {
				 var popOption = "left=500, top=100, width=600, height=600, resizable=no, location=no;"	                    
		             window.open("/community/getSearchLoad","T-get 길 찾기 ",popOption);	
				 
				});
			 
			 $( "a[href='#']:contains('티켓 거래 공지')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=1&searchKeyword=0";	
				
				});
			 
			 $( "a[href='#']:contains('자유게시판 이용 공지')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=1&searchKeyword=1";	
				
				});
			 
			 $( "a[href='#']:contains('자주 묻는 질문')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=1&searchKeyword=2";	
				
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
			 
			 $( "button.btn.btn-warning:contains('신고')" ).on("click" , function() {	
				 	//alert($(this).val())
				 	self.location="/community/addReport?contentNo="+$(this).val();
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
				
				$("ion-icon.btn.btn-info:contains('공감')").on("click" , function() {
					
					//div:contains("contentNo")
					//'div[name="contentNo"]'
					//'div[id="contentNo"]'
					var contentNo = $(this).attr("id").trim();
					var goodCount = $('span').closest("#"+contentNo+"").text().trim();
					//alert(goodCount);
					var result = parseInt(goodCount)+1;
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
			        	//alert(data.result);
			        	
 			        	if($.trim(data.result)=="good"){
 			        		$('span').closest("#"+contentNo+"").text(result);
 			        	}
			        	
			        }
			        
			    	});
					alert("ok");
				});
		 });
		 
 		  $(function() {
				
				$("ion-icon.btn.btn-danger:contains('비공감')").on("click" , function() {
				
					var contentNo = $(this).attr("id").trim();
					var badCount = $('a').closest("#"+contentNo+"").text().trim();
					var result1 = parseInt(badCount)+1;
					
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
 			        	$('a').closest("#"+contentNo+"").text(result1);
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
	       <h3>Community</h3>
	       
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${totalCount } 건수
		    	</p>
		    
<!-- 		    	<div class="dropdown"> -->
<!-- 				  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!-- 				   	게시판 선택 -->
<!-- 				  </button> -->
<!-- 				  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"> -->
<!-- 				    <a class="dropdown-item" id="boardCode0" href="#">공지사항</a> -->
<!-- 				    <a class="dropdown-item" id="boardCode1" href="#">자유게시판</a> -->
<!-- 				    <a class="dropdown-item" id="boardCode2" href="#">고객센터</a> -->
<!-- 				  </div> -->
<!-- 				</div> -->
				
<!-- 				<div class="dropdown"> -->
<!-- 				  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!-- 				   	게시글 선택 -->
<!-- 				  </button> -->
<!-- 				  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"> -->
<%-- 				   <c:if test="${sessionScope.user.role == '2'}"> --%>
<!-- 				    <a class="dropdown-item" id="contentCode0" href="#">티켓 거래 공지</a> -->
<!-- 				    <a class="dropdown-item" id="contentCode1" href="#">자유게시판 이용 공지</a> -->
<!-- 				    <a class="dropdown-item" id="contentCode2" href="#">자주 묻는 질문</a> -->
<%-- 				    </c:if> --%>
				    
<!-- 				    <a class="dropdown-item" id="contentCode3" href="#">삽니다</a> -->
<!-- 				    <a class="dropdown-item" id="contentCode4" href="#">팝니다</a> -->
<!-- 				    <a class="dropdown-item" id="contentCode5" href="#">수다방</a> -->
<!-- 				    <a class="dropdown-item" id="contentCode6" href="#">1:1 문의하기</a> -->
<!-- 				    <a class="dropdown-item" id="contentCode7" href="#">환불 게시판</a>  -->
<!-- 				  </div> -->
<!-- 				</div> -->
				
				<button type="button" class="btn btn-danger">게시글 등록하기</button>
				
				<button type="button" id="weatherModalButton" class="btn btn-info" data-toggle="modal" data-target="#weatherModal">날씨 안내</button>
				<button type="button" class="btn btn-warning">길 찾기 안내</button>
				 <div>
				 
		    <div class="col-md-6 text-right">
			    <!-- <form class="form-inline" name="detailForm">
	
			<div class="form-group">
			    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어">
				  </div>
				  
				  <button type="button" class="btn btn-info">검색</button>
				  
				  PageNavigation 선택 페이지 값을 보내는 부분
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				   
				</form>
			  		 -->	 
  			</div>
		</div>
				
		   
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left">글 제목</th>
<!--              <th align="left">글 내용</th>  -->
            <th align="left">작성자</th>
            <th align="left">작성일</th>
            <th align="left">신고하기</th>
            <th align="left">공감/비공감</th>
            
            
			
			
			
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
			  <td align="left"><button type="button" value="${content.contentNo}" class="btn btn-warning">신고</button>
		   	  <td align="left">
		   	  <ion-icon name="thumbs-up" class="btn btn-info" id="${content.contentNo}">공감</ion-icon>
		   	  <span id="${content.contentNo}">${content.goodCount}</span>
		   	 <ion-icon name="thumbs-down" class="btn btn-danger" id="${content.contentNo}">비공감</ion-icon>
		   	 <a id="${content.contentNo}">${content.badCount}</a> 
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
<%-- 	<jsp:include page="../common/pageNavigator_new.jsp"/> --%>
	<!-- PageNavigation End... -->
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
					  
					  
	

</body>

</html>