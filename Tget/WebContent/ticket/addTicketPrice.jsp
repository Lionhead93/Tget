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
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="/resources/javascript/common.js" ></script>
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
            background-color : whitesmoke;
        }
    
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">	
		
		
	function fncAddTicketPrice(){
		//Form 유효성 검증
	 	var price = $("input[name='price']").val();
	 	var result = numberWithOutCommas(price);
	 	
		if(result == null || result.length<4){
			alert("가격은 1,000원 이상으로 반드시 입력하여야 합니다.");
			return;
		}
		if(isNaN(result)==true) {
			alert("가격에 숫자입력 바랍니다. 입력 값 :"+result);
			return;
		}
		
		$("input[name='price']").val(result);
		$("form").attr("method" , "POST").attr("action" , "/ticket/addTicketPrice").submit();
	}		
	
	
	$(function(){
	    
		var lowPrice = numberWithCommas(${sellProb.lowPrice});
		$("#lowPrice").html(""+lowPrice);
		
		var highPrice = numberWithCommas(${sellProb.highPrice});
		$("#highPrice").html(""+highPrice);
		
		var avgPrice = numberWithCommas(${sellProb.avgPrice});
		$("#avgPrice").html(""+avgPrice);
		
	    $("button").on("click",function(){
	    	
	    	fncAddTicketPrice();
	    	
	    });
		
		$("a[href='#']:contains('취&nbsp;소')").on("click",function(){
	    	
	    	self.location = "/";
	    	
	    });
	    
	    $("input[name='price']").on("keyup", function(){
	    	
	    	var price = numberWithOutCommas($(this).val());
	    	
	    	if(price.length>9){
	    		$(this).val("999,999,999");
	    		return;
	    	}
	    	
	    	if(price == "" || isNaN(price)==true || price.length<4){
	    		$("#sellProb").html("");
	    		return;
	    	}else{
	    		var num = numberWithCommas(price);
	    		$(this).val(num);
	    	}	    	
	    	$.ajax(
					{
						url : "/ticket/rest/getTicketSellProb/"+price+"/${ticket.event.eventId}" ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(data) {	
							var sellProb = data.sellprob;
							if(sellProb == 0){
								$("#sellProb").html("추천가격 : 적당한 가격입니다. 해당 가격의 티켓은 판매 확률이 더 높습니다.").css("color" , "blue");
							}else if(sellProb == 1){
								$("#sellProb").html("평균가격 : 해당 가격의 티켓은 판매 확률이 낮습니다.").css("color" , "green");
							}else if(sellProb == 2){
								$("#sellProb").html("높은가격 : 해당 가격의 티켓은 판매 확률이 매우 낮습니다.").css("color" , "orange");
							}else{
								$("#sellProb").html("최고가격 : 주의하세요! 해당 가격의 티켓은 판매 확률이 희박합니다.").css("color" , "red");
							}
						}							 
			});
	    	
	    });
	    
	});
	</script>		
    
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
	<br/>
		<h1 class="text-center">판매가격 결정  ${ticket.event.eventName}</h1>
				
		<form>
		<div class="text-center">				  
		<br/>
		  <div class="form-group">
		    <strong>희망 가격 : </strong>
		     <input type="text" id="price" name="price" placeholder="판매가격입력">
		  </div>
		  <div class="form-group">
		  <strong>등록 최저가 : </strong>
		  	<span id="lowPrice"></span>
		  </div>
		  <div class="form-group">		 
		  <strong>등록 최고가 : </strong>
		  	<span id="highPrice"></span>
		  </div>
		  <div class="form-group">
		  <strong>평균 가 : </strong>
		  	<span id="avgPrice"></span>		  
		  </div>
		  <div class="form-group">
		  <strong>판매 확률 : </strong> 
		  	<span id="sellProb"></span>
		  </div>
		<br/>
		   <div class="form-group">
			  <a class="btn btn-danger btn" href="#" role="button">게시된 &nbsp;판매현황 &nbsp;보기</a>
		  </div>
		 <br/>
		  <div class="form-group">
		      <button type="button" class="btn btn-primary"  >결 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		  </div>
		  </div>
		</form>
		
 	</div>
</body>

</html>