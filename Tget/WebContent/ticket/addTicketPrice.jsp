<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="/resources/javascript/common.js" ></script>
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
            background-color : whitesmoke;
        }
	   body {
            padding-top : 50px;
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
		
	    $("a[href='#']").on("click",function(){
	    	
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
						url : "/ticket/rest/getTicketSellProb/"+price+"/${sellticketInfo.event.eventId}" ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(data) {							
							var sellProb = data.sellProb.sellprob;
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
	
	<div class="container">
	<br/>
		<h1 class="text-center">판매가격 결정  ${sellticketInfo.event.eventName}</h1>
				
		<form class="form-horizontal">				  
		<br/>
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">희망 가격</label>
		    <div class="col-sm-4">
		     <input type="text" class="form-control" id="price" name="price" placeholder="판매가격입력">
		    </div>
		  </div>
		  <div class="form-group">
		  <label for="lowPrice" class="col-sm-offset-1 col-sm-3 control-label">등록 최저가</label>
		  <div class="col-sm-4">
		  	<span id="lowPrice"></span>
		  </div>
		  </div>
		  <div class="form-group">
		  <label for="highPrice" class="col-sm-offset-1 col-sm-3 control-label">등록 최고가</label>
		  <div class="col-sm-4">
		  	<span id="highPrice"></span>
		  </div>
		  </div>
		  <div class="form-group">
		  <label for="avgPrice" class="col-sm-offset-1 col-sm-3 control-label">평균 가</label>
		  <div class="col-sm-4">
		  	<span id="avgPrice"></span>
		  </div>
		  </div>
		  <div class="form-group">
		  <label for="sellProb" class="col-sm-offset-1 col-sm-3 control-label">판매 확률</label>
		  <div class="col-sm-4">
		  	<span id="sellProb"></span>
		  </div>
		  </div>		  		
		<br/>
		   <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
			  <a class="btn btn-danger btn" href="#" role="button">게시된 &nbsp;판매현황 &nbsp;보기</a>
		    </div>
		  </div>
		 <br/>
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >결 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		
 	</div>
</body>

</html>