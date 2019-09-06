 <%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>


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
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
	
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
		<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>	
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
		<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
			
		<script src="/resources/javascript/common.js" ></script>
		<script src="/resources/javascript/alarm.js" ></script>
		<script src="/resources/javascript/jquery.scrolly.min.js"></script>
		<script src="/resources/javascript/skel.min.js"></script>
		<script src="/resources/javascript/util.js"></script>
		<script src="/resources/javascript/main.js"></script>	
		<style>
		
		body {
			background-color: #EBF7FF;
			font-family: 'Nanum Gothic', sans-serif;
		}

		a{
			color: #041625;
		}
		.card:hover{
			background-color: powderblue;
			cursor:pointer
		}
		

    </style>
</head>
<body>			

			
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<jsp:include page="/layout/tgetHeader.jsp" />
	
			
	<div class="container" >
				
			<section>
				<br/>
				<div class="tabs tabs-style-topline">
				
						<nav>
							<ul>
								<li><a href="#section-topline-1"><h6><strong style="color:black;">회원목록 보기</strong></h6></a></li>
								<li><a href="#section-topline-2"><h6><strong style="color:black;">블랙리스트 보기</strong></h6></a></li>
							</ul>
						</nav>
					
				<div class="content-wrap">
					<section id="section-topline-1">
					
					 <div class="input-group-prepend row">
						  <label class="input-group-text" for="inputGroupSelect01" style="margin-left: 20px;">검색</label>						  
						  <select class="custom-select" id="inputGroupSelect01" style="width :150px;">
						    <option selected>All</option>
						    <option value="0">구매자</option>
						    <option value="1">판매자</option>
						    <option value="2">관리자</option>
						  </select>
						  <label class="input-group-text" style="margin-left: 290px;"><strong>총 ${totalCount}명</strong></label>
					</div><br/>
						<div class="row">			
							<c:forEach var="user" items="${list}">
							<c:if test="${user.blacklistCode == null}">
							<div name="${user.role}" id="${user.userId}" class="col-lg-4 getUser">
							<div class="card text-left shadow rounded" style="margin-bottom: 20px;">
								<div class="card-body">	
								  <h5 class="card-title">	
								  <c:if test="${user.role=='0'}">						        				      
									      <span class="badge badge-secondary">
										     구매자
										   </span>
								  </c:if>
								  <c:if test="${user.role=='1'}">						        				      
									      <span class="badge badge-success">
										    판매자
										   </span>
								  </c:if>
								  <c:if test="${user.role=='2'}">						        				      
									      <span class="badge badge-primary">
										     관리자
										   </span>
								  </c:if>        	
										  <strong>${user.userId}</strong>
									     				     
								   </h5>	
								</div> 		
							</div>	
							</div>
							</c:if>
					        </c:forEach>		       
						</div>				
					</section>
					
					<section id="section-topline-2">
					<br/>
						<div class="row">			
							<c:forEach var="user" items="${list}">
							<c:if test="${user.blacklistCode ne null}">
							<div id="${user.userId}" class="col-lg-4 getBlack">
									<div class="card text-left shadow rounded" style="margin-bottom: 20px;">
										<div class="card-body">	
										  <h5 class="card-title">	
										  <c:if test="${user.blacklistCode=='1'}">						        				      
											      <span class="badge badge-secondary">
												       7일 정지
												   </span>
										  </c:if>
										  <c:if test="${user.blacklistCode=='2'}">						        				      
											      <span class="badge badge-warning">
												        30일 정지
												   </span>
										  </c:if>
										  <c:if test="${user.blacklistCode=='3'}">						        				      
											      <span class="badge badge-danger">
												      	영구 정지
												   </span>
										  </c:if>        	
												  <strong>${user.userId}</strong>
											     				     
										   </h5>	
										</div> 		
									</div>		
								</div>
							</c:if>
					        </c:forEach>		       
						</div>	
					</section>							
					</div><!-- /content -->
				</div><!-- /tabs -->
									
		</section>
					
	</div>	
<div class="modal fade" id="getUserModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content rounded">
					      <div id="getUserModalBody" class="modal-body">
					      	<div class="text-center">
					      	<h4>
					      	<strong><i class="far fa-id-card"></i> 회원 정보</strong>
					      	<a href="#" class="close text-dark" data-dismiss="modal">&times;</a>
					      	</h4>
					      	</div>
					        <hr/>
					        <div class="row">
					        	<div class="col-4 text-center"><span><strong>아이디</strong></span></div>
					        	<div class="col-8"><span id="modalUserId"></span></div> 
					        </div><br/>
					        <div class="row">
					        	<div class="col-4 text-center"><span><strong>이름</strong></span></div>
					        	<div class="col-8"><span id="modalUserName"></span></div> 
					        </div><br/>
					        <div class="row">
					        	<div class="col-4 text-center"><span><strong>닉네임</strong></span></div>
					        	<div class="col-8"><span id="modalUserNickname"></span></div> 
					        </div><br/>
					        <div class="row">
					        	<div class="col-4 text-center"><span><strong>권한</strong></span></div>
					        	<div class="col-4"><span id="modalUserRole"></span></div>
					        	<div class="col-4">
					        	<a class="btn btn-outline-primary addCoupon" href="#" >쿠폰 발급</a> 
					        	</div>
					        </div><br/>
					        <div class="row">
					        	<div class="col-4 text-center"><span><strong>계정연동여부</strong></span></div>
					        	<div class="col-8">
					        	<span id="modalUserNaver"><img src="/resources/images/naver.jpg" width="30px;"></span>&nbsp;&nbsp;
					        	<span id="modalUserKakao"><img src="/resources/images/kakao.jpg" width="30px;"></span>
					        	</div> 
					        </div>
					      <br/>
					      </div>
					     
					      </div>
					  </div>
