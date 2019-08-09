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
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
				   
	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
	<script src="/resources/javascript/jquery.min.js"></script>
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
		.img_wrap {
			width: 300px;
			margin: auto;
		}
		.img_wrap img {
			max-width: 100%;
		}	
    
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">	
		
		
	function fncAddTicketPrice(){
		//Form 유효성 검증
	 	var price = $("input[name='price']").val();
	 	var result = numberWithOutCommas(price);
	 	
		if(result == null || result.length<4){
			swal("가격은 1,000원 이상으로 반드시 입력하여야 합니다.","","error");
			return false;
		}
		if(isNaN(result)==true) {
			swal("가격에 숫자입력 바랍니다. 입력 값 :"+result,"","error");
			return false;
		}
		
		$.ajax(
				{
					url : "/ticket/rest/addTicketPrice/"+result ,
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(data) {
						swal("가격등록 성공","","success")
						.then(function(r){
							
						});
					}
				});
		return true;
	}	
	
	
	$(function(){
	    
		var lowPrice = numberWithCommas(${sellProb.lowPrice});
		$("#lowPrice").html(""+lowPrice);
		
		var highPrice = numberWithCommas(${sellProb.highPrice});
		$("#highPrice").html(""+highPrice);
		
		var avgPrice = numberWithCommas(${sellProb.avgPrice});
		$("#avgPrice").html(""+avgPrice);
		
	    $("button:contains('결 정')").on("click",function(){
	    	$(this).attr("data-target","");
	    	if(fncAddTicketPrice()){
	    		$(this).attr("data-target","#addImageModal");
	    	}
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
								$("#sellProb").html('<div class="alert alert-primary" role="alert">적당한 가격입니다. 해당 가격의 티켓은 판매 확률이 더 높습니다.</div>');
							}else if(sellProb == 1){
								$("#sellProb").html("<div class='alert alert-success' role='alert'>해당 가격의 티켓은 판매 확률이 낮습니다.</div>");
							}else if(sellProb == 2){
								$("#sellProb").html("<div class='alert alert-warning' role='alert'>해당 가격의 티켓은 판매 확률이 매우 낮습니다.</div>");
							}else{
								$("#sellProb").html("<div class='alert alert-danger' role='alert'>주의하세요! 해당 가격의 티켓은 판매 확률이 희박합니다.</div>");
							}
						}							 
			});
	    	
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
			   <strong>티켓  <i class="fas fa-ticket-alt"></i> 판매가격 결정</strong>
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
		<br/>
		<h1 class="text-center">${ticket.event.eventName}</h1>
		<hr/>		
		<div class="text-center">				  
		<br/>
			<div class="form-group row">	
			  <div class="col-sm-3"></div>	    
			    <label for="price" class="col-sm-2 col-form-label"><strong>희망 가격 </strong></label>			    
			    <div class="col-sm-3">
			         <input type="text" class="form-control" id="price" name="price" style="width: 200px !important" >
			    </div>
			    <div class="col-sm-4"></div>			    		    
			  </div>
		  <div class="form-group row">	
			  <div class="col-sm-3"></div>	    
			    <label for="price" class="col-sm-2 col-form-label"><strong>등록 최저가 </strong></label>			    
			    <div class="col-sm-3" style="padding-top: 7px;">
			         <strong><span id="lowPrice"></span> 원</strong>
			    </div>
			    <div class="col-sm-4"></div>			    		    
		   </div>
		    <div class="form-group row">	
			  <div class="col-sm-3"></div>	    
			    <label for="price" class="col-sm-2 col-form-label"><strong>등록 최고가 </strong></label>			    
			    <div class="col-sm-3" style="padding-top: 7px;">
			         <strong><span id="highPrice"></span> 원</strong>
			    </div>
			    <div class="col-sm-4"></div>			    		    
		   </div>
		   <div class="form-group row">	
			  <div class="col-sm-3"></div>	    
			    <label for="price" class="col-sm-2 col-form-label"><strong>평균 가 </strong></label>			    
			    <div class="col-sm-3" style="padding-top: 7px;">
			         <strong><span id="avgPrice"></span> 원</strong>
			    </div>
			    <div class="col-sm-4"></div>			    		    
		   </div>
		  <div class="form-group row">
		  <div class="col-sm-2"></div>
		   <div class="col-sm-8">
		  	<span id="sellProb"></span>
		  </div>
		  <div class="col-sm-2"></div>
		  </div>
		<br/>
		   <div class="form-group">   
			  <a class="btn btn-outline-danger btn" href="#" id="${ticket.event.eventId}" name="sellModal" role="button" data-target="#sellModal" data-toggle="modal">게시된 &nbsp;판매현황 &nbsp;보기</a>
		   
		  </div>
		 <br/>
		  <div class="form-group">
		      <button type="button" class="btn btn-outline-dark" data-toggle="modal" >결 정</button>
			  <a class="btn btn-outline-dark btn" href="#" role="button">취&nbsp;소</a>
		  </div>
		  </div>
		</div>
		</div>		
		<div class="col-lg-2">
		</div>
	</div>
	<!-- 이미지등록 모달창  -->
					<div class="modal fade" id="addImageModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
					    <div class="modal-content">
					      
					      <div class="modal-body">
					      <div class="text-center">
					      		<h3>실물 이미지 등록</h3>
								<br/>	
								<div class="img_wrap">
								<img id="preview" />	
								</div>
								<form>				  
								<br/>
								       <input type="file" id="file" name="file" value="" placeholder="file input...">
								  
								  </div>
								<br/>
									<div class="text-center">
								      <button type="button" class="btn btn-outline-primary">요 청</button>
									</div>							   
								</form>
						  </div>		
					      </div>
					      <div class="modal-footer">
					        </div>
					    </div>
					  </div>
					</div>
					
					<script>		
						function fncAddTicketImage(){
							//Form 유효성 검증
						 	var file = $("input[name='file']").val();							
							if(file == null || file.length<1){
								swal("이미지등록 바람","","error");
								
								return;
							}
							swal("이미지등록 성공","","success")
							.then(function(r){
								$("form").attr("method" , "POST").attr("action" , "/ticket/addTicketImage").attr("enctype" , "multipart/form-data").submit();
							});
							
						}						
						$(function(){
						    
						    $("button:contains('요 청')").on("click",function(){						    	
						    	fncAddTicketImage();	    	
						    });						    
						    $("#file").change(function(){
						    	readURL(this);
						    });					    
						});
					</script>
	
 	<!-- 판매현황 모달창  -->
					<div class="modal fade" id="sellModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
					    <div class="modal-content">
					      
					      <div class="modal-body">
					      	<canvas id="myChart"></canvas>
					      </div>
					      <div class="modal-footer">
					        </div>
					    </div>
					  </div>
					</div>
					<script >
					
						$("a[name='sellModal']").on("click", function(){
							
							var eventId = $(this).attr("id").trim();
							
							$.ajax({
								url : "/ticket/rest/getSellList/"+eventId ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
					          	success: function(JSONdata){
					          		
					          		var ctx = document.getElementById('myChart').getContext('2d');
									
									var chart = new Chart(ctx, {
									    // The type of chart we want to create
									    type: 'line',
								
									    // The data for our dataset
									    data: {
									        labels: ['5만원 이하', '5만원~10만원', '10만원~20만원', '20만원~30만원', '30만원~40만원', '40만원이상'],									        
									        datasets: [{
									            label: '판매 현황',
									            borderColor: '#1E90FF',									            
									            data: [JSONdata.a, JSONdata.b, JSONdata.c, JSONdata.d, JSONdata.e, JSONdata.f]
									        }]
									    },					
									    options: {
									    	fontColor: 'white'
									    }
									});					          		
					          	}
							});
							
						});
											
						
					</script>	
 	<jsp:include page="/layout/footer.jsp" />
</body>

</html>