 <%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	
	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Acme|Bungee+Shade|Fredericka+the+Great&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
	<style>
	 div.container{
	 	margin-top: 0px;
 		font-family: 'Noto Sans KR', sans-serif;
	 	font-size: 20px;        
 	}
 	
 	h4{
 		font-family: 'Shadows Into Light', 'Nanum pen Script', cursive;
 		font-weight: bold;
 	}
 	
 	ul {
 		font-family: 'Shadows Into Light', 'Nanum pen Script', cursive;
 		font-size: 25px;
 	}
	</style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		$( function(){

// 			$.ajax(
// 					{
// 						url : "/event/rest/getPopularEventList",
// 						method : "POST",
// 						dataType : "text",
// 						success : function(JSONData, status){
// 								alert("JSONData : \n"+JSONData);
// 								$.each(JSONData, function(index,value){
// 									popularEventList[index] = value;
// 									alert("popularEventList[index] : "+popularEventList[index]);
// 								 });
// 						}	
// 			});	


			$("a.navbar-brand").on("click",function(){
				self.location = "/";
			});
			
			$("a:contains('countdown')").on("click",function(){
				self.location = "/event/countdown";
			});
			$("a:contains('관리자페이지')").on("click",function(){
				self.location = "/event/getEventManage";
			});
			
			$("a:contains('관심이벤트')").on("click",function(){
				
				self.location = "/event/getInterestedEventList";
			});
			
			$("a:contains('티켓판매')").on("click",function(){
				
				self.location = "/ticket/addTicketInfo?eventId=104175822";
			});
			
			$("a:contains('티켓구매')").on("click",function(){
				
				self.location = "/tran/addTran?ticketNo=10004";
			});
			
			$("a:contains('getTicket')").on("click",function(){
				
				self.location = "/ticket/getTicket?ticketNo=10004";
			});
			
			$("a:contains('내 티켓목록')").on("click",function(){
				
				self.location = "/ticket/getTicketList?menu=seller";
			});
			$("a:contains('검증 티켓목록')").on("click",function(){
				
				self.location = "/ticket/getTicketList?menu=check";
			});
			$("a:contains('내 거래내역')").on("click",function(){
				
				self.location = "/tran/getTranList?menu=user";
			});
			
			
			
			$("a:contains('리뷰작성')").on("click",function(){
				popWin = window.open("/rnp/addReview?tranNo=10000","popWin",
						"left=500, top=100, width=600, height=500, "
						+"marginwidth=0, marginheight=0, scrollbars, scrolling, menubar=no, resizable");
				
// 				self.location = "/rnp/addReview?tranNo=10000";
			});
			$("a:contains('내리뷰조회')").on("click",function(){
				self.location = "/rnp/getReviewList";
			});
			$("a:contains('내평점조회')").on("click",function(){
				self.location = "/rnp/getSellerEstimationList?sellerId="+session.user.userId;
			});
			$("a:contains('포인트내역조회')").on("click",function(){
				self.location = "/rnp/";
			});
			
			$("a:contains('쿠폰등록')").on("click",function(){
				self.location = "/ticket/getTicketList?menu=check";
			});
			/* $("a:contains('내쿠폰조회')").on("click",function(){
				self.location = "/coupon/getCoupon";
			}); */
		/* 	$("a:contains('쿠폰목록조회')").on("click",function(){
				self.location = "/ticket/getTicketList?menu=check";
			}); */
		
			
		});
		
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('회원가입')").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		//============= 로그인 화면이동 =============
			$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('아이디찾기')").on("click" , function() {
				self.location = "/user/finduserId.jsp"
			});
		});
			
			
			
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('로그인')").on("click" , function() {
				self.location = "/user/login"
			});
		});
		
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('로그아웃')").on("click" , function() {
				self.location = "/user/logout"
			});
		});
		
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('내정보보기')").on("click" , function() {
			$(self.location).attr("href","/user/getUser?userId=${sessionScope.user.userId}");
			});
		});
		
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('마이페이지')").on("click" , function() {
			$(self.location).attr("href","/user/myPage?userId=${sessionScope.user.userId}");
			});
		});
		
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('내쿠폰조회')").on("click" , function() {
			$(self.location).attr("href","/coupon/getCoupon?userId=${sessionScope.user.userId}");
			});
		});
		
		
		
		$( function() {
			//==> 추가된부분 : "addUser"  Event 연결
			$("a[href='#' ]:contains('블랙리스트관리')").on("click" , function() {
				self.location = "/user/listUser"
			});
		});
		
		$( function(){
			
			$("a:contains('공지 게시판')").on("click", function(){
				self.location="/community/getContentList"
			});
		});
		
		
		
		$( function(){			
			
			if('${user}'!=''){
				getNoReadAlarmCount("${user.userId}"); 
				$("button:contains('Alarm')").attr("data-toggle","modal").attr("style","");
			}			
			//알람리스트 madal 출력
			$("button:contains('Alarm')").on("click", function(){
				getAlarmModal("${user.userId}");				
			});
		});
		
		

		
	</script>	
	
