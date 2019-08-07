 <%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
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
		<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
		
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
		<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
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
			font-family: 'Jua', sans-serif;
		}

		a{
			color: #041625;
		}

		

    </style>
</head>
<body>
			
<script type="text/javascript">

</script>
			
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<jsp:include page="/layout/tgetHeader.jsp" />
	
			
	<div class="container" >
				
			<section>
				<br/>
				<div class="tabs tabs-style-topline">
				
						<nav>
							<ul>
								<li><a href="#section-topline-1"><h6><strong style="color:black;">회원목록 보기</strong></h6></a></li>
								<li><a href="#section-topline-2"><h6><strong style="color:black;">블랙리스트 보기</strong></h6></a></li>
							</ul>
						</nav>
					
				<div class="content-wrap">
					<section id="section-topline-1">
						<div class="row">			
							<c:forEach var="user" items="${list}">
							<div class="col-3">
							<div class="card text-center shadow rounded" >
								<c:if test="${user.blacklistCode ne null }">
								</c:if>						
								  ${user.userId}
								  ${user.blacklistCode}					
								  ${user.blacklistStartDate.toLocaleString()}
								  ${user.blacklistEndDate.toLocaleString()}					
							</div>	
							</div>
					        </c:forEach>		       
						</div>				
					</section>
					
					<section id="section-topline-2">
					</section>							
					</div><!-- /content -->
				</div><!-- /tabs -->
									
		</section>
					
	</div>	
				
 
<script src="/resources/javascript/cbpFWTabs.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
			(function() {

				[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
					new CBPFWTabs( el );
				});

			})();
</script>	
	 
<jsp:include page="/layout/footer.jsp" />
<jsp:include page="/coupon/addCoupon.jsp" />
</body>


</html> 