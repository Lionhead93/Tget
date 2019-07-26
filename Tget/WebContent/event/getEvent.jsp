<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>getEvent</title>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	
	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<!-- 	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/jquery.scrolly.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	<script type="text/javascript">

	var str = "";
	var videoList = [];
	
	$(function(){
		$(".addTicket").on("click",function(){			
			var eventId = $(this).val(); 			
			if ("${empty user}"=="true") {
				alert("로그인을 해주세요.");
				$("form").attr("method" , "GET").attr("action" , "/user/login").submit();
// 				self.location="/user/login";
			} else {
				$("#eventId").val($(this).val());
				$("form").attr("method" , "GET").attr("action" , "/ticket/addTicketInfo").submit();
// 				self.location="/ticket/addTicketInfo?eventId="+eventId;
// 				self.location="/user/login";
			}
// 			$("#eventId").val($(this).val());
// 			$("form").attr("method" , "GET").attr("action" , "/ticket/addTicketInfo?eventId="+$(this).val()).submit();
// 			self.location="/ticket/addTicketInfo?eventId="+$(this).parent().children("input[type='hidden']").val();
		});		
		
		$(".getTicketList").on("click",function(){
			
			$("#eventId").val($(this).val());
			$("form").attr("method" , "POST").attr("action" , "/event/getEventTicketList?eventIds="+$(this).val()).submit();
// 			self.location="/event/getEventTicketList?eventId="+$(this).parent().children("input[type='hidden']").val();
		});		
		
// 		$(document).on("click", "#editImage",function(){			
			
// 		});		
		$("#editImage").on("click",function(){		
			popWin = window.open("/event/addEventImage?eventName="+$("#eventName").val()
					+"&eventImage="+$("#eventImage").val(),"popWin",
					"left=500, top=100, width=600, height=600, "
					+"marginwidth=0, marginheight=0, scrollbars, scrolling, menubar=no, resizable");
// 			popWin = window.open("addEventImageGET.jsp",
// 					"popWin",
// 					"left=500, top=100, width=600, height=600, "
// 					+"marginwidth=0, marginheight=0, scrollbars, scrolling, menubar=no, resizable");
		});		
		
// 		$("#updateImage").on("click",function(){			
// 			openChild();
// 		});		
		
// 		$("#deleteImage").on("click",function(){			
			
// 		});		

		$("#eventImage").on("change",function(){			
			alert("onChange");
	 	});	
	});
	
	</script>
	
	<style>
	
	body{
			background-color : #062038; 
			color: #FBFCFE;
		}
		
		div.border{
			background-color : #193147; 
		}
		
		div.border:hover{
			background-color : #041625; 
		}
		
      div.container-fluid {
/*         	font-family: 'Sunflower', sans-serif; */
	 		font-size: 20px;    
        }
        
        div.col-md-4{
        	border: 1px; color: black;
      	}
      	div.list{
/*         	font-family: 'Sunflower', sans-serif; */
	 		font-size: 20px;
      	}
        
       img {
        	padding: 25px 25px 25px  25px ;
        	width: 500px;
	 		hieght: 280px;
        }
        
        .button_black{
			border:1px solid #616261; -webkit-border-radius: 3px; -moz-border-radius: 3px;border-radius: 3px;
			font-size:20px;font-family: 'Nanum Pen Script', cursive; padding: 0px 15px 0px 15px; 
			/* text-decoration:none; display:inline-block;text-shadow: -1px -1px 0 rgba(0,0,0,0.3);font-weight:bold; color: #FFFFFF; */
			 border-radius: 3px; color: white;
			 font-size:25px;font-family: 'Nanum Pen Script', cursive; 
/* 			 text-decoration:none; text-shadow: -1px -1px 0 rgba(0,0,0,0.3);font-weight:bold; color: #FFFFFF; */
			 background-color: #7d7e7d; background-image: -webkit-gradient(linear, left top, left bottom, from(#7d7e7d), to(#0e0e0e));
			 background-image: -webkit-linear-gradient(top, #7d7e7d, #0e0e0e);
			 background-image: -moz-linear-gradient(top, #7d7e7d, #0e0e0e);
			 background-image: -ms-linear-gradient(top, #7d7e7d, #0e0e0e);
			 background-image: -o-linear-gradient(top, #7d7e7d, #0e0e0e);
			 background-image: linear-gradient(to bottom, #7d7e7d, #0e0e0e);
			 filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#7d7e7d, endColorstr=#0e0e0e);
		}
			
		.button_black:hover{
			 border:1px solid #4a4b4a;
			 background-color: #646464; background-image: -webkit-gradient(linear, left top, left bottom, from(#646464), to(#282828));
			 background-image: -webkit-linear-gradient(top, #646464, #282828);
			 background-image: -moz-linear-gradient(top, #646464, #282828);
			 background-image: -ms-linear-gradient(top, #646464, #282828);
			 background-image: -o-linear-gradient(top, #646464, #282828);
			 background-image: linear-gradient(to bottom, #646464, #282828);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#646464, endColorstr=#282828);
		}
		
		hr{
			 background-color:#FBFCFE ;
		}
    </style>
	
</head>

<body>
<jsp:include page="/layout/tgetToolbar.jsp" />
<form>
	<div class="container-fluid"  align="center" style="margin-top: 50px">
			<br/>			
			<div class="row">
				<div class="col-lg-5" align="center">
					<div class="sticky-top">
					<h3>${event.koName}</h3>
					<input type="hidden"  id="eventId" name="eventId" />
					<input type="hidden"  id="koName" name="koName"  value="${event.koName}" >
					<input type="hidden"  id="koPerformer" name="koPerformer"  value="${event.koPerformer}" >
					<input type="hidden"  id="eventName" name="eventName"  value="${eventName}" >
					<input type="hidden"  id="category" name="category"  value="${category}" >
					<input type="hidden" id="eventImage" name="eventImage" value="${eventImage}"/>
					<div align="right">
						<c:if test="${!empty eventImage}">
							<img src="/resources/images/uploadFiles/${eventImage}" />
						</c:if>
						<c:if test="${empty eventImage}">
							<img src="/resources/images/logo.png"  style="width:500px; height=280px;"/>
<!-- 							<img src = "http://placehold.it/500x280" class="img-rounded"/> -->
						</c:if>
						<br/>
						<div >
							<div align="right">조회수 : ${viewCount}회<br/></div>
							
							<c:if test="${user.role == 2 }">
								<button class="button_black" id="editImage" >편집</button><br/>
							</c:if>
							
						</div>
					</div>	
					</div>
				</div>			
				<div class="col-lg-6">	
				
				<section id="section-topline-1" align="center">

					<div class="row" align="center">
						<c:forEach var="i" items="${eventListByName}" varStatus="j">
							<div class="col-lg-6">
								<div class="text-center">
									<div class="border">
								 		<br/>
								 		<h5><strong>${i.eventDate } <span id="time"> ${i.eventTimeStr}</span></strong></h5>
								 		<hr/>
								 		
								 		<div class="event" align="center" style="margin-left:10%;margin-right:10%">		
								 		<div align="left" >
								 			<%-- 											<small>${i.eventDate }, <span id="time">${i.eventTimeStr}</span></small><br/> --%>
											<ion-icon name="checkmark"></ion-icon><small>개최장소</small><br/>
											<small>${!empty event.koLocation? event.koLocation: i.eventLocation }</small><br/><br/>
											<ion-icon name="checkmark"></ion-icon>
											<small>현재 등록된 티켓</small><br/> ${i.totalTicketCount } 건<br/><br/>
											<ion-icon name="checkmark"></ion-icon>
											<small>티켓최저가</small><br/>${i.ticketLowestPriceStr } 원<br/>	<br/>	<br/>	
											<div class="container-fluid" align="center">			
												<button class="button_black addTicket"  value="${i.eventId}">판매</button>&nbsp;&nbsp;&nbsp;&nbsp;
												<button class="button_black getTicketList"  value="${i.eventId}">구매</button><br/>
											</div>	
								 		</div>									
										</div>		
								 			<div><small></small></div>
								 			<div><small></small></div>
								 			<br/>
								 		</div>
								 	</div>	
								 	</div>
								 </c:forEach>
							 </div>
						</section>
				
				
				
				
<!-- 					<table class="table table-striped"> -->
<!-- 					  <thead> -->
<!-- 					    <tr align="center"> -->
<%-- 					      <th scope="col"><h4>검색 결과 총 ${totalResults}건</h4></th> --%>
<!-- 					    </tr> -->
<!-- 					  </thead> -->
<!-- 					  <tbody> -->
<%-- 					  <c:forEach items="${eventListByName}"  var="i"> --%>
<!-- 					    <tr> -->
<!-- 					      <td> -->
<!-- 							<div class="event" align="left">		 -->
<%-- 								${i.eventDate }, <span id="time">${i.eventTimeStr}</span><br/> --%>
<%-- 								${!empty event.koLocation? event.koLocation: i.eventLocation }<br/> --%>
	
<%-- 								현재 등록된 티켓 수 : ${i.totalTicketCount }<br/> --%>
<%-- 								티켓최저가 : ${i.ticketLowestPriceStr }<br/>				 --%>
<%-- <%-- 								<input type="hidden"  id="category2" name="category2"  value="${i.categoryTwoEng}" > --%>			
<%-- 								<button class="button_black addTicket"  value="${i.eventId}">판매</button>&nbsp;&nbsp;&nbsp;&nbsp; --%>
<%-- 								<button class="button_black getTicketList"  value="${i.eventId}">구매</button><br/> --%>
<!-- 							</div>			 -->
<!-- 					  </td> -->
<!-- 				    </tr> -->
<%-- 				   </c:forEach> --%>
<!-- 			  		 </tbody> -->
<!-- 					</table>					 -->
				</div>
<!-- 				<div class="col-lg-1"></div> -->
		</div>
		
	</div>
</form>
<jsp:include page="/layout/footer.jsp" />
</body>
</html>