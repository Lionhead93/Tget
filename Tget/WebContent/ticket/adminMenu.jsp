<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Tab Styles Inspiration: A small collection of styles for tabs" />
	<meta name="keywords" content="tabs, inspiration, web design, css, modern, effects, svg" />
	<meta name="author" content="Codrops" />
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />	
	<link rel="shortcut icon" href="../favicon.ico">
	<link rel="stylesheet" type="text/css" href="/resources/css/tabs.css" />
	<link rel="stylesheet" type="text/css" href="/resources/css/tabstyles.css" />
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
	
	<style>
		body{	
		      color: #FBFCFE ;		  
			  background-color: #062038;
			  margin-top: 50px;				
			  font-family: 'Nanum Gothic', sans-serif;
		}
		a, hr{
			color: #FBFCFE ;	
		}
		.col-lg-3{			
			margin-bottom: 20px;
		}
		
		.border{
			background-color: #193147;
		}
		section{
			margin-left: 100px;
		}
		#inputGroupSelect01, nav{
			background: rgba(4, 22, 37, 0.75);
			color: #c0c5c9;
		} 
		#tgetHeader{
		   color: #FBFCFE;	
	       padding-top: 30px;
	       padding-bottom: 30px;
	       margin-bottom: 30px;
	       		background: url(/resources/images/pic05.jpg) no-repeat center center fixed; 
				  -webkit-background-size: cover;
				  -moz-background-size: cover;
				  -o-background-size: cover;
				  background-size: cover;	
       } 
       #cyberWidget{
       		background-color: white;
       }       
		#footer{
			background-color: #1B1B1F;
		}
    </style>
    
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
    <script src="/resources/javascript/modernizr.custom.js"></script>
    
	<script type="text/javascript">
							
	</script>
	
</head>

