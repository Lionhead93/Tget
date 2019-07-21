<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="/resources/javascript/common.js" ></script>
   
	
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    
    </style>
    
	<script type="text/javascript">
				
		
		
		 $(function() {
			
			 
			 
		 });
			 
			
	</script>
	
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
	
		<h1 class="text-center">검증 티켓 목록</h1>
		<br/> 
	    <hr/>
	    총  ${sellProb.totalCount} 개
	
	 <div class="text-center">
    
      <div class="row" id="#">
       <c:forEach var="ticket" items="${list}" varStatus="j" > 
	       <div class="col-md">
	       <div class="card" style="width: 18rem;">
			  <img src="/resources/images/uploadFiles/${ticket.ticketImage}" class="card-img-top">
			  <div class="card-body">
			    <h2>${ticket.event.eventName}</h2>         
		          <p>좌석 : ${ticket.seat}</p>
		          <p>수량 : ${ticket.amount}</p>
		          <p>${ticket.price} 원</p>	          
		        
			          <p class="text-info">	         
			          	<a class="btn btn-outline-primary" id="${ticket.ticketNo}" href="#" data-toggle="modal" data-target="#checkModal">
				      <i class="fas fa-search"></i>검증</a>		          
			          </p>
			  </div>
			</div>
	       </div>	       
        </c:forEach>
        </div>
    </div>


<!-- Modal -->
			<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-lg" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="modalCenterTitle">티켓 검증</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					      <div class="text-center">
					      </div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					      </div>
					    </div>
					  </div>
			 </div>	  
</div>
</body>

</html>