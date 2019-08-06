<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<script type="text/javascript">
	
	$(function(){
		$.ajax(
			{
				url : "/event/rest/getYoutubeSearchList?requestPageToken=",
				method : "POST",
				data : {
					searchKeyword : ""
				},
				dataType : "json",
				success : function(JSONData, status){
					$("#prevPageToken").val(JSONData.prevPageToken);
					$("#nextPageToken").val(JSONData.nextPageToken);
					$.each(JSONData.youtubeList, function(index,value){
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
							$.each(JSONData.youtubeList, function(index,value){
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
	</script>
	<style type="text/css">
		body{
			background-color :#F8FFFF;
		}
		td:hover{
			background-color : #D9E5FF; 
		}		
		th, td, tr{
			color: #041625;		
			font-size:17px;
		}
		img{
			margin : 5px;
		}
	</style>
<div class="container" align="center"  id="searchList" >
	<table class="table ">			      
		<div class="input-group mb-3">
			<input type="hidden" id="searchKeyword" name="searchKeyword" value="${!empty search.searchKeyword? search.searchKeyword : ''}"/>
			<input type="text"  id="inputKeyword" class="form-control"  placeholder="검색어" 
			 aria-label="searchKeyword" aria-describedby="searchYoutubeSubmit">
			<div class="input-group-append">
		 		<button class="btn btn-outline-secondary" type="button" id="searchYoutubeSubmit">검색</button>
		 	</div>
		</div>		
	<tbody>
		
		<div class="row" >
		<ul class="list-unstyled">
			<tr id="tr0">
				<td align="left" >
				<li class="media" >
					<img id="img0" src="${i.thumbnails}"/>
			   		<div class="media-body">
			      		<h6 id="h0"  class="mt-0 mb-1" style="font-weight: bold;">${i.title}</h6>			      		
						 <div id="desc0">: ${i.description}</div> <br/>
						<div align="right">			
							<button name="getYoutubePlayer"  id="button0"
							type="button" class="btn btn-outline-primary"  value="${i.videoId }">동영상보기</button><br/>
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
						 <div id="desc1">: ${i.description}</div> <br/>
						<div align="right">			
							<button name="getYoutubePlayer"   id="button1"
							type="button" class="btn btn-outline-primary"  value="${i.videoId }">동영상보기</button><br/>
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
						<div id="desc2">: ${i.description}</div> <br/>
						<div align="right">			
							<button name="getYoutubePlayer"  id="button2"
							type="button" class="btn btn-outline-primary"  value="${i.videoId }">동영상보기</button><br/>
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
						<div id="desc3">: ${i.description}</div> <br/>
						<div align="right">			
							<button name="getYoutubePlayer"  id="button3"
							type="button" class="btn btn-outline-primary"  value="${i.videoId }">동영상보기</button><br/>
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
						<div id="desc4">: ${i.description}</div> <br/>
						<div align="right">			
							<button name="getYoutubePlayer"  id="button4"
							type="button" class="btn btn-outline-primary"  value="${i.videoId }">동영상보기</button>
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
		<button class="btn btn-outline-primary"  id="prevPageToken" name="prevPageToken" value="${!empty prevPageToken? prevPageToken : ''}">◀</button>&nbsp;&nbsp;
		<button class="btn btn-outline-primary"  id="nextPageToken" name="nextPageToken" value="${!empty nextPageToken? nextPageToken : ''}">▶</button>
	</div>
</div>
<div id="getYoutubePlayer"  align="center" style="display:none;">
	<iframe width="400" height="250" src="https://www.youtube.com/embed/AtNBhPxVwh0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	<br/>
	<button  class="btn btn-outline-primary" id="back">뒤로가기</button>&nbsp;&nbsp;&nbsp;
	<button  class="btn btn-outline-primary" id="addThis">등록하기</button>
</div>
