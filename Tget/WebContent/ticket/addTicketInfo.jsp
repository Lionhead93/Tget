<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
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
    
	
   
	<style>
		
		body > div.container{
        	border: 1px solid #D6CDB7;
        	background-color: whitesmoke;
        }
        
       #eventHeader{
       padding-top: 30px;
       padding-bottom: 30px;
       		background: url(/resources/images/pic10.jpg) no-repeat center center fixed; 
			  -webkit-background-size: cover;
			  -moz-background-size: cover;
			  -o-background-size: cover;
			  background-size: cover;	
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
		
		if(${user.role=='0'}){
			alert("첫 판매는 판매자 등록이 필요합니다.");
			 var popOption = "left=500, top=100, width=600, height=600, resizable=no, location=no;"	                    
             window.open("/ticket/addSeller","T-get 판매자등록 ",popOption);
		}
		
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
	<div class="container">
	<br/>
		<form class="form-horizontal">
		<input type="hidden" name="event.eventId" value="${event.eventId}" >
		<input type="hidden" name="event.eventName" value="${event.eventName}" >
		<input type="hidden" name="seller.userId" value="${user.userId}" >
		
		<br/>
		<div id="eventHeader" class="text-center">
		  <h1 class="display-4">${event.koName}</h1>
		  <p class="lead">${event.eventLocation}</p>
		  <p>${event.eventDate}</p>
		</div>
		<hr class="my-4">
		<div class="text-center">
		  
		<br/>
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
		    <a class="btn btn-outline-info" role="button">쿠폰적용 하기</a>
		  </div>
		<br/>			  
		  <div class="form-group">
		    
		      <button type="button" class="btn btn-primary">계 속</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 소</a>
		    
		  </div>
		</div>  
		</form>
			<button type="button" style="display: none;" class="btn btn-primary" data-toggle="modal" data-target="#addSeller"></button>	
 	</div>
	
	<!-- 판매자 등록 모달 -->
 				<div class="modal fade" id="addSeller" role="dialog">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="modalCenterTitle">판매자 등록</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body"> 	      
					      </div>
					    </div>
					  </div>
					</div>
	<jsp:include page="/layout/footer.jsp" />
</body>

</html>