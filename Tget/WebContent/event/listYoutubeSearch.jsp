<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> -->
<!-- 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
<!-- 	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	 -->
<!-- 	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet"> -->
		
<!-- <title>Searching Youtube Video</title> -->

<!-- 	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> -->
<!-- 	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->
<!-- 	<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script> -->
<!-- 	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!-- 	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script> -->
	<script type="text/javascript">

	
	$(function(){
// 		alert("eventName : "+$("#eventName").val());
		$.ajax(
			{
				url : "/event/rest/getYoutubeSearchList?requestPageToken=",
				method : "POST",
				data : {
					searchKeyword : ""
				},
				dataType : "json",
				success : function(JSONData, status){
// 					alert(status);
// 					alert(JSONData.youtubeList);		
					$("#prevPageToken").val(JSONData.prevPageToken);
					$("#nextPageToken").val(JSONData.nextPageToken);
					$.each(JSONData.youtubeList, function(index,value){
// 						availableTags[index] = value;
						$("#h"+index).text(value.title);
						$("#img"+index).attr("src",value.thumbnails);
						$("#desc"+index).text(value.description);
						$("#button"+index).val(value.videoId );
					 });
					
				}		
		 });		
		
		$("#prevPageToken").on("click",function(){
			if ($(this).val() == "") {
				alert("첫번째 페이지 입니다.");
			}else{
				$("#requestPageToken").val($(this).val());			
				$("button:contains('검색')").click();
			}
		});
		
		$("#nextPageToken").on("click",function(){
			if ($(this).val() == "") {
				alert("마지막 페이지 입니다.");
			}else{
				$("#requestPageToken").val($(this).val());			
				$("button:contains('검색')").click();
			}
		});
		
		$("button[name='getYoutubePlayer']").on("click",function(){
			youtubeId = $(this).val();
			$("#searchList").attr("style","display : none;");
			$("#getYoutubePlayer").attr("style","display:block;");
			$("#getYoutubePlayer").children("iframe").attr("src","https://www.youtube.com/embed/"+youtubeId);
			$("#addThis").val(youtubeId);
// 			$(this).parent().parent().children("input[name='titleByList']").val();
// 			$(this).parent().parent().children("input[name='descriptionByList']").val();
// 			$("form").attr("method" , "POST").attr("action" , "/event/getYoutubePlayer?youtubeId="+$(this).val()).submit();
		});
		$("#back").on("click",function(){
			$("#searchList").attr("style","display:block;");
			$("#getYoutubePlayer").attr("style","display:none;");
		});
		
		$("#addThis").on("click",function(){
			$.ajax(
     				{
     					url : "/event/rest/addYoutubeVideo/ "+$("#addThis").val(),
     					method : "POST",
     					data : {
     						eventName : $("#eventName").val()
     					},
     					dataType : "json",
     					success : function(JSONData, status){
     						alert("등록완료");
//	     						alert("JSONData : \n"+JSONData.youtubeListByName);		
     					}	    		
     		 });	
		});
		
		$("#searchYoutubeSubmit").on("click",function(){
			$("#searchKeyword").val($("#inputKeyword").val());
			$.ajax(
					{
						url : "/event/rest/getYoutubeSearchList?requestPageToken="+$("#requestPageToken").val(),
						method : "GET",
						data : {
							searchKeyword : $("#searchKeyword").val()
						},
						dataType : "json",
						success : function(JSONData, status){
//		 					alert(status);
//		 					alert(JSONData.youtubeList);									
							$.each(JSONData.youtubeList, function(index,value){
//		 						availableTags[index] = value;
								$("#h"+index).text(value.title);
								$("#img"+index).attr("src",value.thumbnails);
								$("#desc"+index).text(value.description);
								$("#button"+index).val(value.videoId );
							 });
							$("#prevPageToken").val(JSONData.prevPageToken);
							$("#nextPageToken").val(JSONData.nextPageToken);
							$("#inputKeyword").focus();
						}		
				 });
		});
		
	});
	
	
	
// 	var tag = document.createElement('script');
	
//     tag.src = "https://www.youtube.com/iframe_api";
//     var firstScriptTag = document.getElementsByTagName('script')[3];
//     firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

//     // 3. This function creates an <iframe> (and YouTube player)
//     //    after the API code downloads.
//     var player;
//     var youtubeId;
//     function onYouTubeIframeAPIReady() {
//       player = new YT.Player('player', {
//         height: '260',
//         width: '460',
//         videoId: youtubeId,
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
//         setTimeout(stopVideo, 6000);
//         done = true;
//       }
//     }
//     function stopVideo() {
//       player.stopVideo();
//     }
	
	</script>
	<style type="text/css">
		
		td:hover{
			background-color : #041625; 
		}
		
		th, td, tr{
			color: #FBFCFE;		
			font-size:17px;
		}
		img{
			margin : 5px;
		}
		
		

	</style>
<!-- </head> -->

<!-- <body> -->

<div class="container" align="center"  id="searchList" >
<!-- 	 <div><h2 style="margin-top: 10px;">Searching</h2></div> -->
	<table class="table ">
<!-- 			<thead> -->
<!-- 			    <tr align="center"> -->
<!-- 					<th scope="col"> -->
			      
		<div class="input-group mb-3">
			<input type="hidden" id="searchKeyword" name="searchKeyword" value="${!empty search.searchKeyword? search.searchKeyword : ''}"/>
			<input type="text"  id="inputKeyword" class="form-control"  placeholder="검색어" 
			 aria-label="searchKeyword" aria-describedby="searchYoutubeSubmit">
			<div class="input-group-append">
		 		<button class="btn btn-outline-secondary" type="button" id="searchYoutubeSubmit">검색</button>
		 	</div>
		</div>		