<body>
	<jsp:include page="/layout/tgetToolbar.jsp" />
	
	<div id="tgetHeader" class="text-center">
		  <br/><br/>
		  <h3><strong>티켓 관리</strong></h3>
		  <br/><br/>
	</div>
	
		<div class="row">
		<div class="col-9">	
			<section>
				<div class="tabs tabs-style-topline">
					<nav>
						<ul>
							<li><a href="#section-topline-1"><h6><strong>전체 거래 보기</strong></h6></a></li>
							<li><a href="#section-topline-2"><h6><strong>티켓 Check</strong></h6></a></li>
							<li><a href="#section-topline-3"><h6><strong>무통장 입금 확인</strong></h6></a></li>
							<li><a href="#section-topline-4"><h6><strong>판매자 입금</strong></h6></a></li>
						</ul>
					</nav>
					<div class="content-wrap">
						<section id="section-topline-1">
						  <div class="input-group-prepend">
						  <label class="input-group-text" for="inputGroupSelect01">검색</label>						  
						  <select class="custom-select" id="inputGroupSelect01" style="width :150px;">
						    <option selected>All</option>
						    <option value="0">입금 대기</option>
						    <option value="1">배송 대기</option>
						    <option value="2">배송 중</option>
						    <option value="3">배송 완료</option>
						    <option value="4">환불 및 취소</option>
						  </select>
						  </div>
						<hr/>
							 <div class="row">
								 <c:forEach var="tran" items="${list}" varStatus="j">
								 	<div name="${tran.tranCode}" class="col-lg-3">
								 	<div class="text-center">
								 		<div class="border">
								 		<br/>
								 			<h5><strong>${tran.event.koName}</strong></h5>
								 			<hr/>
								 			<div><small>${tran.orderDate}</small></div>
								 			<div><small>${tran.seller.userId} <i class="far fa-handshake"></i> ${tran.buyer.userId}</small></div>
								 			<c:if test="${tran.tranCode=='0'}">
								 				<div class="progress">
												  <div class="progress-bar progress-bar-striped bg-danger progress-bar-animated" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
								 				<div class="text-danger"><small>*무통장입금 대기중</small></div>
								 			</c:if>
								 			<c:if test="${tran.tranCode=='1'}">
									 			<div class="progress">
													<div class="progress-bar progress-bar-striped bg-warning progress-bar-animated" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
								 				<div class="text-warning"><small>*결제완료 (배송대기)</small></div>
								 			</c:if>
								 			<c:if test="${tran.tranCode=='2'}">
								 				<div class="progress">
													<div class="progress-bar progress-bar-striped bg-info progress-bar-animated" role="progressbar" style="width: 75%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
								 				<div class="text-info"><small>*배송중</small></div>
								 			</c:if>
								 			<c:if test="${tran.tranCode=='3'}">
								 				<div class="progress">
													<div class="progress-bar progress-bar-striped bg-success progress-bar-animated" role="progressbar" style="width: 100%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
								 				<div class="text-success"><small>*배송완료</small></div>
								 			</c:if>
								 			<c:if test="${tran.tranCode=='4'}">
								 				<div class="text-secondary"><small>*환불 및 취소</small></div>
								 			</c:if>
								 			
								 			<div><small></small></div>
								 			<div><small></small></div>
								 			<br/>
								 		</div>
								 	</div>	
								 	</div>
								 </c:forEach>
							 </div>
						</section>
						<section id="section-topline-2">
									
									 <div class="text-center">
								    
								      <div class="row" id="ticketCheckRow">
								      </div>
								    </div>
						</section>
						<section id="section-topline-3">
							<div class="row">
								 <c:forEach var="tran" items="${list}" varStatus="j">
								 <c:if test="${tran.tranCode=='0'}">
								 	<div class="col-lg-3">
								 	<div class="text-center">
								 		<div class="border">
								 		<br/>
								 			<h5><strong>${tran.event.eventName}</strong></h5>
								 			<hr/>
								 			<div><small>${tran.orderDate}</small></div>
								 			<div><small><i class="far fa-user"></i> ${tran.buyer.userId}</small></div>
								 			<div><small>이름 : ${tran.buyer.userName}</small></div>
								 			<div><small>금액 : ${tran.totalPrice}</small></div>
								 			<br/>
								 			<div><button type="button" name="depositCheck" id="${tran.tranNo}" class="btn btn-outline-success"><i class='fas fa-check'></i></button>
								 			  &nbsp;<button type="button" name="tranDelete" id="${tran.tranNo}" class="btn btn-outline-danger"><i class='fas fa-trash-alt'></i></button></div>
								 			<br/>
								 		</div>
								 	</div>	
								 	</div>
								 </c:if>	
								 </c:forEach>
							 </div>
						</section>
						<section id="section-topline-4">
							<div class="row">
								 <c:forEach var="tran" items="${list}" varStatus="j">
								 <c:if test="${tran.tranCode=='3'}">
								 	<div class="col-lg-3">
								 	<div class="text-center">
								 		<div class="border">
								 		<br/>
								 			<h5><strong>${tran.event.eventName}</strong></h5>
								 			<hr/>
								 			<div><small>${tran.orderDate}</small></div>
								 			<div><small><i class="far fa-user"></i> ${tran.seller.userId}</small></div>
								 			<div><small>이름 : ${tran.seller.userName}</small></div>
								 			<div><small>예금은행 : ${tran.seller.accountBank}</small></div>
								 			<div><small>예금계좌 : ${tran.seller.accountNo}</small></div>
								 			<div><small>금액 : ${tran.totalPrice}</small></div>
								 			<br/>
								 			<div><button type="button" name="depositSeller" id="${seller.sellerId}" class="btn btn-outline-success"><i class="fas fa-money-check-alt"></i></button></div>
								 			<br/>
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
			<div class="col-3">
			<div class="sticky-top">
			<br/><br/><br/><br/><br/><br/>
				<iframe id="cyberWidget" class="embed-responsive-item" height="180px" width="170px" src="https://www.cyber.go.kr/widget.html" allowfullscreen></iframe>				
			
				<div id="appendSeller">
						    
				</div>			
			</div>	
			</div>
			
		</div>	



<jsp:include page="/layout/footer.jsp" />

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

