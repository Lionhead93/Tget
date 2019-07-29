<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>T-GET</title>
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
		
		$.ajax(
				{
					url : "/event/rest/getPopularEventList",
					method : "POST",
					dataType : "json",
					success : function(JSONData, status){
							recommSize = JSONData.recommEventlistSize;
							$.each(JSONData.eventNameList, function(index,value){
								if(value=="${event.eventName}"){
									$("#title").append("<span class='neon' style='font-weight:bold;font-size:23px'>HOT</span>");
// 									$("#title").attr("class","neon");
									
								}
							});
					}
		});
		
		$("input[type='text']").on("keyup",function(){
			$("#searchKeyword").val($("input[type='text']").val());
		});
		
		$("input[type='text']").on("keypress",function(){
			if (event.keyCode ==13) {
				$("#searchCondition").val("1");
				$("form[name='searchEvent']").attr("method" , "POST").attr("action" , "/event/getEventList").submit();
			}
		});
		
		$("#button-addon2").on("click",function(){
			$("#searchCondition").val("1");
			$("form[name='searchEvent']").attr("method" , "POST").attr("action" , "/event/getEventList").submit();
		});
		
		
	
		$(".addTicket").on("click",function(){			
			var eventId = $(this).val(); 			
			if ("${empty user}"=="true") {
				alert("로그인을 해주세요.");
				$("form[name='main']").attr("method" , "GET").attr("action" , "/user/login").submit();
// 				self.location="/user/login";
			} else {
				$("#eventId").val($(this).val());
				$("form[name='main']").attr("method" , "GET").attr("action" , "/ticket/addTicketInfo").submit();
// 				self.location="/ticket/addTicketInfo?eventId="+eventId;
// 				self.location="/user/login";
			}
// 			$("#eventId").val($(this).val());
// 			$("form").attr("method" , "GET").attr("action" , "/ticket/addTicketInfo?eventId="+$(this).val()).submit();
// 			self.location="/ticket/addTicketInfo?eventId="+$(this).parent().children("input[type='hidden']").val();
		});		
		
		$(".getTicketList").on("click",function(){
			
			$("#eventId").val($(this).val());
			$("form[name='main']").attr("method" , "POST").attr("action" , "/event/getEventTicketList?eventIds="+$(this).val()).submit();
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
	
	#footer{
		background-color: #1B1B1F ;
	}
	a, hr{
			color: #FBFCFE ;	
		}
		
	button.btn-light:hover{
		background-color: gray;
		color: #FBFCFE ;
	}	
	
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
		
      div.container{
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
        
       img.main {
         	width: 400px; 			
 	 		hieght: 250px; 
        }

	/*	@media all and (max-width: 700px) {
		    img.main { width:50%; }
 		} */
 		
 		
 		
		
		.neon {
		  font-family: neon;
		  color: #FB4264;
/* 		  font-size: 9vw; */
/* 		  line-height: 9vw; */
		  text-shadow: 0 0 3vw #F40A35;
		}
		
		.flux {
		  font-family: neon;
		  color: #426DFB;
/* 		  font-size: 9vw; */
/* 		  line-height: 9vw; */
		  text-shadow: 0 0 3vw #2356FF;
		}
		
/* */ 		.neon {
		  animation: neon 1s ease infinite;
		  -moz-animation: neon 1s ease infinite;
		  -webkit-animation: neon 1s ease infinite;
		}
		
		
		@keyframes neon {
		  0%,
		  50% {
		    text-shadow: 0 0 1vw #FA1C16, 0 0 3vw #FA1C16, 0 0 10vw #FA1C16, 0 0 10vw #FA1C16, 0 0 .4vw #FED128, .5vw .5vw .1vw #806914;
		    color: #FED128;
		  }
		  50% {
		    text-shadow: 0 0 .5vw #800E0B, 0 0 1.5vw #800E0B, 0 0 5vw #800E0B, 0 0 5vw #800E0B, 0 0 .2vw #800E0B, .5vw .5vw .1vw #40340A;
		    color: #806914;
		  }
		}
		
		.flux {
		  animation: flux 2s linear infinite;
		  -moz-animation: flux 2s linear infinite;
		  -webkit-animation: flux 2s linear infinite;
		  -o-animation: flux 2s linear infinite;
		}
		
		@keyframes flux {
		  0%,
		  100% {
		    text-shadow: 0 0 1vw #1041FF, 0 0 3vw #1041FF, 0 0 10vw #1041FF, 0 0 10vw #1041FF, 0 0 .4vw #8BFDFE, .5vw .5vw .1vw #147280;
		    color: #28D7FE;
		  }
		  50% {
		    text-shadow: 0 0 .5vw #082180, 0 0 1.5vw #082180, 0 0 5vw #082180, 0 0 5vw #082180, 0 0 .2vw #082180, .5vw .5vw .1vw #0A3940;
		    color: #146C80;
		  }
  		}
    </style>
	
</head>

<body>
<jsp:include page="/layout/tgetToolbar.jsp" />

<form name="searchEvent">
			<div id="tgetHeader" class="text-center">
			<br/><br/><br/>
				<input type="hidden"  id="category" name="category"  value="${!empty category? category : ''}" >
				<input type="hidden"  id="searchKeyword" name="searchKeyword"  placeholder="searchKeyword" value="${!empty search.searchKeyword? search.searchKeyword : ''}" >
				<input type="hidden"  id="searchCondition" name="searchCondition"  placeholder="searchCondition" value="${!empty search.searchCondition? search.searchCondition : ''}" >
				<div class="row"><div class="col-lg-3  col-md-3 col-1"></div>
				<div class="col-lg-6 col-md-6 col-10">	
					<div class="input-group mb-1">
				  		<input type="text" class="form-control" placeholder="이벤트명을 입력하세요"  aria-describedby="basic-addon2">
				  		<div class="input-group-append">
				    		<span class="input-group-text btn"  id="button-addon2">검색</span>
				 		 </div>
					</div>
					<div class="col-lg-3 col-md-3 col-1"></div>
				</div>
			</div>
			<input type="hidden"  id="requestPageToken" name="requestPageToken"  value="${!empty requestPageToken? requestPageToken : ''}"/><br/>
		</div>
	</form>


<form name="main">
	<div class="container"  align="left" style="margin-top: 50px">
			<div class="row">
				<div class="col-lg-5  col-12" align="center">
					<div class="sticky-top">
						<div class="textcontainer">
							<div id="title"><h1>${event.koName}</h1></div>
						</div>
					<input type="hidden"  id="eventId" name="eventId" />
					<input type="hidden"  id="koName" name="koName"  value="${event.koName}" >
					<input type="hidden"  id="koPerformer" name="koPerformer"  value="${event.koPerformer}" >
					<input type="hidden"  id="eventName" name="eventName"  value="${eventName}" >
					<input type="hidden"  id="category" name="category"  value="${category}" >
					<input type="hidden" id="eventImage" name="eventImage" value="${eventImage}"/>
					<div align="right" style="padding:10px">
						<c:if test="${!empty eventImage}">
							<img class="main" src="/resources/images/uploadFiles/${eventImage}" style="" />
						</c:if>
						<c:if test="${empty eventImage}">
							<img src="/resources/images/logo.png"  style="width:400px; height=250px;"/>
<!-- 							<img src = "http://placehold.it/500x280" class="img-rounded"/> -->
						</c:if>
						<br/>
						<div >
							<div align="right">조회수 : ${viewCount}회<br/></div>
							
							<c:if test="${user.role == 2 }">
								<button type="button" class="btn btn-light"  id="editImage">편집</button><br/>
							</c:if>
							
						</div>
					</div>	
					</div>
				</div>			
				<div class="col-lg-7  col-sm-12 col-12">	
				
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
											<div class="container" align="center">			
												<button type="button" class="btn btn-light addTicket"  value="${i.eventId}">판매</button>&nbsp;&nbsp;&nbsp;&nbsp;
												<button type="button" class="btn btn-light getTicketList"  value="${i.eventId}">구매</button><br/>
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