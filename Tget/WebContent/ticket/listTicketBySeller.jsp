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
       body > div.container{
        	border: 1px solid #D6CDB7;
            padding-top: 30px;
        }
        .sellerTicketTitle{
        
        }
        .marketing{
        	padding: 10px;
        }
        .myTicket{   
        	margin: 3px;
        	padding-top: 10px;     	
        	border: 2px solid #D6CDB7;        	
        }
    </style>
    
	<script type="text/javascript">
				
		
		
		 $(function() {
			
			 
			 
		 });
			 
			
	</script>
	
</head>

<body>
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<div align="center" class="container">
	
	<div class="sellerTicketTitle">
	
		<span  class="text-center"> <h1><strong>My Ticket</strong></h1> </span>
		<img alt="" src="/resources/images/1523464646.jpeg">
		<br/> 
	 </div>
	    <hr/>
	    
	     <div class="text-info">  
	    	<strong>총  ${sellProb.totalCount} 개</strong>
	  	</div>	
	 <div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div align="center" class="row" id="#">
       <c:forEach var="ticket" items="${list}" varStatus="j" > 
        <div class="col-4">
          <div class="myTicket" id="${ticket.ticketNo}">
	          <img class="img-circle" src="/resources/images/uploadFiles/${ticket.ticketImage}" onerror="this.src='/resources/images/logo.png'"  width="140" height="140">
	          <h2>${ticket.event.eventName}</h2>         
	          <hr class="my-4">
	          <p>좌석 : ${ticket.seat}</p>
	          <p>수량 : ${ticket.amount}</p>
	          <p>가격 : ${ticket.price} 원</p>	          
	          <c:if test="${ticket.code=='0'}">
		          <p class="text-warning">	         
		          	*검증 대기중		          
		          </p>
		          </c:if>
		          <c:if test="${ticket.code=='1'}">
		          <p class="text-success">
		          	*판매중	
		          </p>
		          </c:if>
		          <c:if test="${ticket.code=='2'}">
		          <p class="text-danger">
		          	*등록취소	
		          </p>
		      </c:if> 	    	
	      </div>
        </div><!-- /.col-lg-4 -->
        </c:forEach>
    </div>
    </div>
	  
</div>
<jsp:include page="/layout/footer.jsp" />
</body>

</html>