function ticketModalClick(){
	$("a[name='check']").on("click", function(){	          			
		var ticketNo= $(this).attr('id').trim();
		var content = $(this).closest('.col-lg-3');
		$.ajax({
			url : "/ticket/rest/checkTicket/"+ticketNo ,
			method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
          	success: function(data){
          		
          		alert(data.message);
          		content.remove();         		
          	}
		});
	});
}
function getSellerInfo(){
	$("a[name='sellerInfo']").on("click",function(){
		var sellerId = $(this).text().trim();
		$.ajax({
			url : "/user/json/getUser/"+sellerId ,
			method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
          	success: function(data){
          		var display = "";
          		display += "<div class='text-secondary'><p>[ID] : <small>"+data.userId+"</small></p>";
          		display += "<p>[전화번호] : <small>"+data.phone+"</small></p>";
          		display += "<p>[계좌번호] : <small>"+data.accountNo+"</small></p></div>";
          		
          		$("#appendSeller").html(display);
          	}
		});
	});
	
}

	$("button[name='depositCheck']").on("click", function(){
		var tranNo= $(this).attr("id").trim();
		var content= $(this).closest(".col-lg-3");		
		
		$.ajax({
			url : "/tran/rest/checkDeposit/"+tranNo ,
			method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
          	success: function(data){
          		alert(data.message);
          		history.go(0);
          	}
		});		
	});
	
	$("button[name='tranDelete']").on("click", function(){
		
		var tranNo= $(this).attr("id").trim();
		var content= $(this).closest(".col-lg-3");		
		
		$.ajax({
			url : "/tran/rest/deleteTran/"+tranNo ,
			method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
          	success: function(data){
          		alert(data.message);
          		content.remove();
          	}
		});	
		
	});
	
	$("a:contains('티켓 Check')").on('click', function(){
		$.ajax({
			url : "/ticket/rest/getTicketList/2/0" ,
			method : "GET" ,
			dataType : "json" ,
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},
          	success: function(data){
          		$("#ticketCheckRow").html("");
          		$.each(data.list, function( index, ticket){
          			var display = "";	
	          		display += '<div class="col-lg-3"><br/>';
	          		display += '<div class="border">';
	          		display += '<img class="img-circle" src="/resources/images/uploadFiles/'+ticket.ticketImage+'" width="200px" >';
	          		display +=	'<h2>'+ticket.event.eventName+'</h2><hr/>';       
	          		display +=  '<read>좌석 : '+ticket.seat+'</read><br/>' ;
	          		display +=  '<read>수량 : '+ticket.amount+'</read><br/>';
	          		display +=   '<read>가격 : '+ticket.price+' 원</read><br/>';	
	          		display +=   '<a href="#" name="sellerInfo"><i class="fas fa-portrait"></i> '+ticket.seller.userId+'</a><br/><br/>';
	          		display +=	'<a class="btn btn-outline-primary" name="check" id="'+ticket.ticketNo+'" href="#" >';
	          		display +=   '<i class="fas fa-search"></i></a>&nbsp;';	         			         
	          		display +=	'<a class="btn btn-outline-danger" name="delete" id="'+ticket.ticketNo+'" href="#" >';
	          		display +=   '<i class="fas fa-trash-alt"></i></a><br/><br/></read></div></div>';	         			         
          			
	          		$("#ticketCheckRow").append(display);	          		
          		});           		
          		ticketModalClick();
          		getSellerInfo();
          	}
		});
	});
	$("#inputGroupSelect01").on('change', function(){
		var tranCode = $(this).val();
		if(tranCode=="All"){
			$(".col-lg-3").attr("style","");
			return;
		}
		if(tranCode=="0"){
			$(".col-lg-3").attr("style","");
			$("div[name='1']").attr("style","display: none;");
			$("div[name='2']").attr("style","display: none;");
			$("div[name='3']").attr("style","display: none;");
			$("div[name='4']").attr("style","display: none;");
			return;
		}
		if(tranCode=="1"){
			$(".col-lg-3").attr("style","");
			$("div[name='0']").attr("style","display: none;");
			$("div[name='2']").attr("style","display: none;");
			$("div[name='3']").attr("style","display: none;");
			$("div[name='4']").attr("style","display: none;");
			return;
		}
		if(tranCode=="2"){
			$(".col-lg-3").attr("style","");
			$("div[name='0']").attr("style","display: none;");
			$("div[name='1']").attr("style","display: none;");
			$("div[name='3']").attr("style","display: none;");
			$("div[name='4']").attr("style","display: none;");
			return;
		}
		if(tranCode=="3"){
			$(".col-lg-3").attr("style","");
			$("div[name='0']").attr("style","display: none;");
			$("div[name='1']").attr("style","display: none;");
			$("div[name='2']").attr("style","display: none;");
			$("div[name='4']").attr("style","display: none;");
			return;
		}
		if(tranCode=="4"){
			$(".col-lg-3").attr("style","");
			$("div[name='0']").attr("style","display: none;");
			$("div[name='1']").attr("style","display: none;");
			$("div[name='2']").attr("style","display: none;");
			$("div[name='3']").attr("style","display: none;");
			return;
		}
		
	});
	
	IMP.init('imp22741487');
	
	$("button[name='depositSeller']").on("click",function(){
		
		var content = $(this).closest(".col-lg-3");	
		
		IMP.request_pay({
		    pay_method : 'trans',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '판매자',
		    amount : 150,
		    buyer_email : 'lionhead115@naver.com',
		    buyer_name : '남성우',
		    buyer_tel : '01073079076',
		    buyer_addr : '서울시 위례동',
		    buyer_postcode : '150-582'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '입금이 완료되었습니다.';			        
		        var tmp = 0;
		    } else {
		        var msg = '입금에 실패하였습니다.';			        
		        msg += '에러내용 : ' + rsp.error_msg;
		        var tmp = 1;
		    }		
		    alert(msg);
		    if(tmp==0){
		    	$.ajax({
					url : "/tran/rest/depositSeller/"+tranNo ,
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
		          	success: function(data){
		          		alert(data.message);
		          		history.go(0);
		          	}
				});			    	
		    }
		});
		
	
    });
</script>	
</body>

</html>