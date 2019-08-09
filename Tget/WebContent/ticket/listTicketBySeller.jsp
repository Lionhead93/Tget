<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<title>T-GET</title>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
		
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
		body {
			  background-color: #EBF7FF;
			  font-family: 'Nanum Gothic', sans-serif;
		}
		a{
			color: #041625;
		}
		.overImage{
			position: absolute;
			text-align: center;
			top: 30px;
			left: 80px;
			width: 250px;
		}
		.getEvent:hover{
			font-size: 25px;
			cursor: pointer;
		}
    </style>
    
	<script type="text/javascript">
				
		
		
		 $(function() {
				
			 $("a.getEvent").on("click", function(){
			    	var eventId = $(this).closest("div").attr("id").trim();
			    	
			    	self.location = "/event/getEventTicketList?eventIds="+eventId;	    	
			    });
			 
			 
		 });
			 
			
	</script>
	
</head>

<body>
	<jsp:include page="/layout/tgetToolbar.jsp" />	
	<jsp:include page="/layout/tgetHeader.jsp" />

	<div class="container">	    
<div class="row">	  		
      <!-- Three columns of text below the carousel -->
      <div class="col-lg-3">
      <div class="sticky-top">
      <br/><br/><br/><br/>
      	<div class="card text-center shadow-lg rounded" style="width: 15rem; color: #041625;">
			  <div class="card-header">
			   <strong>${user.nickName} <i class="far fa-user"></i> My Ticket </strong>
			  </div>
			  <ul class="list-group list-group-flush">								
				<li class="list-group-item"><a href="#">거래내역 조회</a></li>
				<li class="list-group-item"><a href="#">자유게시판<i class="fas fa-check"></i> 삽니다</a></li>
				<li class="list-group-item"><a href="#">티켓판매 공지</a></li>
			  </ul>		  
		</div>
		</div>    	
      </div>
      
      <div class="col-lg-9">      
      	<div class="text-center">
      		<strong>총  ${sellProb.totalCount} 건</strong>	<br/><br/>	 		 
		</div>
		<div class="row">
		<c:forEach var="ticket" items="${list}" varStatus="j">
		<c:if test="${ticket.amount != 0}">
			<div class="col-sm-6" style="margin-bottom: 20px;">			
			  <div class="myTicket" id="${ticket.ticketNo}">
				<div class="card text-center shadow rounded">
				  
				  <img src="/resources/images/uploadFiles/${ticket.ticketImage}" class="card-img-top" onerror="this.src='/resources/images/logo.png'" height="200px;">
				  <c:if test="${ticket.code != '0'}">
				  <img class="overImage" src="/resources/images/approved.png">
				  </c:if>
				  						
			      <div class="card-body" id="${ticket.event.eventId}">
			        <h5 class="card-title">				       
				   		  <strong><a class="getEvent">${ticket.event.eventName}</a></strong>
				     </h5>
			        <p class="card-text">
			        </p>
			        <p><strong>좌석 <i class="fas fa-check"></i> ${ticket.seat}</strong></p>
			        <p><strong>수량 <i class="fas fa-check"></i> ${ticket.amount}</strong> </p>
			        <p><strong>가격 <i class="fas fa-check"></i> ${ticket.price}원</strong> </p>
			      </div>
			        
			     </div>	      
			   </div>			    
		    </div>
		  </c:if>  
		 </c:forEach>
		 </div>     
    </div>
</div>	
</div>  
<jsp:include page="/layout/footer.jsp" />
</body>

</html>