<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>T-GET</title>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	<link rel="stylesheet" href="/resources/css/login.css" />
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	
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
    
	
   
	<style>
			
		body{	
		      color: #FBFCFE ;		  
			  background-color: #062038;
			  margin-top: 50px;				
			  font-family: 'Nanum Gothic', sans-serif;
		}
		#ticketInput{
			  border: 1px solid #D6CDB7;
			  background-color: #193147;
		}
		a, hr{
			color: #FBFCFE ;	
		}
		.col-lg-3{			
			margin-bottom: 20px;
		}
		
		section{
			margin-left: 40px;
		} 
		#footer{
			background-color: #1B1B1F;
		}
       .list-group-item{
			  margin-left:50px;	
			  color: #FBFCFE ;
			  border: 1px groove white;		  
			  background-color: #062038;
		}
    
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">	
	
	function fncAddTicketInfo(){
		//Form 유효성 검증
	 	var amount = $("input[name='amount']").val();
		var type = $("input[name='type']").val();
		var seat = $("input[name='seat']").val();
				
		if(${user.role=='0'}){
			history.go(0);
			return;
		}
		
		if(amount == null || amount.length<1){
			alert("수량은 반드시 입력하여야 합니다.");
			return;
		}
		if(amount.length>2){
			alert("수량은 최대 99장까지 밖에 등록할 수 없습니다.");
			return;
		}
		if(isNaN(amount)==true) {
			alert("수량에 숫자입력 바랍니다.");
			return;
		}
		if(type == null || type.length<1){
			alert("형태는 반드시 입력하여야 합니다.");
			return;
		}
		if(seat == null || seat.length<1){
			alert("좌석 반드시 입력하셔야 합니다.");
			return;
		}
	
		$("form").attr("method" , "POST").attr("action" , "/ticket/addTicketInfo").submit();
	}		
	
	$(function(){
				
	    $("button:contains('계 속')").on("click",function(){
	    	
	    		    	
	    	fncAddTicketInfo();
	    		    	
	    });
		
		$("a[href='#']:contains('취 소')").on("click",function(){
	    	
			history.go(-1);
	    	
	    });
	    
	});
	</script>		
    
</head>

<body>
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<jsp:include page="/layout/tgetHeader.jsp" />	
		<br/>
		<div class="row">
			<div class="col-lg-2">
				<div class="sticky-top">
		      	<div class='text-center'>
		      		<br/><br/><br/>
					<p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;티켓 > 티켓 판매 </strong></p>
					<br/>
												<ul class="list-group list-group-flush">										  
												  <li class="list-group-item"><a href="#">판매자 가이드</a></li>
												  <li class="list-group-item"><a href="#">내 판매티켓</a></li>
												  <li class="list-group-item"><a href="#">내 거래내역</a></li>
												  <li></li>											  
												</ul> 											  
				</div> 
				</div>
			</div>
			
			<div id="ticketInput" class="col-lg-8">
			<div class="text-center">
			<form class="form-horizontal">
			<input type="hidden" name="event.eventId" value="${event.eventId}" >
			<input type="hidden" name="event.eventName" value="${event.eventName}" >
			<input type="hidden" name="seller.userId" value="${user.userId}" >	
			<input type="hidden" name="couponNo" value="0" >	
			<input type="hidden" name="couponCode" value="" >	  
			<br/>
			<h1 class="display-4">${event.koName}</h1>
			  <p class="lead">${event.eventLocation}</p>
			  <p>${event.eventDate}</p>
			<hr class="my-4">
			  <div class="form-group">
			 
			    <div>
			    <strong>수량 : </strong>      <input type="text" id="amount" name="amount" style="width: 90px !important" >
			    </div>
			    <small class="text-danger">*연석 일 경우만 한번에 등록</small>
			  </div>
			<br/>  
			  <div class="form-group">
			    <strong>형태 : </strong>
			      <input type="radio" name="type" value="0" checked="checked" /> 종이티켓
				  <input type="radio" name="type" value="1" /> 전자티켓
			  </div>
			<br/>  
			  <div class="form-group" >
			    <strong>좌석 : </strong>
			    <input type="text" id="seat" name="seat" style="width: 90px !important" maxlength="10" placeholder="예) B2">  구역 (존/블럭)		  
			    <input type="text" id="seat" name="seat" style="width: 90px !important" maxlength="10" placeholder="예) 6"> 열
			    
			  </div>
			<br/>
			<strong>특이사항(선택)</strong>  
			  <div class="form-group">
			     
			      <textarea name="options" cols="40" rows="8" ></textarea>
			  </div>
			<br/>
				<div class="form-group">
				<div class="row">
					<div class="col-4"></div>
					<div class="col-4">
						<div class="addCoupon">
					    <a class="btn btn-outline-info" role="button">쿠폰적용 하기</a>
					    </div>
					</div>
				    <div class="col-4"></div>					
			    </div>
			  </div>
			<br/>			  
			  <div class="form-group">
			    
			      <button type="button" class="btn btn-outline-light">계 속</button>
				  <a class="btn btn-outline-light btn" href="#" role="button">취 소</a>
			      <a href="#" role="button" id="addSellerShow" style="display:none;" data-target="#addSellerModal" data-toggle="modal">addSeller</a>	
			 	  <jsp:include page="/ticket/addSeller.jsp" />	
			 	  <script>
					 	 $(function(){
					 		
						 	if(${user.role=='0'}){
								alert("첫 판매는 판매자등록 후 진행합니다.")
								$('#addSellerModal').modal('show');
							}	
							
					 	});
			 	  </script>
			  </div>		  
			</form>
			</div>
			</div>	
			<div class="col-2">
			</div>
		</div>					<script>
					$(function(){
						$("a:contains('쿠폰적용')").on("click",function(){
							$.ajax({
								url : "/coupon/rest/getCouponList/${user.userId}/" ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
					          	success: function(data){
					          		var displayValue = "";	
					          		if(data.list==""){
					          			alert("쿠폰이 없습니다.");
					          			return;
					          		}else{
					          			$(".addCoupon").html("");
					          			displayValue += "<div>"
					          			if(data.listA.length != 0){
					          				displayValue += "<a id='"+data.listA[0].couponNo+"' class='btn btn-outline-info useCouponA'>상단출력    <span class='badge badge-light'>"+data.listA.length+"</span></a>&nbsp;";
					          			}
					          		    if(data.listB.length != 0){
					          				displayValue += "<a id='"+data.listB[0].couponNo+"' class='btn btn-outline-info useCouponB'>강조권   <span class='badge badge-light'>"+data.listB.length+"</span></a>";
					          			}
					          		 	displayValue += "</div>"
					          		}
								    $(".addCoupon").append(displayValue);
								    $(".useCouponA").on("click",function(){
								    	var couponNo = $(this).attr("id").trim();
								    	$("input[name='couponNo']").val(couponNo);
								    	$("input[name='couponCode']").val("0");
								    	alert("상단출력 쿠폰적용");
								    	$(".addCoupon").html("<p><strong> 적용 쿠폰 :</strong> 상단출력  </p>");
								    });
								    $(".useCouponB").on("click",function(){
								    	var couponNo = $(this).attr("id").trim();	
								    	$("input[name='couponNo']").val(couponNo);
								    	$("input[name='couponCode']").val("1");
								    	alert("강조권 쿠폰적용");
								    	$(".addCoupon").html("<p><strong> 적용 쿠폰 :</strong> 강조권 </p>");
								    });
					          	}
							});
						});
					});
					
					</script>
					
	<jsp:include page="/layout/footer.jsp" />
</body>

</html>