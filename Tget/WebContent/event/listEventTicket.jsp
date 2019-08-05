<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="EUC-KR">
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
	
	var videoList = [];
	var i=0;
	var newURL = window.location.protocol + "//" + window.location.host +  window.location.pathname;

	$(function(){
		
		$.ajax(
				{
					url : "/event/rest/getPopularEventList",
					method : "POST",
					dataType : "json",
					success : function(JSONData, status){
// 							alert(status);
							recommSize = JSONData.recommEventlistSize;
							$.each(JSONData.eventNameList, function(index,value){
								if(value=="${event.eventName}"){
									$("#title").append("<span class='neon' style='font-weight:bold;font-size:23px'>HOT</span>");
// 									$("#title").attr("class","neon");
								}
							});
					}
		});
		
		$.ajax(
				{
					url : "/event/rest/getYoutubeList",
					method : "POST",
					data:{
						eventName : "${event.eventName}"
					},
					dataType : "json",
					success : function(JSONData, status){
// 							alert(status);
							$.each(JSONData.youtubeList, function(index,value){
								videoList[index] = value;
// 								alert(value);
							});
// 							alert(videoList.length);
					}
		});
		


		if ("${!empty user}") {
			$.ajax(
					{
						url : "/event/rest/getInterestedEventList/"+$("#eventId").val(),
						method : "POST",
						dataType : "json",
						success : function(JSONData, status){
	 						if (JSONData.isInterestedEvent == true) {
								$(".interested").html('<input type="hidden"  value="heart">'
										+'<ion-icon name="heart" size="large"></ion-icon>');
								
								$("div.particletext").append('<span class="particle interestedHeart" style="top:61%; left:26%;width:8px; height:8px;animation-delay: 2.5s;"></span><span class="particle" style="top:31%; left:70%;width:9.6px; height:9.6px;animation-delay: 1.5s;"></span><span class="particle" style="top:32%; left:48%;width:11.6px; height:11.6px;animation-delay: 1.2s;"></span><span class="particle" style="top:61%; left:33%;width:9.2px; height:9.2px;animation-delay: 0.9s;"></span><span class="particle" style="top:75%; left:86%;width:6.4px; height:6.4px;animation-delay: 1.2s;"></span><span class="particle" style="top:43%; left:74%;width:10.5px; height:10.5px;animation-delay: 0.8s;"></span><span class="particle" style="top:25%; left:10%;width:7.9px; height:7.9px;animation-delay: 2.6s;"></span><span class="particle" style="top:39%; left:2%;width:6.9px; height:6.9px;animation-delay: 0s;"></span><span class="particle" style="top:46%; left:73%;width:10.6px; height:10.6px;animation-delay: 3s;"></span><span class="particle" style="top:20%; left:86%;width:9.4px; height:9.4px;animation-delay: 2s;"></span><span class="particle" style="top:35%; left:45%;width:6.8px; height:6.8px;animation-delay: 2.3s;"></span><span class="particle" style="top:62%; left:41%;width:11.7px; height:11.7px;animation-delay: 0.7s;"></span><span class="particle" style="top:23%; left:59%;width:10.2px; height:10.2px;animation-delay: 1.7s;"></span><span class="particle" style="top:42%; left:66%;width:6.9px; height:6.9px;animation-delay: 0.2s;"></span></span>');

	 						}								
						},
						error : function(request, status, error ) {   
//	 					 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}			
				});	
		}
		
		$("#deleteYoutube").on("click",function(){
			var temp=parseInt($("#youtubeVideoId").val());
// 			alert(videoList[temp]);
			$.ajax(
     				{
     					url : "/event/rest/deleteYoutubeVideo/ "+videoList[temp],
     					method : "POST",
     					data : {
     						eventName : $("#eventName").val()
     					},
     					dataType : "json",
     					success : function(JSONData, status){
     						alert("삭제가 완료되었습니다.");
//	     						alert("JSONData : \n"+JSONData.youtubeListByName);		
     					}	    		
     		 });
		});
		
		$("#prevYoutube").on("click",function(){			
			var temp=parseInt($("#youtubeVideoId").val());
// 			alert(temp);
			if (temp==0) {
				alert("첫 영상입니다.");
			} else {
				$("#youtubeVideoId").val(temp-1);
				$("#youtubeVideoPlayer").attr("src","https://www.youtube.com/embed/"+videoList[temp-1]);
			}
		});
		
		$("#nextYoutube").on("click",function(){
// 			alert($("#youtubeVideoId").val());
			var temp=parseInt($("#youtubeVideoId").val());
			if (temp==videoList.length-1) {
				alert("마지막 영상입니다.");
			} else {
				$("#youtubeVideoId").val(temp+1);
				$("#youtubeVideoPlayer").attr("src","https://www.youtube.com/embed/"+videoList[temp+1]);
			}
		});

		
		$("button.addTran").on("click",function(){
			if ("${empty user}"=="true") {
				alert("로그인을 해주세요.");
				$("form").attr("method" , "GET").attr("action" , "/user/login").submit();
			} else {
				$("#ticketNo").val($(this).val());
				$("form").attr("method" , "GET").attr("action" , "/tran/addTran?ticketNo="+ $(this).val()).submit();
			}

		});
		
		$(".getSellerEstimation").on("click",function(){
// 			alert($(this).children().val());
// 			nickName = $(this).parent().children("input[type='hidden']").val();
// 			$("#sellerId").val($(this).val());
// 			self.location = "/rnp/getSellerEstimationList?sellerId="+$(this).val();
			$("form").attr("method" , "POST").attr("action" , "/rnp/getSellerEstimationList?sellerId="+$(this).children().val()).submit();
		});
		
		$(".interested").on("click",function(){
			i = parseInt($("#interestedCount").val());
			
			if ("${empty user}"=="true") {
				alert("로그인을 해주세요.");
				$("form").attr("method" , "GET").attr("action" , "/user/login").submit();
				
			} else {
				if($(this).children("input").val() == 'heart-empty') {
					$(this).html('<input type="hidden"  value="heart">'
							+'<ion-icon name="heart" size="large"></ion-icon>');
					
					$.ajax(
							{
								url : "/event/rest/addInterestedEvent/"+$("#eventId").val(),
								method : "POST",
								dataType : "json",
								success : function(JSONData, status){
									alert("관심이벤트 등록완료");							
									$("div.particletext").append('<span class="particle interestedHeart" style="top:61%; left:26%;width:8px; height:8px;animation-delay: 2.5s;"></span><span class="particle" style="top:31%; left:70%;width:9.6px; height:9.6px;animation-delay: 1.5s;"></span><span class="particle" style="top:32%; left:48%;width:11.6px; height:11.6px;animation-delay: 1.2s;"></span><span class="particle" style="top:61%; left:33%;width:9.2px; height:9.2px;animation-delay: 0.9s;"></span><span class="particle" style="top:75%; left:86%;width:6.4px; height:6.4px;animation-delay: 1.2s;"></span><span class="particle" style="top:43%; left:74%;width:10.5px; height:10.5px;animation-delay: 0.8s;"></span><span class="particle" style="top:25%; left:10%;width:7.9px; height:7.9px;animation-delay: 2.6s;"></span><span class="particle" style="top:39%; left:2%;width:6.9px; height:6.9px;animation-delay: 0s;"></span><span class="particle" style="top:46%; left:73%;width:10.6px; height:10.6px;animation-delay: 3s;"></span><span class="particle" style="top:20%; left:86%;width:9.4px; height:9.4px;animation-delay: 2s;"></span><span class="particle" style="top:35%; left:45%;width:6.8px; height:6.8px;animation-delay: 2.3s;"></span><span class="particle" style="top:62%; left:41%;width:11.7px; height:11.7px;animation-delay: 0.7s;"></span><span class="particle" style="top:23%; left:59%;width:10.2px; height:10.2px;animation-delay: 1.7s;"></span><span class="particle" style="top:42%; left:66%;width:6.9px; height:6.9px;animation-delay: 0.2s;"></span></span>');
//	 								alert("JSONData : \n"+JSONData.stringify());		
								}
//	 						,
//	 							error : function(request, status, error ) {   
//	 							 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
//	 							}			
						});	
// 					$("#interestedCount").val(i+1);
// 					$("#interestedCount").parent("div").text(i+"명");				
				}else{
					$(this).html('<input type="hidden"  value="heart-empty">'
							+'<ion-icon name="heart-empty" size="large"></ion-icon>');
					$("span.particle").remove();
					$.ajax(
							{
								url : "/event/rest/deleteInterestedEvent/"+$("#eventId").val(),
								method : "POST",
								dataType : "json",
								success : function(JSONData, status){
									alert("관심이벤트 삭제완료");									
// 									if (i == 1 || i =="1") {
// 										$("#interestedCount").val("0");
// 										$("#interestedCount").parent("div").text("0");			
// 									} else {
// 										$("#interestedCount").val(i-1);
// 										$("#interestedCount").parent("div").text(i);			
// 									}															
								}
//	 						,
//	 							error : function(request, status, error ) {   
//	 							 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
//	 							}			
						});	
				}
			}			
		});
		
		
			$("#kakaoSendToMe").on("click",function(){
// 				alert($("#eventId").val());
				$.ajax( 
						{
							url : "/event/rest/kakaoSendToMe",
							method : "GET" ,
							data : {
								
								requestUrl : newURL+"?eventIds="+$("#eventId").val(),
								eventId : $("#eventId").val()
							},
							dataType : "json" ,							
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
								alert(JSONData);
							}
					});
			})
	       
	       $( "#twitter" ).on("click" , function() {
	           window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20'
	        		   +encodeURIComponent(document.URL)+'%20-%20'
	        		   +encodeURIComponent(document.title), 
	        		   'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=500,width=600');
	         });      
	     
	      $( "#facebook" ).on("click" , function() {
	           window.open('https://www.facebook.com/sharer/sharer.php?u=' 
	        		   +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');
	         });         
	      
// 	      $( "#kakao" ).on("click" , function() {
// 	         sendLinkKakao()
// 	      }); 

		$(".coupon1").attr("class", "flux coupon1");
		
		$("button.close").on("click" , function() {
			$("#inputKeyword").val("");
	    });         
		
	});
