<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="EUC-KR">
	<title>TicketList</title>
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	
	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet">
	
	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/jquery.scrolly.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- KAKAO -->
<!--    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> -->
	<script type="text/javascript">
	
	var videoList = [];
	var i=0;
	var newURL = window.location.protocol + "//" + window.location.host +  window.location.pathname;

	$(function(){
		
		$.ajax(
				{
					url : "/event/rest/getInterestedEventList/"+$("#eventId").val(),
					method : "POST",
					dataType : "json",
					success : function(JSONData, status){
 						if (JSONData.isInterestedEvent == true) {
							$(".interested").html('<input type="hidden"  value="heart">'
									+'<ion-icon name="heart" size="large"></ion-icon>');
						}								
					},
					error : function(request, status, error ) {   
// 					 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}			
			});	

		$("#addYoutube").on("click",function(){
			if ("${empty user}"=="true") {
				alert("로그인을 해주세요.");
				$("form").attr("method" , "GET").attr("action" , "/user/login").submit();
			} else {
				popWin = window.open("/event/addYoutubeVideo?requestPageToken=&eventName="+$("#eventName").val(),
						"popWin",
						"left=500, top=100, width=600, height=600, "
						+"marginwidth=0, marginheight=0, scrollbars, scrolling, menubar=no, resizable");
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
// 			$("#ticketNo").val($(this).val());
// 			$("form").attr("method" , "GET").attr("action" , "/tran/addTran?ticketNo="+ $(this).val()).submit();
// 			self.location = "/tran/addTran?ticketNo="+$(this).val();

		});
		
		$("button.getSellerEstimation").on("click",function(){
// 			nickName = $(this).parent().children("input[type='hidden']").val();
// 			$("#sellerId").val($(this).val());
// 			self.location = "/rnp/getSellerEstimationList?sellerId="+$(this).val();
			$("form").attr("method" , "POST").attr("action" , "/rnp/getSellerEstimationList?sellerId="+$(this).val()).submit();
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
					
					$.ajax(
							{
								url : "/event/rest/deleteInterestedEvent/"+$("#eventId").val(),
								method : "POST",
								dataType : "json",
								success : function(JSONData, status){
									alert("관심이벤트 삭제완료");									
									if (i == 1 || i =="1") {
										$("#interestedCount").val("0");
										$("#interestedCount").parent("div").text("0");			
									} else {
										$("#interestedCount").val(i-1);
										$("#interestedCount").parent("div").text(i);			
									}															
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
								accessToken : "DbusJL3wDmeTRuZqdufu9HGYrhefWSX0uhWYTgopyNgAAAFrz7PoTA",
								requestUrl : newURL+"?eventId="+$("#eventId").val(),
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
	      
	      $( "#kakao" ).on("click" , function() {
	         sendLinkKakao()
	      }); 
	});
	var tag = document.createElement('script');

    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[3];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    // 3. This function creates an <iframe> (and YouTube player)
    //    after the API code downloads.
    var player;
    function onYouTubeIframeAPIReady() {
      player = new YT.Player('player', {
        height: '250',
        width: '400',
        videoId: '${videoId}',
        events: {
          'onReady': onPlayerReady,
          'onStateChange': onPlayerStateChange
        }
      });
    }

    // 4. The API will call this function when the video player is ready.
    function onPlayerReady(event) {
      event.target.playVideo();
    }

    // 5. The API calls this function when the player's state changes.
    //    The function indicates that when playing a video (state=1),
    //    the player should play for six seconds and then stop.
    var done = false;
    function onPlayerStateChange(event) {
      if (event.data == YT.PlayerState.PLAYING && !done) {
        setTimeout(stopVideo, 600000);
        done = true;
      }
    }
    function stopVideo() {
      player.stopVideo();
    }
    
	</script>
	
	<style>
      div.container {
/* */         	margin-top: 50px;
/*         	font-family: 'Shadows Into Light', 'Nanum pen Script', cursive; */
/*         	font-size: 25px; */
        }
        table{
        	margin-top: 50px;
        	font-size: 20px;
        }
        
        .col-md-5 {
        	font-family: 'Sunflower', sans-serif;
	 		font-size: 20px;
        }
        
       #player {
        	padding: 10px 10px;
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
		
		.interested{
			color : red;
		}
		div.list{
			padding : 0px 20px;
		}
    </style>
</head>

<body>
<jsp:include page="/layout/tgetToolbar.jsp" />
<form>
	
	<div class="container" align="center">
	<input type="hidden" id="eventId" name="eventId" value="${event.eventId}"/>
	<input type="hidden" id="eventName" name="eventName" value="${event.eventName }"/>
	<input type="hidden" id="koName" name="koName" value="${event.koName }"/>
	<input type="hidden" id="eventImage" name="eventImage" value="${event.eventImage }"/>
		<div class="row" style="padding-top: 30px">
			<div class="col-lg-8 col-md-8 col-8"></div>
			<div class="col-lg-2 col-md-2 col-2">
<%-- 				<div style="font-size: 10px">${interestedCount}</div> --%>
				<div class="interested"  value="heart-empty" align="right">
					<input type="hidden"  value="heart-empty">
					<ion-icon name="heart-empty" size="large"></ion-icon>					
				</div>
				<div align="right" style="font-size: 10px; color: black;" >
					<input type="hidden" id="interestedCount" name="interestedCount" value="${interestedCount}"/>
					${interestedCount}</div>
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
		
		<div class="row">
			<div class="col-lg-6 col-sm-12 col-xs-12" >
				<h1>${!empty event.koName? event.koName:event.eventName }</h1><br/>
				<div id="player"></div> <br/>
				<div><button class="button_black" id="addYoutube" name="addYoutube" >동영상 등록</button><br/><br/></div>
				${!empty event.koLocation? event.koLocation: event.eventLocation}<br/>
				${event.eventDate } &nbsp; 
				${event.eventTimeStr}<br/><br/><br/>
			</div>
			<div class="col-lg-6 col-sm-12 col-xs-12">

			<table class="table table-striped">
					  <thead>
					    <tr align="center">
					      <th scope="col"><h4>총 ${totalTicketCount}건</h4></th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach items="${ticketList }" var="i">
					    <tr>
					      <td>
							<div class="list" align="left">
<%-- 								ticketNo : ${i.ticketNo }<br/> --%>
								총 ${i.amount }장, 장당 ${i.price }원
								(<c:if test="${i.type == 0}">
									종이티켓
								</c:if>
								<c:if test="${i.type == 1 }">
									전자티켓
								</c:if> )
								<br/>
								구역 정보 : ${i.seat }<br/>
								특이사항 : ${i.options }<br/>
								쿠폰 : 
								<c:if test="${empty i.couponCode }">
									미사용
								</c:if>
								<c:if test="${i.couponCode == 0 }">
									강조권
								</c:if>
								<c:if test="${i.couponCode == 1 }">
									상단출력
								</c:if><br/><br/>								
							</div>			
							<div class="list" align="right">
<%-- 								<input type="hidden"  value="${i.seller.nickName}"/> --%>
								<c:if test="${i.seller.userId!=user.userId}">
									<button class="button_black addTran"  value="${i.ticketNo}">구매하기</button> &nbsp; &nbsp;
								</c:if>								
								<button class="button_black getSellerEstimation" value="${i.seller.userId}">판매자조회</button><br/>
							</div>
					  		</td>
				  	 	 </tr>
						</c:forEach>
			  		</tbody>
				</table>		
				<input type="hidden"  id="ticketNo" name="ticketNo"/>		
<!-- 				<a href="#"  id="twitter"  title="트위터로 공유"><img src="/resources/file/others/twitter.png"></a> -->
<!--     		    <a href="#" id="facebook" title="페이스북으로 공유"><img src="/resources/file/others/facebook.png"></a> -->
<!--     	   		<a href="#"  id="kakaoSendToMe" title="카카오톡으로 공유"> <img src="/resources/file/others/kakao.png" ></a>	 -->
			</div>
		</div>
	</div>
</form>
<jsp:include page="/layout/footer.jsp" />
</body>
</html>