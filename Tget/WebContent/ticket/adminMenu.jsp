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
	
	<div class="container">
			
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
						<section id="section-topline-1"><p>1</p></section>
						<section id="section-topline-2">
									
									 <div class="text-center">
								    
								      <div class="row" id="ticketCheckRow">
								      </div>
								    </div>
						</section>
						<section id="section-topline-3"><p>3</p></section>
						<section id="section-topline-4"><p>4</p></section>
					</div><!-- /content -->
				</div><!-- /tabs -->
			</section>
			



	
</div>

<jsp:include page="/layout/footer.jsp" />

<script src="/resources/javascript/cbpFWTabs.js"></script>
<script>
			(function() {

				[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
					new CBPFWTabs( el );
				});

			})();
</script>
<script>

function ticketModalClick(){
	$("a:contains('검증')").on("click", function(){	          			
		var ticketNo= $(this).attr('id').trim();
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
          		history.go(0);          		
          	}
		});
	});
}

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
	          		display += '<div class="col"><br/>';
	          		display += '<img class="img-circle" src="/resources/images/uploadFiles/'+ticket.ticketImage+'" width="200px" >';
	          		display +=	'<h2>'+ticket.event.eventName+'</h2><hr/>';       
	          		display +=  '<read>좌석 : '+ticket.seat+'</read><br/><br/>' ;
	          		display +=  '<read>수량 : '+ticket.amount+'</read><br/>';
	          		display +=   '<read>가격 : '+ticket.price+' 원</read><br/><br/>';	          
	          		display +=    '<read class="text-info">';	         
	          		display +=	'<a class="btn btn-outline-primary" id="'+ticket.ticketNo+'" href="#" >';
	          		display +=   '<i class="fas fa-search"></i>검증</a></read></div>';	         			         
          			
	          		$("#ticketCheckRow").append(display);	          		
          		});           		
          		ticketModalClick();
          	}
		});
	});
	$("a:contains('전체 거래 보기')").on('click', function(){
		
	});
</script>	
</body>

</html>