// 	var tag = document.createElement('script');

//     tag.src = "https://www.youtube.com/iframe_api";
//     var firstScriptTag = document.getElementsByTagName('script')[3];
//     firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

//     // 3. This function creates an <iframe> (and YouTube player)
//     //    after the API code downloads.
//     var player;
//     function onYouTubeIframeAPIReady() {
//       player = new YT.Player('player', {
//         height: '250',
//         width: '400',
//         videoId: '${videoId}',
//         events: {
//           'onReady': onPlayerReady,
//           'onStateChange': onPlayerStateChange
//         }
//       });
//     }

//     // 4. The API will call this function when the video player is ready.
//     function onPlayerReady(event) {
//       event.target.playVideo();
//     }

//     // 5. The API calls this function when the player's state changes.
//     //    The function indicates that when playing a video (state=1),
//     //    the player should play for six seconds and then stop.
//     var done = false;
//     function onPlayerStateChange(event) {
//       if (event.data == YT.PlayerState.PLAYING && !done) {
//         setTimeout(stopVideo, 600000);
//         done = true;
//       }
//     }
//     function stopVideo() {
//       player.stopVideo();
//     }
    
   
	</script>
	
	<style>
		body{
			background-color: #EBF7FF;
			color: #041625;
		}
	
		#footer{
		background-color: #1B1B1F ;
		}
		
		a, hr{
				color: #FBFCFE ;	
		}			
        	
		div.border{ 
			background-color : white; 
			color:  #041625;
			margin-top:20px;
 		}		
		div.border:hover{
			background-color : #EBF7FF; 
		}		
        
        .getSellerEstimation:hover{
        	font-size:25px;
        }

        #player { /**/
         	padding: 10px 10px; /**/
				padding: 25px 25px 25px  25px ;
     	  }
		.interested{
			color : red;
		}
		
		
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
/*   		.modal-wrap{ */
/* 			width:100%; */
/* 			margin:auto; */
/* 			max-width:525px; */
/*  			position:relative;  */
/* 			background-color: black; */
/* 			background:url(/resources/images/logins.jpg) no-repeat center; */
/* 			box-shadow:0 12px 15px 0 rgba(0,0,0,.24),0 17px 50px 0 rgba(0,0,0,.19); */
/* 			overflow:auto; */
/* 		} */
/* 		.modal-html{ */
/* 			background:rgba(40,57,101,.9);			 */
/* 		} */
  	
    </style>
