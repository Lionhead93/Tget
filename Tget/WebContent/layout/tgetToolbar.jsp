 <%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!-- Header -->
			<header id="header">
				<h1><a id="brand" href="#">T-GET <span>by MFC</span></a></h1>
				
				
					<a href="#">Home</a>
				<c:if test="${empty user}">
					<a href="#">Sign Up</a>
					<a href="#">Login</a>
				</c:if>
				<c:if test="${!empty user}">
					<a href="#">Logout</a>
					<a href="#" data-target="#alarmModal" data-toggle="modal">
							 Alarm &nbsp;<span class="badge badge-info" id="noReadAlarmCount"></span>
					</a>
				</c:if>				
				<a href="#menu">Menu</a>
									  
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li>
					      <div class="text-center"><strong><i class="fas fa-user-circle"></i>&nbsp;User</strong></div>
				          <a href="#">마이페이지</a>
				          <a href="#">관심이벤트</a>
				          <a href="#">회원관리</a>
				    </li>     																				
					
				</ul>
				<ul class="links">
					<li>
					      <div class="text-center"><strong><i class="fas fa-user-circle"></i>&nbsp;Event</strong></div>
				          <a href="#">이벤트관리</a>
				    </li>     																				
					
				</ul>
				<ul class="links">
					<li>
						 <div class="text-center"><strong><i class="fas fa-user-circle"></i>&nbsp;Ticket</strong></div>
				          <a href="#">내 판매목록</a>
				          <a href="#">내 거래내역</a>
				          <a href="#">티켓관리</a>
					</li> 
				 </ul>
				 <ul class="links">
					<li>
						 <div class="text-center"><strong><i class="fas fa-user-circle"></i>&nbsp;RnP</strong></div>
				          <a href="#">리뷰작성</a>
				          <a href="#">내리뷰조회</a>
				          <a href="#">내평점조회</a>
				          <a href="#">포인트내역조회</a>
					</li> 
				 </ul>
				 <ul class="links">
					<li>
						 <div class="text-center"><strong><i class="fas fa-user-circle"></i>&nbsp;Coupon</strong></div>
				          <a href="#">쿠폰등록</a>
				          <a href="#">내쿠폰조회</a>
					</li> 
				 </ul>
			</nav>

<!-- 알림내역 모달창  -->
					<div class="modal fade" id="alarmModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h3 class="modal-title" id="modalCenterTitle"><span class="text-secondary">My Alarm</span></h3>
					        <a href="#" class="close" data-dismiss="modal">
					          &times;
					        </a>
					      </div>
					      <div class="modal-body">
					      </div>
					      <div class="modal-footer">
					        </div>
					    </div>
					  </div>
					</div>
		
