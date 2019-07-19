<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	
	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet">
		
<title>Searching Youtube Video</title>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<script type="text/javascript">
	
		var tag = document.createElement('script');
	
	    tag.src = "https://www.youtube.com/iframe_api";
	    var firstScriptTag = document.getElementsByTagName('script')[3];
	    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
	
	    // 3. This function creates an <iframe> (and YouTube player)
	    //    after the API code downloads.
	    var player;
	    function onYouTubeIframeAPIReady() {
	      player = new YT.Player('player', {
	        height: '260',
	        width: '460',
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
	        setTimeout(stopVideo, 6000);
	        done = true;
	      }
	    }
	    function stopVideo() {
	      player.stopVideo();
	    }
	    
	    $(function(){
	    	$("button:contains('뒤로가기')").on("click",function(){
	  			$("form").attr("method" , "POST").attr("action" , "/event/addYoutubeVideo").submit();
// 	  		  javascript:history.go(-1);
	  		});   
	    	
	    	$("button:contains('등록하기')").on("click",function(){
// 	    		alert($("#eventName").val());
	    		$.ajax(
	     				{
	     					url : "/event/rest/addYoutubeVideo/ "+$("#videoId").val(),
	     					method : "POST",
	     					data : {
	     						eventName : $("#eventName").val()
	     					},
	     					dataType : "json",
	     					success : function(JSONData, status){
	     						alert("등록완료");
// 	     						alert("JSONData : \n"+JSONData.youtubeListByName);		
	     					}	    		
	     		 });	
// 	  			$("form").attr("method" , "POST").attr("action" , "/event/rest/addYoutubeVideo/"+$("#videoId").val()).submit();
	  		});   
	    });		
	</script>
	<style type="text/css">
		@media (max-width: 500px) {
			
		}
	 div.container{
	 	padding: 20px;
	 	font-family: 'Sunflower', sans-serif;
	 	font-size: 15px;   
	 	width: 500px;
	 }
	 #player{
	 	padding: 20px 0px 0px 0px ;
	 }
	 .button_black{
	 		width: 200;
	 		height: 40px;
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
		h5{
			font-weight: bold;
		}
	</style>
</head>

<body>

<form>
	<div class="container" >
		<input type="hidden" id="videoId" name="videoId" value="${youtubeVideo.videoId}"/>
		<input type="hidden" id="eventName" name="eventName" value="${eventName}"/>
		<input type="hidden" id="searchKeyword" name="searchKeyword" value="${!empty searchKeyword? searchKeyword : ''}"  >
		<input type="hidden" id="requestPageToken" name="requestPageToken" value="${!empty requestPageToken? requestPageToken:'' }"/>
		<h5>${youtubeVideo.title}</h5>
		<div id="player"></div> <br/><br/>
		<div align="center">
			<div class="row" >
				<div class="col-sm-1 "></div>
				<div class="col-sm-3"  align="left"><button class="button_black">뒤로가기</button></div>
				<div class="col-sm-4 ">
<!-- 					 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  -->
					
				</div>
				<div class="col-sm-3"  align="right"><button class="button_black">등록하기</button></div>
				<div class="col-sm-1"></div>
				<br/><br/><br/>
				<div align="left">${youtubeVideo.description}</div>	
			</div>		
		</div>
	</div>
</form>

</body>
</html>