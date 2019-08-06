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
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
		
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
		<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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
			  font-family: 'Nanum Gothic', sans-serif;
		}
		a{
			color: #041625;
		}

    	</style>
				
			
<script type="text/javascript">

	window.onload = function(){
		
		if(${user.role==0}){
			
			document.getElementById("cc").style.display = "none" ;
			document.getElementById("cc2").style.display = "none" ;
			
		}
	}


function fncUpdateUser() {
	var name=$("input[name='userName']").val();
	
	if(name == null || name.length <1){
		alert("이름은  반드시 입력하셔야 합니다.");
		return;
	}
		
	$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
}


$(function() {
	
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button:contains('판매내역 조회')").on("click" , function() {

				
		window.open("/ticket/getTicketList?menu=seller");
				
	});
});	









				</script>
			</head>
			<body>
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<jsp:include page="/layout/tgetHeader.jsp" />
	
			
	<!-- <div class="text-right" style="margin-right: 130px; margin-top: 30px;">	  
	
	</div> -->
		   <!--  table Start /////////////////////////////////////-->
			<section>
				<br/>
				<div class="tabs tabs-style-topline">
			
					<nav>
						<ul style="color:black;">
							<li><a href="#section-topline-1"><h6><strong style="color:black;">내 프로필 보기</strong></h6></a></li>
							<li><a href="#section-topline-2"><h6><strong style="color:black;">판매자 정보 보기</strong></h6></a></li>
						</ul>
					</nav>
				
			<div class="content-wrap">
				<section id="section-topline-1">
				<div class="row">
				<div class="col-lg-3"></div>
				<div class="col-lg-6">
								<div class="text-center">
					     		<br/>
					     		<div class="card text-center shadow rounded" style="margin-bottom: 10px;">
							 	<div class="card-body">	              
						        <h3><i class="far fa-user"></i><strong> ${user.nickName}님 프로필</strong></h3><hr/><br/>
													
									<div class="row">		
										<div class="col-md-2"></div>	
								  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i><strong> 아이디</strong></h5></div>
										<div class="col-md-6 text-left">${user.userId}</div>
									</div><br/>
									<div class="row">	
									<div class="col-md-2"></div>			
								  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i><strong> 닉네임</strong></h5></div>
										<div class="col-md-6 text-left">${user.nickName}</div>
									</div><br/>
									<div class="row">	
									<div class="col-md-2"></div>			
								  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i><strong> 이 름</strong></h5></div>
										<div class="col-md-6 text-left">${user.userName}</div>
									</div><br/>
									<div class="row">
									<div class="col-md-2"></div>				
								  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i><strong> 주소</strong></h5></div>
										<div class="col-md-6 text-left">${user.address}</div>
									</div><br/>
									<div class="row">		
									<div class="col-md-2"></div>		
								  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i><strong> 전화번호</strong></h5></div>
										<div class="col-md-6 text-left">${ !empty user.phone ? user.phone : ''}</div>
									</div><br/><br/>
									
									
												
							  		<div class="text-center">
							  			<button type="button" class="btn btn-outline-primary" data-target="#updateUserModal" data-toggle="modal">회원정보 수정</button><br>
							  		</div>
						            <br/>            
						            </div>
									</div>									 
								</div>
					</div>
					<div class="col-lg-3"></div>
					</div>										
					</section>
				
				<section id="section-topline-2">
				<div class="row">
				 <div class="col-md-6 text-center">     		
		     			<div class="card text-center shadow rounded" style="margin-bottom: 10px;">
						 <div class="card-body">	
						                      
									<h4><i class="far fa-user"></i><strong> ${user.nickName}님 판매자정보</strong></h4><hr/><br/>
									<c:if test="${user.role != 0}">
									<div class="row">		
												<div class="col-md-2"></div>	
										  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i><strong> 판매자등급</strong></h5></div>
												<div class="col-md-6 text-left">
													<c:set var="sc" value ="${user.sellerCode}"/>							
													<c:choose>
													<c:when test="${sc eq '0' }"> 새싹 </c:when>
													<c:when test="${sc eq '1' }"> 우수 </c:when>
													<c:when test="${sc eq '2' }"> V.I.P </c:when>											
													<c:otherwise>											
													</c:otherwise>		
													</c:choose>
												</div>
									</div><br/>
									<div class="row">
											<div class="col-md-2"></div>				
										  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i><strong> 총 판매금액</strong></h5></div>
												<div class="col-md-6 text-left">${user.salesAmount}</div>
									</div><br/>
									<div class="row">
											<div class="col-md-2"></div>				
										  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i><strong> 총 판매횟수</strong></h5></div>
												<div class="col-md-6 text-left">${user.salesCount}</div>
									</div><br/>
									
									<button id="sb" type="button" class="btn btn-outline-primary" >판매내역 조회</button>	<br>
									</c:if>
									<c:if test="${user.role == 0}">
										<div class="text-danger text-center">*판매자 등록을 해주세요.</div><br/><br/>
										<button type="button" class="btn btn-outline-primary" data-target="#addSellerModal" data-toggle="modal" >판매자 등록</button>
										<br/>
									</c:if>
								</div>									
							</div>
					</div>	
					
							 <div class="col-md-6 text-center">
										<div class="card text-center shadow rounded" style="margin-bottom: 10px;">
								 <div class="card-body">	
													<h4><i class="far fa-user"></i><strong> ${user.nickName}님 계좌정보</strong></h4><hr/><br/>
													<c:if test="${user.role != 0}">
													<div class="row">
															<div class="col-md-2"></div>				
														  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i><strong> 예금주명</strong></h5></div>
															<div class="col-md-6 text-left">${user.userName}</div>
													</div><br/>
													<div class="row">
															<div class="col-md-2"></div>				
														  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i><strong> 은행명</strong></h5></div>
															<div class="col-md-6 text-left">
															<c:set var="sc" value ="${user.accountBank}"/>													
															<c:choose>
															<c:when test="${sc eq '039' }"> 경남은행 </c:when>
															<c:when test="${sc eq '004' }"> 국민은행 </c:when>
															<c:when test="${sc eq '034' }"> 광주은행 </c:when>
															<c:when test="${sc eq '003' }"> 기업은행 </c:when>
															<c:when test="${sc eq '031' }"> 대구은행 </c:when>
															<c:when test="${sc eq '045' }"> 새마을금고 </c:when>
															<c:when test="${sc eq '088' }"> 신한은행 </c:when>
															<c:when test="${sc eq '048' }"> 신협</c:when>
															<c:when test="${sc eq '027' }"> 씨티은행 </c:when>
															<c:when test="${sc eq '020' }"> 우리은행 </c:when>
															<c:when test="${sc eq '071' }"> 우체국 </c:when>
															<c:when test="${sc eq '005' }"> 외환은행 </c:when>
															<c:when test="${sc eq '081' }"> 하나은행 </c:when>
															<c:otherwise>
																판매자 등록 후 조회가능.
																<button id= "add" type="button" class="btn btn-outline-primary" data-target="#addSellerModal" data-toggle="modal">판매자 등록</button>
															</c:otherwise>		
															</c:choose>
															</div>
													</div><br/>
													<div class="row">
															<div class="col-md-2"></div>				
														  		<div class="col-md-4 text-left"><h5><i class="fas fa-check"></i><strong> 계좌번호</strong></h5></div>
															<div class="col-md-6 text-left">${user.accountNo}</div>															
													</div><br/>
													<div class="text-center">
													  	<button type="button" class="btn btn-outline-primary" data-target="#addSellerModal" data-toggle="modal" >계좌정보 수정</button>
														<br/>		
													 </div> 
											  	</c:if>
											  	<c:if test="${user.role == 0}">
													<div class="text-danger text-center">*판매자 등록을 해주세요.</div><br/><br/>
													<button type="button" class="btn btn-outline-primary" data-target="#addSellerModal" data-toggle="modal" >판매자 등록</button>
													<br/>
												</c:if>
										</div>
										</div>
									</div>
						</div>
					</section>
					</div>		
					</div>
					</section>
						
					
<script src="/resources/javascript/cbpFWTabs.js"></script>
<script type="text/javascript"> src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
			(function() {

				[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
					new CBPFWTabs( el );
				});

			})();
</script>	
<jsp:include page="/user/updateUser.jsp" /> 
<jsp:include page="/ticket/addSeller.jsp" /> 
<jsp:include page="/layout/footer.jsp" />
</body>


</html> 