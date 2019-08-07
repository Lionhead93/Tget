<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    	<meta name="description" content="Tab Styles Inspiration: A small collection of styles for tabs" />
		<meta name="keywords" content="tabs, inspiration, web design, css, modern, effects, svg" />
		<meta name="author" content="Codrops" />
    	

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/css/toolbar.css" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="/resources/css/tabs.css" />
		<link rel="stylesheet" type="text/css" href="/resources/css/tabstyles.css" />
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
		
body {
			  background-color: #EBF7FF;
			  font-family: 'Nanum Gothic', sans-serif;
		}

				table{
			background-color: white;
		}
		td, th{
			color: black ;
		}
		
		
		
	/* 	게시글 등록 Modal */
		.modal-dialog.modal-80size {
		  width: 300%;
		  height: 100%;
		  margin: 0;
		  padding: 0;
		}
		
		.modal-content.modal-80size {
		  color: black;
		  height: auto;  
		  min-height: 150%;
		  border-radius: 0;
		}
		
		.modal.modal-center {
		  text-align: center;
		}
		
		@media screen and (min-width: 768px) {
		  .modal.modal-center:before {
		    display: inline-block;
		    vertical-align: middle;
		    content: " ";
		    height: 100%;
		   
		  }
		}
		
		.modal-dialog.modal-center {
		  display: inline-block;
		  text-align: left;
		  vertical-align: middle;
		}
		


    </style>
				</head>
			<body>

<body>

	<div class="container">
		<div class="text-center">
	       <h7><span style="color : red;"><strong>*쿠폰 유효기간은 발급일로 부터 3개월입니다.</strong></span></h7>
	    </div><br>
	  
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-bordered text-center rounded">
      
        <thead>
          <tr>
            <th align="left">쿠폰용도</th>          
            <th align="left">쿠폰발급일자</th>
            <th align="left">쿠폰상태</th>
            
            
          </tr>
        </thead>
       
		<tbody>
				
			
		  <c:forEach var="coupon" items="${list}">
			<tr>
			  <td>
			  
			  <c:set var ="Code" value="${coupon.couponCode}"/>
			  <c:if test="${Code eq '0'}">
			   강조권</c:if>
			 <c:if test="${Code eq '1'}">
			 	상단출력</c:if>
				</td>
				
			
			  <td>${coupon.couponRegDate}
			  <td>  <c:set var ="State" value="${coupon.couponStatement}"/>
			  <c:if test="${State eq '0'}">
			   <span style="color:blue;">사용가능</span></c:if>
			 <c:if test="${State eq '1'}">
			 	<span style="color:red;">사용됨</span></c:if>
			<c:if test="${State eq '2'}">
			 	<span style="color:red;">기간만료</span></c:if>
			  	<input type="hidden" value="${coupon.userId}">			
			  </td>		
			</tr>
			</c:forEach>
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->

		
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	


</body>

</html>