<!-- 		</th> -->
<!-- 		</tr> -->
<!-- 	</thead> -->
	<tbody>
		
		<div class="row" >
		<ul class="list-unstyled">
			<tr id="tr0">
				<td align="left" >
				<li class="media" >
					<img id="img0" src="${i.thumbnails}"/>
			   		<div class="media-body">
			      		<h6 id="h0"  class="mt-0 mb-1" style="font-weight: bold;">${i.title}</h6>			      		
<%-- 			      		<input type="hidden" id="titleByList" name="titleByList" value="${i.title}"/> --%>
<%-- 			      		<input type="hidden" id="descriptionByList" name="descriptionByList" value="${i.description}"/> --%>
						 <div id="desc0">: ${i.description}</div> <br/>
						<div align="right">			
							<button name="getYoutubePlayer"  id="button0"
							type="button" class="btn btn-outline-light"  value="${i.videoId }">동영상보기</button><br/>
						</div>
			    	</div>
			 	 </li>
			   </td>
			</tr>
			<tr id="tr1">
				<td align="left" >
				<li class="media" >
					<img id="img1" src="${i.thumbnails}"/>
			   		<div class="media-body">
			      		<h6 id="h1" class="mt-0 mb-1" style="font-weight: bold;">${i.title}</h6>			      		
<%-- 			      		<input type="hidden" id="titleByList" name="titleByList" value="${i.title}"/> --%>
<%-- 			      		<input type="hidden" id="descriptionByList" name="descriptionByList" value="${i.description}"/> --%>
						 <div id="desc1">: ${i.description}</div> <br/>
						<div align="right">			
							<button name="getYoutubePlayer"   id="button1"
							type="button" class="btn btn-outline-light"  value="${i.videoId }">동영상보기</button><br/>
						</div>
			    	</div>
			 	 </li>
			   </td>
			</tr>
			<tr id="tr2">
				<td align="left" >
				<li class="media" >
					<img id="img2" src="${i.thumbnails}"/>
			   		<div class="media-body">
			      		<h6 id="h2" class="mt-0 mb-1" style="font-weight: bold;">${i.title}</h6>			      		
<%-- 			      		<input type="hidden" id="titleByList" name="titleByList" value="${i.title}"/> --%>
<%-- 			      		<input type="hidden" id="descriptionByList" name="descriptionByList" value="${i.description}"/> --%>
						<div id="desc2">: ${i.description}</div> <br/>
						<div align="right">			
							<button name="getYoutubePlayer"  id="button2"
							type="button" class="btn btn-outline-light"  value="${i.videoId }">동영상보기</button><br/>
						</div>
			    	</div>
			 	 </li>
			   </td>
			</tr>
			<tr id="tr3">
				<td align="left" >
				<li class="media" >
					<img id="img3" src="${i.thumbnails}"/>
			   		<div class="media-body">
			      		<h6 id="h3" class="mt-0 mb-1" style="font-weight: bold;">${i.title}</h6>			      		
<%-- 			      		<input type="hidden" id="titleByList" name="titleByList" value="${i.title}"/> --%>
<%-- 			      		<input type="hidden" id="descriptionByList" name="descriptionByList" value="${i.description}"/> --%>
						<div id="desc3">: ${i.description}</div> <br/>
						<div align="right">			
							<button name="getYoutubePlayer"  id="button3"
							type="button" class="btn btn-outline-light"  value="${i.videoId }">동영상보기</button><br/>
						</div>
			    	</div>
			 	 </li>
			   </td>
			</tr>
			<tr id="tr4">
				<td align="left" >
				<li class="media" >
					<img id="img4" src="${i.thumbnails}"/>
			   		<div class="media-body">
			      		<h6 id="h4" class="mt-0 mb-1" style="font-weight: bold;">${i.title}</h6>			      		
<%-- 			      		<input type="hidden" id="titleByList" name="titleByList" value="${i.title}"/> --%>
<%-- 			      		<input type="hidden" id="descriptionByList" name="descriptionByList" value="${i.description}"/> --%>
						<div id="desc4">: ${i.description}</div> <br/>
						<div align="right">			
							<button name="getYoutubePlayer"  id="button4"
							type="button" class="btn btn-outline-light"  value="${i.videoId }">동영상보기</button>
						</div>
			    	</div>
			 	</li>
			    </td>
			</tr>
		</ul>
		</div>
		</tbody>
	</table>
	<div align="center">
		<input type="hidden" id="requestPageToken" name="requestPageToken" value="${!empty requestPageToken? requestPageToken:'' }"/>
		<button class="btn btn-outline-light"  id="prevPageToken" name="prevPageToken" value="${!empty prevPageToken? prevPageToken : ''}">◀</button>&nbsp;&nbsp;
		<button class="btn btn-outline-light"  id="nextPageToken" name="nextPageToken" value="${!empty nextPageToken? nextPageToken : ''}">▶</button>
	</div>
</div>
<div id="getYoutubePlayer"  align="center" style="display:none;">
<!-- 	<iframe width="400" height="250" src="https://www.youtube.com/embed/${i.videoId}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
	<iframe width="400" height="250" src="https://www.youtube.com/embed/AtNBhPxVwh0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	<br/>
	<button  class="btn btn-outline-light" id="back">뒤로가기</button>&nbsp;&nbsp;&nbsp;
	<button  class="btn btn-outline-light" id="addThis">등록하기</button>
<!-- 	<div id="player"></div>  -->
</div>
