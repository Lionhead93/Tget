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
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">	
		
	$(function(){
	    
		$("#totalPrice").text(numberWithCommas(${transaction.totalPrice}));
		
	    $("button:contains('완료')").on("click",function(){
	    	
	    	self.location="/";
	    	
	    });
	    
	});
		
	</script>		
    
</head>

<body>
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<div class="container">
	<br/>
		
		<div class="text-center">
		  <h3 class="display-4">구매 해주셔서 감사합니다.</h3>
		  <hr class="my-4">
		  <h5> ${transaction.event.eventName}</h5>
		  <p>배송지 : ${transaction.deliveryAddr}</p>
		  <p>결제 수단 : 
		  <c:if test="${transaction.paymentOption==0}">
		  	신용카드
		  </c:if>
		  <c:if test="${transaction.paymentOption==1}">
		  	카카오페이
		  </c:if>
		  <c:if test="${transaction.paymentOption==2}">
		  	무통장입금
		  </c:if>		  
		  </p>
		  <p>총 금액 : <span id="totalPrice">${transaction.totalPrice}</span></p>
		  <c:if test="${transaction.paymentOption==2}">
		  
		  <p class="text-danger">*아래의 입금계좌로 당일 안에 입금부탁 드립니다.</p> 
		  <small class="text-secondary">은행 : 비트은행<br/>
		  	예금주 : Tget<br/>
		  	계좌번호 : 110-545-120154<br/></small>
		  </c:if>
		  
		  <br/><br/>
		  <button type="button" class="btn btn-outline-primary">완료</button>
		</div>
			
 	</div>
	<jsp:include page="/layout/footer.jsp" />
</body>

</html>