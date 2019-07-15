<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
	   body {
            padding-top : 50px;
        }
    
    </style>
    
	<script type="text/javascript">
				
		
		
		 $(function() {
			
			 
			 
		 });
			 
			
	</script>
	
</head>

<body>
	
	<div class="container">
	
		<h1 class="text-center">내 판매 티켓</h1>
		<br/> 
	    <hr/>
	    총  ${sellProb.totalCount} 개
	
	 <div class="container marketing">

      <!-- Three columns of text below the carousel -->
      <div class="row" id="#">
       <c:forEach var="ticket" items="${list}" varStatus="j" > 
        <div class="col-lg-4">
          <div id="${ticket.ticketNo}">
	          <img class="img-circle" src="/resources/images/uploadFiles/${ticket.ticketImage}" width="140" height="140">
	          <h2>${ticket.event.eventName}</h2>         
	          <p>좌석 : ${ticket.seat}</p>
	          <p>수량 : ${ticket.amount}</p>
	          <p>${ticket.price} 원</p>	          
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
</body>

</html>