</div>	


<div class="modal fade" id="getBlackModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content rounded">
					      <div id="getBlackModalBody" class="modal-body">
					      	<div class="text-center">
					      	<h4>
					      	<strong><i class="fas fa-ban"></i> 정지회원 정보</strong>
					      	<a href="#" class="close text-dark" data-dismiss="modal">&times;</a>
					      	</h4>
					      	</div>
					        <hr/>
					        <div class="row">
					        	<div class="col-4 text-center"><span><strong>아이디</strong></span></div>
					        	<div class="col-8"><span id="modalBlackId"></span></div> 
					        </div><br/>
					        <div class="row">
					        	<div class="col-4 text-center"><span><strong>이름</strong></span></div>
					        	<div class="col-8"><span id="modalBlackName"></span></div> 
					        </div><br/>
					        <div class="row">
					        	<div class="col-4 text-center"><span><strong>닉네임</strong></span></div>
					        	<div class="col-8"><span id="modalBlackNickname"></span></div> 
					        </div><br/>
					        <div class="row">
					        	<div class="col-4 text-center"><span><strong>정지 일</strong></span></div>
					        	<div class="col-8"><span id="modalBlackStart"></span></div> 
					        </div><br/>
					        <div class="row">
					        	<div class="col-4 text-center"><span><strong>정지 해제일</strong></span></div>
					        	<div class="col-8"><span id="modalBlackEnd"></span></div> 
					        </div><br/>
					      <br/>
					      </div>
					     
					      </div>
					  </div>
</div>				
 
<script src="/resources/javascript/cbpFWTabs.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
			(function() {

				[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
					new CBPFWTabs( el );
				});

			})();
</script>	
<script>

	$(".addCoupon").on("click",function(){
		
		var userId = $(this).attr("id").trim();
		
		swal("쿠폰 발급", userId+"님에게 쿠폰을 발급합니다.", "info")
		   .then(function(result){
			   if(result){
				   $.ajax({
						url:"/coupon/rest/addCoupon/"+userId+"/",
						method : "GET" ,
			            dataType : "json",
			            headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},            
			            success:function(data){
			            	swal("발급 성공!", "", "success")
			            }
			    	});
			   }
		 });
		
		
	});
	
	$(".getBlack").on("click",function(){
		var userId = $(this).attr("id").trim();
		
		$.ajax({
			url : "/user/json/getUser/"+userId+"/" ,
			method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
          	success: function(data){
          		var blacklistStartDate = new Date(data.blacklistStartDate).toLocaleString();
          		var blacklistEndDate = new Date(data.blacklistEndDate).toLocaleString();
          		
          		$("#modalBlackId").html(data.userId);
          		$("#modalBlackName").html(data.userName);
          		$("#modalBlackNickname").html(data.nickName);
          		$("#modalBlackStart").html(blacklistStartDate);
          		$("#modalBlackEnd").html(blacklistEndDate);
          		
          		$('#getBlackModal').modal('show');
          	}
		});
	});
	
	
	$(".getUser").on("click",function(){
		var userId = $(this).attr("id").trim();
		$.ajax({
			url : "/user/json/getUser/"+userId+"/" ,
			method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
          	success: function(data){
          		
          		$("#modalUserKakao").show();
          		$("#modalUserNaver").show();
          		$(".addCoupon").hide();          		
          		
          		$("#modalUserId").html(data.userId);
          		$("#modalUserName").html(data.userName);
          		$("#modalUserNickname").html(data.nickName);
          		if(data.role=="0"){
          			$("#modalUserRole").html("구매자");
          		}else if(data.role=="1"){
          			$(".addCoupon").show();
          			$(".addCoupon").attr("id",data.userId);
          			$("#modalUserRole").html("판매자");
          		}else if(data.role=="2"){
          			$(".addCoupon").show();
          			$(".addCoupon").attr("id",data.userId);
          			$("#modalUserRole").html("관리자");
          		}
          		if(data.kakaoId==null){
          			$("#modalUserKakao").hide();          			
          		}
          		if(data.naverId==null){
          			$("#modalUserNaver").hide();          
          		}
          		$('#getUserModal').modal('show');
          	}
		});
	});
	
	$("#inputGroupSelect01").on('change', function(){
		var role = $(this).val();
		if(role=="All"){
			$(".col-lg-4").attr("style","");
			return;
		}
		if(role=="0"){
			$(".col-lg-4").attr("style","");
			$("div[name='1']").attr("style","display: none;");
			$("div[name='2']").attr("style","display: none;");
			return;
		}
		if(role=="1"){
			$(".col-lg-4").attr("style","");
			$("div[name='0']").attr("style","display: none;");
			$("div[name='2']").attr("style","display: none;");
			return;
		}
		if(role=="2"){
			$(".col-lg-4").attr("style","");
			$("div[name='0']").attr("style","display: none;");
			$("div[name='1']").attr("style","display: none;");
			return;
		}
		
	});
</script>	 
<jsp:include page="/layout/footer.jsp" />
			
</body>


</html> 