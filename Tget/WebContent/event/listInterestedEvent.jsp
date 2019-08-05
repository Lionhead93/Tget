<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>T-GET</title>
	<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/blog/">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Acme|Bungee+Shade|Fredericka+the+Great&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	<link rel="stylesheet" href="/resources/css/yr.css" />
	<link rel="shortcut icon" href="/resources/images/logo.png">
	<link rel="icon" href="/resources/images/logo.png">		
    
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
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
	<script src="/resources/javascript/yr.js" ></script>
    <script type="text/javascript">

    $(function(){
    	
    	
//     	$("#checkAll").on("click", function(){
    		
//     		if ($(this).prop("checked")) {
//     			$(".check").prop("checked","checked");    			
// 			}else{
// 				$(".check").prop("checked",false);
// 			}    		
//     	});
    	
//     	$(".check").on("click", function(){
//     		if ($(".check:checked").length=="${interestedEventListCount}") {
//     			$("#checkAll").prop("checked","checked");   
// 			}else{
// 				$("#checkAll").prop("checked",false);   
// 			}
//     	})
    	
    	$("button.btn-outline-primary").on("click", function(){
    		var temp = $(this).val();
    		$.ajax(
					{
						url : "/event/rest/deleteInterestedEvent/"+temp,
						method : "POST",
						dataType : "json",
						success : function(JSONData, status){
// 							alert(status);
							$("#"+temp).remove();
						},
						error : function(request, status, error ) {   
						 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}			
				});	
        });
    	
    	$("td.record").on("click",function(){
//     		alert($(this).children("input[type='hidden']").val());
// 			$("form").attr("method" , "POST").attr("action" , "/event/getEventTicketList?eventId="+$(this).val()).submit();
    		self.location = "/event/getEventTicketList?eventIds="+$(this).children("input[type='hidden']").val();

    	});
    	
    	$("#all").on("click", function(){
    		$("form").attr("method" , "POST").attr("action" , "/event/deleteInterestedEventAll").submit();
    	});
    	
    	$("#select").on("click",function(){
    		$("form").attr("method","POST").attr("action","/event/deleteInterestedEvent");
    	})
    	
    	initparticles();
    	
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
		table{
			background-color : #F8FFFF;   
			border: 1px solid #193147;	
			color: #041625;
		}
 		tr.record:hover{
 			color: #041625;
			background-color : #D9E5FF; 
		}
		body{
			background-color: #EBF7FF;
			color: #041625;
/*     */ 				
		}
		#footer{
			background-color: #1B1B1F ;
		}
		a, hr{
				color: #041625;
			}	
		th, td, tr{
			padding: 20px;
			color: #041625;
		}
		
		h1{
			font-weight: bold; 
		}

	</style>
<body>	
<jsp:include page="/layout/tgetToolbar.jsp" />
<jsp:include page="/layout/tgetHeader.jsp" />
<form style="font-size: 20px;">
	<div class="container" align="center">	
		<div class="row" >
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<input type="hidden"  id="userId" name="userId"  value="${user.userId}" >
				<h1><span style="font-weight:bold;font-size:30px">${user.nickName}</span><small>님의 </small> 
					<span class="textcontainer" style="font-weight: bold; ">
						<span class="particletext hearts">관심이벤트<span class="particle" style="top:61%; left:26%;width:8px; height:8px;animation-delay: 2.5s;"></span><span class="particle" style="top:31%; left:70%;width:9.6px; height:9.6px;animation-delay: 1.5s;"></span><span class="particle" style="top:32%; left:48%;width:11.6px; height:11.6px;animation-delay: 1.2s;"></span><span class="particle" style="top:61%; left:33%;width:9.2px; height:9.2px;animation-delay: 0.9s;"></span><span class="particle" style="top:75%; left:86%;width:6.4px; height:6.4px;animation-delay: 1.2s;"></span><span class="particle" style="top:43%; left:74%;width:10.5px; height:10.5px;animation-delay: 0.8s;"></span><span class="particle" style="top:25%; left:10%;width:7.9px; height:7.9px;animation-delay: 2.6s;"></span><span class="particle" style="top:39%; left:2%;width:6.9px; height:6.9px;animation-delay: 0s;"></span><span class="particle" style="top:46%; left:73%;width:10.6px; height:10.6px;animation-delay: 3s;"></span><span class="particle" style="top:20%; left:86%;width:9.4px; height:9.4px;animation-delay: 2s;"></span><span class="particle" style="top:35%; left:45%;width:6.8px; height:6.8px;animation-delay: 2.3s;"></span><span class="particle" style="top:62%; left:41%;width:11.7px; height:11.7px;animation-delay: 0.7s;"></span><span class="particle" style="top:23%; left:59%;width:10.2px; height:10.2px;animation-delay: 1.7s;"></span><span class="particle" style="top:42%; left:66%;width:6.9px; height:6.9px;animation-delay: 0.2s;"></span></span>
					</span>
					
				</h1>
			</div><br/><br/><br/><br/>
			<div class="col-lg-3"></div>
		</div>

		<div class="row" >
<!-- 			<div class="col-lg-1"></div> -->
			<div class="col-12 col-md-12 col-lg-12" align="center">
				
				<table class="table ">
				  <thead>
				    <tr align="center">
<!-- 				      <th scope="col"  style="padding-left: 40px"><input type="checkbox" id="checkAll"  /></th> -->
				      <th scope="col" ><h4 align="center" style="font-weight: bold;margin:0%;">관심이벤트</h4></th>
				      <th scope="col" ><h4 align="center" style="font-weight: bold;margin:0%;">바로가기</h4></th>
<!-- 				      <th scope="col"><h4>카운트다운</h4></th> -->
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${interestedEventList}"  var="i">
				  <tr class="record">
<%-- 				    <tr class="record" id="${i.eventId }">				     --%>
<!-- 				      <td class="record" >				       -->
<%-- 				      	<input type="hidden" value="${i.eventId }"  /> --%>
<!-- 						<div align="center" style="padding-left: 30px"> -->
<!-- 							<br/> -->
<%-- 							<input type="checkbox" class="check"  value="${i.eventId }"/> --%>
<!-- 						</div>			 -->
<!-- 				  	  </td> -->
				  	  <td class="record" >
				  	  	<input type="hidden" value="${i.eventId }"  />
						<div class="event" align="left" style="padding-left: 60px">
							${i.koName}<br/>
							${i.eventDate }, ${i.eventTimeStr}<br/>
							${i.koLocation}<br/>
<!-- 							<button type="button" class="btn btn-outline-primary" >Primary</button> -->
						</div>			
				  	  </td>
				  	  <td>
						<div align="center" >
							<div style="font-size: 15px; font-weight: bold; margin: 10px;">
								최저가 ${i.ticketLowestPriceStr }원, 총 ${i.totalTicketCount }건
							</div>
							<button type="button" class="btn btn-outline-primary"  value="${i.eventId }">삭제</button>						
						</div>			
				  	  </td>
			    </tr>
			   </c:forEach>
		  		 </tbody>
				</table>
			</div>
<!-- 			<div class="col-lg-1"></div> -->
		</div>	
<!-- 		<div class="floating"  align="center"> -->
<!-- 			<button id="all"  class="btn btn-outline-light">전체삭제</button> -->
<!-- 			<button id="select" class="btn btn-outline-light">선택삭제</button>			 -->
<!-- 		</div>	 -->
	</div>
	</form>
	
	
<!-- 	<span class="textcontainer"> -->
<!-- 		<span class="particletext bubbles">Bubbles<span class="particle" style="top:29%; left:82%;width:5.2px; height:5.2px;animation-delay: 3s;"></span><span class="particle" style="top:67%; left:53%;width:4.8px; height:4.8px;animation-delay: 1.8s;"></span><span class="particle" style="top:65%; left:90%;width:5.5px; height:5.5px;animation-delay: 1.2s;"></span><span class="particle" style="top:56%; left:64%;width:7.2px; height:7.2px;animation-delay: 2.5s;"></span><span class="particle" style="top:80%; left:77%;width:7.1px; height:7.1px;animation-delay: 2.2s;"></span><span class="particle" style="top:31%; left:58%;width:5.4px; height:5.4px;animation-delay: 0.5s;"></span><span class="particle" style="top:28%; left:95%;width:6.1px; height:6.1px;animation-delay: 2.7s;"></span><span class="particle" style="top:57%; left:58%;width:7.9px; height:7.9px;animation-delay: 2.3s;"></span><span class="particle" style="top:72%; left:61%;width:7.6px; height:7.6px;animation-delay: 0s;"></span><span class="particle" style="top:49%; left:51%;width:4.9px; height:4.9px;animation-delay: 1.9s;"></span><span class="particle" style="top:42%; left:43%;width:7.4px; height:7.4px;animation-delay: 1.1s;"></span><span class="particle" style="top:69%; left:39%;width:4.7px; height:4.7px;animation-delay: 1.8s;"></span><span class="particle" style="top:61%; left:92%;width:7.2px; height:7.2px;animation-delay: 0s;"></span><span class="particle" style="top:28%; left:16%;width:4.9px; height:4.9px;animation-delay: 2.1s;"></span><span class="particle" style="top:69%; left:24%;width:5.4px; height:5.4px;animation-delay: 0.4s;"></span><span class="particle" style="top:51%; left:59%;width:6.5px; height:6.5px;animation-delay: 1.2s;"></span><span class="particle" style="top:74%; left:67%;width:7.4px; height:7.4px;animation-delay: 2.5s;"></span><span class="particle" style="top:63%; left:16%;width:6.8px; height:6.8px;animation-delay: 1.3s;"></span><span class="particle" style="top:31%; left:29%;width:5.9px; height:5.9px;animation-delay: 2.1s;"></span><span class="particle" style="top:23%; left:42%;width:4.5px; height:4.5px;animation-delay: 1.3s;"></span><span class="particle" style="top:71%; left:76%;width:5.7px; height:5.7px;animation-delay: 1.5s;"></span><span class="particle" style="top:76%; left:79%;width:5.7px; height:5.7px;animation-delay: 0.5s;"></span><span class="particle" style="top:71%; left:1%;width:5.3px; height:5.3px;animation-delay: 1.8s;"></span><span class="particle" style="top:77%; left:11%;width:7.7px; height:7.7px;animation-delay: 2.1s;"></span><span class="particle" style="top:68%; left:34%;width:4px; height:4px;animation-delay: 2.3s;"></span><span class="particle" style="top:49%; left:78%;width:6.6px; height:6.6px;animation-delay: 2.8s;"></span><span class="particle" style="top:37%; left:41%;width:5.1px; height:5.1px;animation-delay: 2.3s;"></span><span class="particle" style="top:57%; left:75%;width:4.9px; height:4.9px;animation-delay: 2.4s;"></span><span class="particle" style="top:62%; left:58%;width:7.9px; height:7.9px;animation-delay: 0.6s;"></span><span class="particle" style="top:25%; left:6%;width:5.3px; height:5.3px;animation-delay: 2.8s;"></span><span class="particle" style="top:71%; left:52%;width:5.6px; height:5.6px;animation-delay: 2.8s;"></span><span class="particle" style="top:71%; left:22%;width:7.9px; height:7.9px;animation-delay: 0.1s;"></span><span class="particle" style="top:30%; left:59%;width:6.2px; height:6.2px;animation-delay: 0.7s;"></span><span class="particle" style="top:60%; left:90%;width:6px; height:6px;animation-delay: 0.1s;"></span><span class="particle" style="top:45%; left:79%;width:6.2px; height:6.2px;animation-delay: 0.1s;"></span></span> -->
<!-- 	</span> -->
	
<!-- 	<span class="textcontainer"> -->
<!-- 		<span class="particletext confetti">Confetti<span class="particle c2" style="top:23%; left:77%;width:8px; height:4px;animation-delay: 1.9s;"></span><span class="particle c2" style="top:10%; left:17%;width:7px; height:4px;animation-delay: 0.4s;"></span><span class="particle c1" style="top:16%; left:71%;width:6px; height:4px;animation-delay: 0.7s;"></span><span class="particle c2" style="top:23%; left:4%;width:7px; height:4px;animation-delay: 0.2s;"></span><span class="particle c1" style="top:35%; left:21%;width:8px; height:4px;animation-delay: 2.2s;"></span><span class="particle c1" style="top:36%; left:61%;width:6px; height:3px;animation-delay: 1.8s;"></span><span class="particle c1" style="top:20%; left:76%;width:6px; height:4px;animation-delay: 2.5s;"></span><span class="particle c1" style="top:10%; left:87%;width:7px; height:4px;animation-delay: 0.7s;"></span><span class="particle c1" style="top:10%; left:82%;width:7px; height:4px;animation-delay: 2.1s;"></span><span class="particle c1" style="top:26%; left:60%;width:6px; height:3px;animation-delay: 0.1s;"></span><span class="particle c1" style="top:33%; left:82%;width:8px; height:3px;animation-delay: 2.8s;"></span><span class="particle c2" style="top:22%; left:68%;width:7px; height:4px;animation-delay: 2.5s;"></span><span class="particle c1" style="top:14%; left:91%;width:7px; height:4px;animation-delay: 1.2s;"></span><span class="particle c2" style="top:46%; left:95%;width:7px; height:4px;animation-delay: 2.5s;"></span><span class="particle c2" style="top:40%; left:55%;width:8px; height:4px;animation-delay: 2.2s;"></span><span class="particle c2" style="top:34%; left:37%;width:6px; height:3px;animation-delay: 2s;"></span><span class="particle c2" style="top:36%; left:16%;width:7px; height:3px;animation-delay: 0.8s;"></span><span class="particle c2" style="top:45%; left:92%;width:6px; height:3px;animation-delay: 2.3s;"></span><span class="particle c1" style="top:28%; left:49%;width:7px; height:3px;animation-delay: 1.6s;"></span><span class="particle c1" style="top:17%; left:79%;width:6px; height:4px;animation-delay: 0.3s;"></span><span class="particle c2" style="top:39%; left:15%;width:6px; height:4px;animation-delay: 1.7s;"></span><span class="particle c1" style="top:20%; left:86%;width:7px; height:4px;animation-delay: 1.9s;"></span><span class="particle c2" style="top:38%; left:54%;width:6px; height:4px;animation-delay: 2.8s;"></span><span class="particle c2" style="top:25%; left:60%;width:6px; height:4px;animation-delay: 0.4s;"></span><span class="particle c2" style="top:21%; left:29%;width:7px; height:4px;animation-delay: 1.6s;"></span><span class="particle c2" style="top:43%; left:78%;width:6px; height:3px;animation-delay: 0s;"></span><span class="particle c1" style="top:28%; left:79%;width:7px; height:3px;animation-delay: 1.6s;"></span><span class="particle c2" style="top:33%; left:16%;width:8px; height:3px;animation-delay: 3s;"></span><span class="particle c1" style="top:49%; left:79%;width:6px; height:3px;animation-delay: 0s;"></span><span class="particle c2" style="top:17%; left:9%;width:7px; height:4px;animation-delay: 1.1s;"></span><span class="particle c2" style="top:12%; left:95%;width:6px; height:3px;animation-delay: 1.1s;"></span><span class="particle c1" style="top:15%; left:62%;width:6px; height:3px;animation-delay: 1.9s;"></span><span class="particle c2" style="top:13%; left:58%;width:6px; height:4px;animation-delay: 0.7s;"></span><span class="particle c1" style="top:42%; left:39%;width:8px; height:4px;animation-delay: 1.8s;"></span><span class="particle c1" style="top:50%; left:95%;width:6px; height:4px;animation-delay: 0.6s;"></span></span> -->
<!-- 	</span> -->
	
<!-- 	<span class="textcontainer"> -->
<!-- 		<span class="particletext hearts">Hearts<span class="particle" style="top:61%; left:26%;width:8px; height:8px;animation-delay: 2.5s;"></span><span class="particle" style="top:31%; left:70%;width:9.6px; height:9.6px;animation-delay: 1.5s;"></span><span class="particle" style="top:32%; left:48%;width:11.6px; height:11.6px;animation-delay: 1.2s;"></span><span class="particle" style="top:61%; left:33%;width:9.2px; height:9.2px;animation-delay: 0.9s;"></span><span class="particle" style="top:75%; left:86%;width:6.4px; height:6.4px;animation-delay: 1.2s;"></span><span class="particle" style="top:43%; left:74%;width:10.5px; height:10.5px;animation-delay: 0.8s;"></span><span class="particle" style="top:25%; left:10%;width:7.9px; height:7.9px;animation-delay: 2.6s;"></span><span class="particle" style="top:39%; left:2%;width:6.9px; height:6.9px;animation-delay: 0s;"></span><span class="particle" style="top:46%; left:73%;width:10.6px; height:10.6px;animation-delay: 3s;"></span><span class="particle" style="top:20%; left:86%;width:9.4px; height:9.4px;animation-delay: 2s;"></span><span class="particle" style="top:35%; left:45%;width:6.8px; height:6.8px;animation-delay: 2.3s;"></span><span class="particle" style="top:62%; left:41%;width:11.7px; height:11.7px;animation-delay: 0.7s;"></span><span class="particle" style="top:23%; left:59%;width:10.2px; height:10.2px;animation-delay: 1.7s;"></span><span class="particle" style="top:42%; left:66%;width:6.9px; height:6.9px;animation-delay: 0.2s;"></span></span> -->
<!-- 	</span> -->
	
<!-- 	<span class="textcontainer"> -->
<!-- 		<span class="particletext fire">Fire<span class="particle" style="top:45%; left:13%;width:12px; height:12px;animation-delay: 0.2s;"></span><span class="particle" style="top:55%; left:87%;width:10px; height:10px;animation-delay: 0.3s;"></span><span class="particle" style="top:53%; left:-5%;width:11px; height:11px;animation-delay: 2s;"></span><span class="particle" style="top:53%; left:77%;width:8px; height:8px;animation-delay: 1.5s;"></span><span class="particle" style="top:69%; left:24%;width:8px; height:8px;animation-delay: 0.3s;"></span><span class="particle" style="top:57%; left:98%;width:9px; height:9px;animation-delay: 1.8s;"></span><span class="particle" style="top:66%; left:70%;width:8px; height:8px;animation-delay: 0.2s;"></span><span class="particle" style="top:64%; left:75%;width:8px; height:8px;animation-delay: 1.3s;"></span><span class="particle" style="top:41%; left:57%;width:11px; height:11px;animation-delay: 0.4s;"></span><span class="particle" style="top:50%; left:5%;width:10px; height:10px;animation-delay: 1.2s;"></span><span class="particle" style="top:48%; left:6%;width:8px; height:8px;animation-delay: 0.1s;"></span><span class="particle" style="top:60%; left:82%;width:8px; height:8px;animation-delay: 0.7s;"></span><span class="particle" style="top:57%; left:70%;width:8px; height:8px;animation-delay: 1s;"></span><span class="particle" style="top:45%; left:43%;width:9px; height:9px;animation-delay: 0.3s;"></span><span class="particle" style="top:48%; left:3%;width:11px; height:11px;animation-delay: 1.8s;"></span><span class="particle" style="top:49%; left:72%;width:8px; height:8px;animation-delay: 0s;"></span><span class="particle" style="top:40%; left:79%;width:11px; height:11px;animation-delay: 1.4s;"></span><span class="particle" style="top:49%; left:54%;width:11px; height:11px;animation-delay: 1.8s;"></span><span class="particle" style="top:49%; left:48%;width:8px; height:8px;animation-delay: 0.1s;"></span><span class="particle" style="top:58%; left:26%;width:8px; height:8px;animation-delay: 2s;"></span><span class="particle" style="top:41%; left:57%;width:10px; height:10px;animation-delay: 0.2s;"></span><span class="particle" style="top:66%; left:15%;width:11px; height:11px;animation-delay: 2s;"></span><span class="particle" style="top:60%; left:22%;width:10px; height:10px;animation-delay: 0.9s;"></span><span class="particle" style="top:40%; left:25%;width:12px; height:12px;animation-delay: 0.6s;"></span><span class="particle" style="top:62%; left:93%;width:8px; height:8px;animation-delay: 0.9s;"></span><span class="particle" style="top:47%; left:9%;width:10px; height:10px;animation-delay: 0.7s;"></span><span class="particle" style="top:43%; left:-2%;width:8px; height:8px;animation-delay: 0.8s;"></span><span class="particle" style="top:69%; left:2%;width:11px; height:11px;animation-delay: 1.8s;"></span><span class="particle" style="top:65%; left:9%;width:11px; height:11px;animation-delay: 2s;"></span><span class="particle" style="top:43%; left:22%;width:11px; height:11px;animation-delay: 0.8s;"></span><span class="particle" style="top:64%; left:37%;width:11px; height:11px;animation-delay: 1.8s;"></span><span class="particle" style="top:70%; left:84%;width:8px; height:8px;animation-delay: 1.1s;"></span></span> -->
<!-- 	</span> -->
	
<!-- 	<span class="textcontainer"> -->
<!-- 		<span class="particletext lines">Lines<span class="particle" style="top:16%; left:107%;width:2px; height:77%;animation-delay: -2.1s;"></span><span class="particle" style="top:23%; left:30%;width:1px; height:32%;animation-delay: -2.5s;"></span><span class="particle" style="top:1%; left:46%;width:2px; height:40%;animation-delay: -1.2s;"></span><span class="particle" style="top:15%; left:44%;width:2px; height:24%;animation-delay: -1.6s;"></span><span class="particle" style="top:-30%; left:0%;width:2px; height:80%;animation-delay: -1.2s;"></span><span class="particle" style="top:21%; left:67%;width:1px; height:26%;animation-delay: -2.7s;"></span><span class="particle" style="top:-24%; left:106%;width:3px; height:62%;animation-delay: -1.7s;"></span><span class="particle" style="top:-30%; left:95%;width:2px; height:24%;animation-delay: -0.9s;"></span><span class="particle" style="top:26%; left:103%;width:2px; height:39%;animation-delay: -0.3s;"></span><span class="particle" style="top:13%; left:87%;width:2px; height:66%;animation-delay: -1.3s;"></span><span class="particle" style="top:-17%; left:32%;width:2px; height:30%;animation-delay: -2.9s;"></span><span class="particle" style="top:24%; left:25%;width:3px; height:76%;animation-delay: -2.4s;"></span><span class="particle" style="top:12%; left:11%;width:2px; height:61%;animation-delay: -1.6s;"></span><span class="particle" style="top:9%; left:99%;width:1px; height:51%;animation-delay: -3s;"></span><span class="particle" style="top:12%; left:41%;width:1px; height:74%;animation-delay: -2.6s;"></span><span class="particle" style="top:22%; left:43%;width:3px; height:42%;animation-delay: -0.8s;"></span><span class="particle" style="top:5%; left:15%;width:1px; height:56%;animation-delay: -0.5s;"></span><span class="particle" style="top:5%; left:52%;width:1px; height:26%;animation-delay: -2.4s;"></span><span class="particle" style="top:1%; left:108%;width:1px; height:75%;animation-delay: -2.2s;"></span><span class="particle" style="top:1%; left:101%;width:1px; height:76%;animation-delay: -1.1s;"></span><span class="particle" style="top:-21%; left:94%;width:2px; height:54%;animation-delay: -1.4s;"></span><span class="particle" style="top:-27%; left:36%;width:2px; height:71%;animation-delay: -2.9s;"></span></span> -->
<!-- 	</span> -->
	
	
<jsp:include page="/layout/footer.jsp" />
</body>
</html>