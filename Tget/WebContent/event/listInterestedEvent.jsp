<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>내 관심 이벤트</title>
	<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/blog/">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Acme|Bungee+Shade|Fredericka+the+Great&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
    <script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/jquery.scrolly.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="/resources/javascript/common.js" ></script>
    <script type="text/javascript">

    $(function(){
    	
    	
    	$("#checkAll").on("click", function(){
    		
    		if ($(this).prop("checked")) {
    			$(".check").prop("checked","checked");    			
			}else{
				$(".check").prop("checked",false);
			}    		
    	});
    	
    	$(".check").on("click", function(){
    		if ($(".check:checked").length=="${interestedEventListCount}") {
    			$("#checkAll").prop("checked","checked");   
			}else{
				$("#checkAll").prop("checked",false);   
			}
    	})
    	
    	$(".btn").on("click", function(){
//     		$("form").attr("method" , "POST").attr("action" , "/event/getEventTicketList?eventId="+$(this).val()).submit();
    		self.location = "/event/getEventTicketList?eventIds="+$(this).val();
        });
    	
    	$("#all").on("click", function(){
    		$("form").attr("method" , "POST").attr("action" , "/event/deleteInterestedEventAll").submit();
    	});
    	
    	$("#select").on("click",function(){
    		$("form").attr("method","POST").attr("action","/event/deleteInterestedEvent");
    	})
    	
    });
    
    $(function(){
    	

//     	var countDownDate = new Date("2019-07-22 11:49").getTime();
//     	var x = setInterval(function() {
    	
//     	    var now = new Date().getTime();
//     	    var distance = countDownDate - now;
    	    
//     	    if (distance >= 60*60*48*1000 ) {
//     			$("div.cd").attr("style","visibility:hidden;");
//     		}
//     	    else if( distance <=0) {
//     			clearInterval(x);
//     			$("div.cd").html("<p ><br/>즐거운 관람되십시오.</p>");
// //     			$("div.cd").attr("style","visibility:hidden;");
// //     		    $("#expire").text("즐거운 관람되십시오.");
//     		} 
//     	    else {
//     			$("div.cd").attr("style","visibility:visible;");
//     		}
//     	    var days = Math.floor(distance / (1000 * 60 * 60 * 24)); 
     
//     	    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))+days*24; 
//     	    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
//     	    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

//     	    $(".hour").text(hours) ;
//     	    $(".minute").text(minutes) ;
//     	    $(".second").text(seconds);

// //     	if (distance = 0) {
// //     		    clearInterval(x);
// //     		    $("div.cd").attr("style","visibility:hidden;");
// //     		    $("#expire").text("즐거운 관람되십시오.");
// //     		}
//     	}, 1000);                                                                                                                                                                                   	
    	});
	</script>
	<style type="text/css">
	
	body{
			background-color : #062038; 
			color: #FBFCFE;
		}
	table{
		color: #FBFCFE;
	}
	
		h1{
			font-weight: bold; 
		}
	
		small{
			font-family: 'Nanum Pen Script', cursive;
		}
		
		 .button_black{
			border:1px solid #616261; -webkit-border-radius: 3px; -moz-border-radius: 3px;border-radius: 3px;
			font-size:15px;font-family: 'Nanum Pen Script', cursive; padding: 0px 15px 0px 15px; 
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
 		.container-fluid{ 
 			padding: 50px;
/*  			font-family: 'Sunflower', sans-serif; */
	 		font-size: 20px;    
 		} 
 		
 		
		ul {overflow:hidden;} 
		li { 
			margin: 5px 5px 5px 5px;
			 float:left; 
			list-style:none;
			text-align:center; margin-top:20px;  
			font-size:20px;
		} 
		li:first-child { margin-left:20px;  } 
		div.cd {
/* 			top: 50%; */
/* 			left: 50%; */
/* 			transform: translate(-50%, -50%); */
		}
		
	</style>
<body>	
<jsp:include page="/layout/tgetToolbar.jsp" />
<form>
	<div class="container-fluid" align="center">	
		<div class="row" >
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<input type="hidden"  id="userId" name="userId"  value="${user.userId}" >
				<h1>${user.nickName}<small>님의 관심이벤트</small></h1>
			</div><br/><br/><br/><br/>
			<div class="col-lg-3"></div>
		</div>

		<div class="row" >
			<div class="col-lg-2"></div>
			<div class="col-lg-8" align="center">
				
				<table class="table table-striped">
				  <thead>
				    <tr align="center">
				      <th scope="col"><h4><input type="checkbox" id="checkAll"  /></h4></th>
				      <th scope="col"><h4>관심이벤트</h4></th>
				      <th scope="col"></th>
<!-- 				      <th scope="col"><h4>카운트다운</h4></th> -->
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${interestedEventList}"  var="i">
				    <tr>
				      <td>
						<div align="center">
							<input type="checkbox" class="check"  value="${i.eventId }"/>
						</div>			
				  	  </td>
				  	  <td>
						<div class="event" align="left" >
							${i.eventName}<br/>
							${i.eventDate }, ${i.eventTimeStr}<br/>
							${i.eventLocation}<br/>
<!-- 							<button type="button" class="btn btn-outline-primary" >Primary</button> -->
						</div>			
				  	  </td>
				  	  <td>
						<div align="center" >
							<div style="font-size: 15px; font-weight: bold; margin: 10px;">
								최저가 ${i.ticketLowestPriceStr }원, 총 ${i.totalTicketCount }건
							</div>
							<button type="button" class="btn btn-outline-primary"  value="${i.eventId }">바로가기</button>						
						</div>			
				  	  </td>
			    </tr>
			   </c:forEach>
		  		 </tbody>
				</table>
			</div>
			<div class="col-lg-2"></div>
		</div>	
		<div class="floating"  align="center">
			<button id="all"  class="button_black">전체삭제</button>
			<button id="select" class="button_black">선택삭제</button>			
		</div>	
	</div>
	
	</form>
<jsp:include page="/layout/footer.jsp" />
</body>
</html>