</head>

<body>
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<jsp:include page="/layout/tgetHeader.jsp" />
<!-- 	<div class="textcontainer"> -->
		
<!-- 	</div> -->
<!-- 	<form name="searchEvent"> -->
<!-- 			<div id="tgetHeader" class="text-center"> -->
<!-- 			<br/><br/><br/> -->
<%-- 				<input type="hidden"  id="category" name="category"  value="${!empty category? category : ''}" > --%>
<%-- 				<input type="hidden"  id="searchKeyword" name="searchKeyword"  placeholder="searchKeyword" value="${!empty search.searchKeyword? search.searchKeyword : ''}" > --%>
<%-- 				<input type="hidden"  id="searchCondition" name="searchCondition"  placeholder="searchCondition" value="${!empty search.searchCondition? search.searchCondition : ''}" > --%>
<!-- 				<div class="row"><div class="col-lg-3  col-md-3 col-1"></div> -->
<!-- 				<div class="col-lg-6 col-md-6 col-10">	 -->
<!-- 					<div class="input-group mb-1"> -->
<!-- 				  		<input type="text" class="form-control" placeholder="이벤트명을 입력하세요"  aria-describedby="basic-addon2"> -->
<!-- 				  		<div class="input-group-append"> -->
<!-- 				    		<span class="input-group-text btn"  id="button-addon2">검색</span> -->
<!-- 				 		 </div> -->
<!-- 					</div> -->
<!-- 					<div class="col-lg-3 col-md-3 col-1"></div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<%-- 			<input type="hidden"  id="requestPageToken" name="requestPageToken"  value="${!empty requestPageToken? requestPageToken : ''}"/><br/> --%>
<!-- 		</div> -->
<!-- 	</form> -->
	
	<form name="main">	
		<div class="particletext hearts ">
			
			<div class="container" align="center">
				<input type="hidden" id="eventId" name="eventId" value="${event.eventId}">
				<input type="hidden" id="eventName" name="eventName" value="${event.eventName }">
				<input type="hidden" id="koName" name="koName" value="${event.koName }">
				<input type="hidden" id="eventImage" name="eventImage" value="${event.eventImage }">		
				
				<div class="row" >		
					<div class="col-lg-8 col-md-8 col-8"></div>
					<div class="col-lg-2 col-md-2 col-2">
		<%-- 				<div style="font-size: 10px">${interestedCount}</div> --%>
						<div class="interested"  value="heart-empty" align="right">
							<input type="hidden"  value="heart-empty">
							<ion-icon name="heart-empty" size="large"></ion-icon>					
						</div>
						<div align="right" style="font-size: 10px; color: black;" >
							<input type="hidden" id="interestedCount" name="interestedCount" value="${interestedCount}"/>
							
						</div>
					 </div>			
					 <div class="col-lg-2 col-md-2 col-2 dropdown" >
						<div  align="left" class=" dropdown-toggle" id="dropdownMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<ion-icon name="share" size="large"></ion-icon>
						</div>
						<div class="dropdown-menu" aria-labelledby="dropdownMenu">
						    <h6 class="dropdown-header">공유하기</h6>
		<!-- 					<a class="dropdown-item" href="#">Action</a> -->
		<!-- 					<a class="dropdown-item" href="#">Another action</a> -->
							<a class="dropdown-item"  href="#"  id="twitter"  title="트위터로 공유"><img src="/resources/images/twitter.png" style="width:30px">트위터 공유</a>
		    		    	<a class="dropdown-item"  href="#" id="facebook" title="페이스북으로 공유"><img src="/resources/images/facebook.png" style="width:30px">페이스북 공유</a>
		    	   			<a class="dropdown-item"  href="#"  id="kakaoSendToMe" title="카카오톡으로 공유"> <img src="/resources/images/kakaotalk.png"  style="width:30px">나에게 보내기</a>	
						</div>
					</div>			
				</div>		
				
				<div class="container">
					<div class="row" align="center">			
						<div class="col-lg-5 " >
							<div class="sticky-top">
								<div class="textcontainer">
									<h1><span id="title">${!empty event.koName? event.koName:event.eventName }</span></h1>
								</div>
								<div>
									<input type="hidden" id="youtubeVideoId" value="0"> 
								