</head>

<body>



 
<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-dark ">
 	
<div class="container">	
				<a class="navbar-brand" >
					<button type="button" class="btn btn-dark">
								<h4><i class="fas fa-running"></i> T-GET</h4>
					</button>
				</a>
 	<!-- <a class="navbar-brand" ><i class="fas fa-running"></i> T-GET</a>	 -->		
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
  	</button>	
			
	<div class="collapse navbar-collapse" id="navbarNavDropdown">
				 
				 
				 
				 <ul class="nav navbar-nav">           	
				 
<!-- 				 <li class="nav-item active"> -->
<!-- 			              <a class="nav-link" href="#">aaa</a> -->
<!-- 			        </li> -->
	            	
	            	<c:if test="${empty user}">
            		<li class="nav-item active">
			              <a class="nav-link" href="#">로그인</a>
			        </li>  
			      	</c:if>
			      	<c:if test="${!empty user}">
            		<li class="nav-item active">
			              <a class="nav-link" href="#">로그아웃</a>
			        </li>  
			      	</c:if>
	            	
<%-- 	            	<c:if test="${user.role == 2 }"> --%>
<!--             		<li class="nav-item active"> -->
<!-- 			              <a class="nav-link" href="#">이벤트관리</a> -->
<!-- 			        </li>   -->
<%-- 			      	</c:if> --%>
			      	<c:if test="${!empty user }">
			      	<li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          	이벤트관리
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          <c:if test="${user.role == 2 }">
		            	  	<a class="dropdown-item" href="#">관리자페이지</a>
					      </c:if>				          
				          <a class="dropdown-item" href="#">관심이벤트</a>
				          <a class="dropdown-item" href="#">countdown</a>
				        </div> 
				    </li>
			      	</c:if>	
			      	
			        <li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          	User
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
<!-- 				          <a class="dropdown-item" href="#">로그인</a> -->
<!-- 				           <a class="dropdown-item" href="#">로그아웃</a> -->
				          <a class="dropdown-item" href="#">회원가입</a>
				            <a class="dropdown-item" href="#">아이디찾기</a>
				            <a class="dropdown-item" href="#">마이페이지</a>
				          <a class="dropdown-item" href="#">내정보보기</a>
				          <a class="dropdown-item" href="#">블랙리스트관리</a>
				        </div> 
				    </li>
	            	
	            	<li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          	Ticket
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          <a class="dropdown-item" href="#">getTicket</a>
				          <a class="dropdown-item" href="#">티켓판매</a>
				          <a class="dropdown-item" href="#">티켓구매</a>
				          <a class="dropdown-item" href="#">내 티켓목록</a>
				          <a class="dropdown-item" href="#">검증 티켓목록</a>
				          <a class="dropdown-item" href="#">내 거래내역</a>
				        </div>
				    </li>
	            	
	            	<li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          	Community
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          <a class="dropdown-item" href="#">공지 게시판</a>
				          <a class="dropdown-item" href="#">자유 게시판</a>
				        </div>
				    </li>  
				    <li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          	ReviewAndPoint
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          <a class="dropdown-item" href="#">리뷰작성</a>
				          <a class="dropdown-item" href="#">내리뷰조회</a>
				          <a class="dropdown-item" href="#">내평점조회</a>
				          <a class="dropdown-item" href="#">포인트내역조회</a>
				        </div>
				    </li>  
				     <li class="nav-item dropdown"> 
<!-- 				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> -->
<!-- 				          	인기이벤트 -->
<!-- 				        </a> -->
<!-- 				        <div class="dropdown-menu popularEvent" aria-labelledby="navbarDropdownMenuLink"> -->
				          
<!-- 				        </div> -->
<!-- 				    </li> -->
				    
				    <li class="nav-item dropdown">
				        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				          	Coupon
				        </a>
				        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
				          <a class="dropdown-item" href="#">쿠폰등록</a>
				          <a class="dropdown-item" href="#">내쿠폰조회</a>
				          <!-- <a class="dropdown-item" href="#">쿠폰목록조회</a> -->
				        </div>
				    </li>  
				    
				    <li class="nav-item active">
						    <button type="button" class="btn btn-dark" style="display: none;" data-target="#alarmModal">
							 Alarm <span class="badge badge-light" id="noReadAlarmCount"></span>
							</button> 		            	
	            	</li>   
	          </ul>
	 </div>
	 </div>
 		
 			
</nav>
			<!-- 알림내역 모달창  -->
					<div class="modal fade" id="alarmModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-md" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="modalCenterTitle">My Alarm</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					      </div>
					      <div class="modal-footer">
					        </div>
					    </div>
					  </div>
					</div>
	  	
</body>

</html>