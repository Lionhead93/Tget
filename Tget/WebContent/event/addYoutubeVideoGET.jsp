<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<script type="text/javascript">
	
	var videoList = [];
	
	function requestTokenSubmit(requestPageToken){
		$("#requestPageToken").val(requestPageToken);
		$("#youtubeSearchForm").attr("method" , "POST").attr("action" , "/event/addYoutubeVideo").submit();
	}	
	function getYoutubePlayerSubmit(videoId,description,title){
		$("#description").val(description);
		$("#title").val(title);
		$("#youtubeSearchForm").attr("method" , "POST").attr("action" , "/event/getYoutubePlayer?videoId="+videoId).submit();
	}	
	$(function(){
		$.ajax(
			{
				url : "/event/rest/addYoutubeVideo?requestPageToken=&eventName="+$("#eventName").val(),
				method : "GET",
				data : {
					searchKeyword : $("#searchKeyword").val()
				},
				dataType : "json",
				success : function(JSONData, status){
					alert(status);
					alert("JSONData : \n"+JSONData);		
				}		
		 });				
		$("#prevPageToken").on("click",function(){
			if ($(this).val() == "") {
				alert("첫번째 페이지 입니다.");
			}else{
				requestTokenSubmit($(this).val());				
			}
		});		
		$("#nextPageToken").on("click",function(){
			if ($(this).val() == "") {
				alert("마지막 페이지 입니다.");
			}else{
				requestTokenSubmit($(this).val());				
			}
		});		
		$("button[name='getYoutubePlayer']").on("click",function(){
			getYoutubePlayerSubmit($(this).val(),$(this).parent().parent().children("input[name='descriptionByList']").val(),$(this).parent().parent().children("input[name='titleByList']").val());
		});		
		$("button:contains('검색')").on("click",function(){
			$("#searchKeyword").val($("input[type='text']").val());
			requestTokenSubmit("");
		});		
	});
	
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
</head>

<body>

<form id="youtubeSearchForm">
	<div class="container" align="center">
		<table class="table ">			      
			<input type="hidden" id="eventName" name="eventName" value="${!empty event.eventName? event.eventName : eventName}"/>
			<input type="hidden" id="title" name="title" />
			<input type="hidden" id="description" name="description" />
			<div class="input-group mb-3">
				<input type="hidden" id="searchKeyword" name="searchKeyword" value="${!empty search.searchKeyword? search.searchKeyword : ''}"/>
				<input type="text" class="form-control"  placeholder="검색어" 
				 aria-label="searchKeyword" aria-describedby="button-addon2">
				<div class="input-group-append">
		 			<button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
		 		</div>
			</div>		
			<tbody>		
				<div class="row">
					<ul class="list-unstyled">
					<c:forEach items="${youtubeList}"  var="i">
						<tr>
							<td align="left" >
								<li class="media" >
								<img src="${i.thumbnails}"/>
				   					<div class="media-body">
				      					<h6 class="mt-0 mb-1" style="font-weight: bold;">${i.title}</h6>			      		
				      					<input type="hidden" id="titleByList" name="titleByList" value="${i.title}"/>
				      					<input type="hidden" id="descriptionByList" name="descriptionByList" value="${i.description}"/>
							 			: ${i.description} <br/>
										<div align="right">			
											<button name="getYoutubePlayer" value="${i.videoId}"
											type="button" class="bmd-modalButton" data-toggle="modal" 
											data-bmdSrc="https://www.youtube.com/embed/-iDOez7D1tY" 
											data-bmdWidth="640" data-bmdHeight="480" data-target="#myModal" 
											data-bmdVideoFullscreen="true">동영상보기</button><br/>
										</div>
				    				</div>
			 	 				</li>
			 			  	</td>
						</tr>
					</c:forEach>					
					</ul>
				</div><br/>
			</tbody>
		</table>
	</div>
		<div align="center">
			<input type="hidden" id="requestPageToken" name="requestPageToken" value="${!empty requestPageToken? requestPageToken:'' }"/>
			<button class="button_black"  id="prevPageToken" name="prevPageToken" value="${!empty prevPageToken? prevPageToken : ''}">◀</button>&nbsp;&nbsp;
			<button class="button_black"  id="nextPageToken" name="nextPageToken" value="${!empty nextPageToken? nextPageToken : ''}">▶</button>
		</div>
	</form>

</body>
</html>