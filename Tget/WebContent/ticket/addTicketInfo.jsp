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
			swal("수량은 반드시 입력하여야 합니다.","","error");
			return;
		}
		if(amount.length>2){
			swal("수량은 최대 99장까지 밖에 등록할 수 없습니다.","","error");
			return;
		}
		if(isNaN(amount)==true || amount < 1) {
			swal("수량에 1이상 숫자입력 바랍니다.","","error");
			
			return;
		}
		if(type == null || type.length<1){
			swal("형태는 반드시 입력하여야 합니다.","","error");
			return;
		}
		if(seat == null || seat.length<1){
			swal("좌석 반드시 입력하셔야 합니다.","","error");
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
		<div class="col-lg-3">
      	<div class="sticky-top">
		<br/><br/><br/><br/>
			<div class="card text-center shadow-lg rounded" style="width: 15rem; color: #041625; margin-left: 100px;">
			  <div class="card-header">
			   <strong>티켓  <i class="fas fa-ticket-alt"></i> 티켓 판매</strong>
			  </div>
			  <ul class="list-group list-group-flush">								
				<li class="list-group-item"><a href="#" data-target="#sellerGuideModal" data-toggle="modal">판매자 가이드</a></li>
				<li class="list-group-item"><a href="#">판매목록 조회</a></li>
				<li class="list-group-item"><a href="#">거래내역 조회</a></li>
			  </ul>		  
			</div>
		
		  </div>   	
     	 </div>
			
			<div id="ticketInput" class="col-lg-7">
			<div class="text-center">
			<div class="card text-center shadow rounded" style="width: 800px; ">
			<form class="form-horizontal">
			<input type="hidden" name="event.eventId" value="${event.eventId}" >
			<input type="hidden" name="event.eventName" value="${event.eventName}" >
			<input type="hidden" name="seller.userId" value="${user.userId}" >	
			<input type="hidden" name="couponNo" value="0" >	
			<input type="hidden" name="couponCode" value="" >	  
			<br/>
			<h1 class="display-4">${event.eventName}</h1>
			  <p class="lead">${event.eventLocation}</p>
			  <p>${event.eventDate}</p>
			<hr class="my-4">
			  <div class="form-group row">	
			  <div class="col-sm-3"></div>	    
			    <label for="amount" class="col-sm-1 col-form-label"><strong>수량 </strong></label>			    
			    <div class="col-sm-4">
			         <input type="text" class="form-control" id="amount" name="amount" style="width: 90px !important" >
			    </div>
			    <div class="col-sm-4"></div>
			    		    
			  </div>
			  <div class="row">
				  <div class="col-sm-3"></div>
				  <div class="col-sm-5">	 
				  <small class="text-danger">*연석 일 경우만 한번에 등록</small>
				  </div>
				  <div class="col-sm-4"></div>	 
			  </div>				  
			<br/>
			  <br/> 
			  <div class="form-group row">
			   <div class="col-sm-3"></div>	    	
			   <label for="type" class="col-sm-1 col-form-label"> <strong>형태 </strong></label>
			    <div class="col-sm-4 text-left" style="padding-top: 8px;">			   
			      <input type="radio" name="type" value="0" checked="checked" /> 종이티켓
				  <input type="radio" name="type" value="1" /> 전자티켓
				</div> 
				<div class="col-sm-4"></div> 
			  </div>
			<br/>  
			  <div class="form-group row" >
			  <div class="col-sm-3"></div>	
			   <label for="seat" class="col-sm-1 col-form-label"> <strong>좌석 </strong></label>
			   <div class="col-sm-8 text-left" style="padding-top: 8px;">
			    <input type="text" class="rounded-pill text-center" id="seat" name="seat" style="width: 70px !important" maxlength="10" placeholder="예) B2">  구역 		  
			     &nbsp;&nbsp;&nbsp;<input type="text" class="rounded-pill text-center" id="seat" name="seat" style="width: 70px !important" maxlength="10" placeholder="예) 6"> 열			    
			   </div>
			  </div>	
			<br/>
			<strong>특이사항</strong> 
			  <div class="form-group" style="margin-top: 10px;">
			      <textarea name="options" cols="30" rows="5" ></textarea>
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
			    
			      <button type="button" class="btn btn-outline-dark">계 속</button>
				  <a class="btn btn-outline-dark btn" href="#" role="button">취 소</a>
			      <a href="#" role="button" id="addSellerShow" style="display:none;" data-target="#addSellerModal" data-toggle="modal">addSeller</a>	
			 	  <jsp:include page="/ticket/addSeller.jsp" />	
			 	  <script>
					 	 $(function(){
					 		
						 	if(${user.role=='0'}){
								swal("첫 판매는 판매자등록 후 진행합니다.","","info")
								.then(function(r){
									$('#addSellerModal').modal('show');	
								});								
							}	
							
					 	});
			 	  </script>
			  </div>		  
			</form>
			</div>
			</div>
			</div>	
			<div class="col-2">
			</div>
			</div>
		<script>
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
					          			swal("보유 쿠폰이 없습니다.","","warning");
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
								    	swal("상단출력 쿠폰적용","","success");
								    	$(".addCoupon").html("<p><strong> 적용 쿠폰 :</strong> 상단출력  </p>");
								    });
								    $(".useCouponB").on("click",function(){
								    	var couponNo = $(this).attr("id").trim();	
								    	$("input[name='couponNo']").val(couponNo);
								    	$("input[name='couponCode']").val("1");
								    	swal("강조권 쿠폰적용","","success");
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