<!-- 								<div id="player"></div> <br/> -->
									<iframe id="youtubeVideoPlayer" width="400" height="250" src="https://www.youtube.com/embed/${videoId }" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen value="${videoId }"></iframe>
								</div>
								<br/>
								<span style="margin:20px;"   id="prevYoutube"><ion-icon name="arrow-round-back"  size="large"></ion-icon></span>
								<span style="margin:20px;" id="deleteYoutube"><ion-icon name="remove-circle-outline"  size="large"></ion-icon></span>
								<span style="margin:20px;"  id="addYoutube" name="addYoutube" data-toggle="modal"  						
										 data-target="#exampleModalCenter">
								<ion-icon name="add-circle-outline"  size="large"></ion-icon>
								</span>
								<span style="margin:20px;" id="nextYoutube"><ion-icon name="arrow-round-forward"  size="large"></ion-icon></span>
								<br/><br/>
								${!empty event.koLocation? event.koLocation: event.eventLocation}<br/>
								${event.eventDate } &nbsp; 
								${event.eventTimeStr}<br/><br/><br/>
		
			
							</div>				
						</div>
						
						<div class="col-lg-7 ">
							<div class="row" align="center">
								<div class="col-lg-3"></div>
								<div class="col-lg-6" align="center"><h4>총 ${totalTicketCount}건</h4></div>
								<div class="col-lg-3"></div>
							</div><br/>
											
							<section id="section-topline-1" align="center">
								<div class="row" align="center">	
									<c:forEach var="i" items="${ticketList}" >			
										<c:if test="${i.couponCode == 0 }">	
										<c:if test="${i.amount != 0 }">												
										<div class="col-lg-6">
											<div class="text-center">
												<div class="border ">
										 			<br/>
										 			<h5  class="coupon${i.couponCode }"><strong>
										 				<a  class="getSellerEstimation">
										 					<input type="hidden" value="${i.seller.userId}">
										 					${i.seller.nickName}
										 				</a>
										 			</strong><small>(총 ${i.amount }장)</small></h5>
										 			<hr/>								 
										 			<div  align="center" style="margin-left:10%;margin-right:10%">	
													 	<div class="list" align="left">
															<ion-icon name="checkmark"></ion-icon>가격
															<span class="coupon${i.couponCode }">${i.price }원(per ticket)</span>
															<ion-icon name="checkmark"></ion-icon>티켓타입
															<div class="coupon${i.couponCode }">
																<c:if test="${i.type == 0}">
																	종이티켓
																</c:if>
																<c:if test="${i.type == 1 }">
																	전자티켓
																</c:if> 
															</div>
															<ion-icon name="checkmark"></ion-icon>
															구역 정보
															<div  class="coupon${i.couponCode }">${i.seat }</div>
															<ion-icon name="checkmark"></ion-icon>													
															특이사항
															<div  class="coupon${i.couponCode }">${i.options }</div>
														</div>		
													</div>	
													<div class="list" align="right">
														<c:if test="${i.seller.userId!=user.userId}">
															<button class="btn  btn-light addTran "  value="${i.ticketNo}" style="margin:10px;">구매하기</button> &nbsp; &nbsp;
														</c:if>					
													</div>
												</div><!-- border -->	
											 </div>									
											</div><!-- col-md-6 -->		
											<div><small></small></div>
											<div><small></small></div><br/>
											</c:if>
											</c:if>
										</c:forEach>
										
										<c:forEach var="i" items="${ticketList}" >			
										<c:if test="${i.couponCode != 0 }">		
										<c:if test="${i.amount != 0 }">											
										<div class="col-lg-6">
											<div class="text-center">
												<div class="border ">
										 			<br/>
										 			<h5  class="coupon${i.couponCode }"><strong>
										 				<a  class="getSellerEstimation">
										 					<input type="hidden" value="${i.seller.userId}">
										 					${i.seller.nickName}
										 				</a>
										 			</strong><small>(총 ${i.amount }장)</small></h5>
										 			<hr/>								 
										 			<div  align="center" style="margin-left:10%;margin-right:10%">	
													 	<div class="list" align="left">
															<ion-icon name="checkmark"></ion-icon>가격<br/>
															<span class="coupon${i.couponCode }">${i.price }원(per ticket)</span><br/><br/>
															<ion-icon name="checkmark"></ion-icon>티켓타입<br/>
															<div class="coupon${i.couponCode }">
																<c:if test="${i.type == 0}">
																	종이티켓
																</c:if>
																<c:if test="${i.type == 1 }">
																	전자티켓
																</c:if> 
															</div>
															<br/><br/>
															<ion-icon name="checkmark"></ion-icon>
															구역 정보<br/>
															<div  class="coupon${i.couponCode }">${i.seat }</div><br/><br/>
															<ion-icon name="checkmark"></ion-icon>													
															특이사항<br/>
															<div  class="coupon${i.couponCode }">${i.options }</div><br/><br/>
														</div>		
													</div>	
													<div class="list" align="right">
													<c:if test="${i.seller.userId!=user.userId}">
														<button class="btn  btn-light addTran "  value="${i.ticketNo}" style="margin:10px;">구매하기</button> &nbsp; &nbsp;
													</c:if>					
												</div>
											</div><!-- border -->	
										 </div>									
										</div><!-- col-md-6 -->		
										<div><small></small></div>
										<div><small></small></div><br/>
										</c:if>
										</c:if>
									</c:forEach>
								</div><!-- row -->
							</section>					
						</div>	<!-- col-lg-6 -->
					</div><!-- row -->		  
				</div><!-- container-fluid -->					
			</div><!-- row -->
			<input type="hidden"  id="ticketNo" name="ticketNo"/>		
			
<!-- 			<span class="particle" style="top:61%; left:26%;width:8px; height:8px;animation-delay: 2.5s;"></span><span class="particle" style="top:31%; left:70%;width:9.6px; height:9.6px;animation-delay: 1.5s;"></span><span class="particle" style="top:32%; left:48%;width:11.6px; height:11.6px;animation-delay: 1.2s;"></span><span class="particle" style="top:61%; left:33%;width:9.2px; height:9.2px;animation-delay: 0.9s;"></span><span class="particle" style="top:75%; left:86%;width:6.4px; height:6.4px;animation-delay: 1.2s;"></span><span class="particle" style="top:43%; left:74%;width:10.5px; height:10.5px;animation-delay: 0.8s;"></span><span class="particle" style="top:25%; left:10%;width:7.9px; height:7.9px;animation-delay: 2.6s;"></span><span class="particle" style="top:39%; left:2%;width:6.9px; height:6.9px;animation-delay: 0s;"></span><span class="particle" style="top:46%; left:73%;width:10.6px; height:10.6px;animation-delay: 3s;"></span><span class="particle" style="top:20%; left:86%;width:9.4px; height:9.4px;animation-delay: 2s;"></span><span class="particle" style="top:35%; left:45%;width:6.8px; height:6.8px;animation-delay: 2.3s;"></span><span class="particle" style="top:62%; left:41%;width:11.7px; height:11.7px;animation-delay: 0.7s;"></span><span class="particle" style="top:23%; left:59%;width:10.2px; height:10.2px;animation-delay: 1.7s;"></span><span class="particle" style="top:42%; left:66%;width:6.9px; height:6.9px;animation-delay: 0.2s;"></span></span> -->
		
		</div>
	</form>
	
	

	
	
	
	
	
	<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"  
aria-labelledby="exampleModalCenterTitle" aria-hidden="true" style="margin-top:40px">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content"  style="background-color:#F8FFFF; color: #041625;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">유튜브 동영상 등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <jsp:include page="/event/listYoutubeSearch.jsp" />
<%-- 		<input type="file" class="form-control" id="file" name="file" value="${!empty eventImage? eventImage : ''}"><br/><br/> --%>
      </div>
      <div class="modal-footer">       
<!--         <button type="button" class="btn btn-light"  id="delete" >삭제</button> -->
<!--         <button type="button" class="btn btn-light"  id="submit" >저장</button> -->
         <button type="button" class="btn btn-outline-dark" data-dismiss="modal">닫기</button>
      </div>
    </div>
    </div>
</div>


	<jsp:include page="/layout/footer.jsp" />
</html>