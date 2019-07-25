<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Searching Stubhub Event</title>
	<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/blog/">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/jquery.scrolly.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
<!-- 	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!-- 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!--   	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
	<script type="text/javascript">
	var str = "";
	var arr = [];
	$(function(){
		$("input[type='text']").on("keyup",function(){
			$("#searchKeyword").val($("input[type='text']").val());
// 			alert("keyup : "+$("#searchKeyword").val());
		});
		
		$("button:contains('검색')").on("click",function(){
			$("#searchCondition").val("1");
			$("form").attr("method" , "POST").attr("action" , "/event/getEventList").submit();
		});
		
		$("button.button_black").on("click",function(){
			
			arr = $(this).parent().children("input.category").val().split(' ');
			$("#category").val(arr[arr.length-1]);
			$("#eventName").val($(this).val());
			$("#koName").val($(this).parent().children(".kn").val());
			$("#koLocation").val($(this).parent().children(".el").val());
			$("#koPerformer").val($(this).parent().children(".kp").val());
// 			self.location = "/event/getEvent?category="+arr[arr.length-1]+"&eventName="+$(this).val();
// 			$("form").attr("method" , "POST").attr("action" , "/event/getEvent?category="+arr[arr.length-1]+"&eventName="+$(this).val()).submit();
			$("form").attr("method" , "POST").attr("action" , "/event/getEvent").submit();

		});		
		
		$("#addEvent").on("click",function(){
			alert("requestPageToken+1 : "+parseInt($("#requestPageToken").val())+1);
			var requestPT = parseInt($("#requestPageToken").val())+1;
			$.ajax(
					{
						url : "/event/rest/getEventList/"+requestPT,
						method : "POST",
						data : {
										searchKeyword : $("#searchKeyword").val()
									},
						dataType : "json",
						success : function(JSONData, status){
							alert(status);
							alert("JSONData : \n"+JSONData);		
							alert("eventList : \n"+JSONData.eventList);		
							alert("totalResults : \n"+JSONData.totalResults);		
						},
						error : function(request, status, error ) {   
						 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}			
				});			
		});		
		
		
	});
	
	</script>
	<style type="text/css">
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
	</style>
<body>	
<jsp:include page="/layout/tgetToolbar.jsp" />

<form>
	<div class="container-fluid" align="center">	
		<div class="row" >
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<input type="hidden"  id="category" name="category"  value="${!empty category? category : ''}" ><br/>
					<div class="input-group mb-3">
						<input type="hidden"  id="searchKeyword" name="searchKeyword"  placeholder="searchKeyword" value="${!empty search.searchKeyword? search.searchKeyword : ''}" >
						<input type="hidden"  id="searchCondition" name="searchCondition"  placeholder="searchCondition" value="${!empty search.searchCondition? search.searchCondition : ''}" >
						<input type="text" class="form-control"  placeholder="검색어" />
						<div class="input-group-append">
					 		<button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
					 	</div>
					</div>
				<input type="hidden"  id="requestPageToken" name="requestPageToken"  value="${!empty requestPageToken? requestPageToken : ''}"/><br/>
			</div>
			<div class="col-lg-3"></div>
		</div>

		<div class="row" >
			<div class="col-lg-2"></div>
			<div class="col-lg-8" align="center">
				
				<table class="table table-striped">
				  <thead>
				    <tr align="center">
				      <th scope="col"><h4>검색 결과 총 ${!empty totalResults? totalResults: 0}건</h4></th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${eventList}"  var="i">
				    <tr>
				      <td>
						<div class="event" align="left">
							<div  style="padding: 20px 30px ;">
								이벤트명 : ${!empty i.koName? i.koName:i.name}</br>
								이벤트 장소 : ${i.venueName }</br>
								<c:if test="${!empty i.performersName and i.performersName.trim() != 'null'}">
									출연진 : ${i.performersName }</br>
								</c:if>								
							</div>						 
							<div align="right"  style="padding: 20px  70px ;">				
								<input type="hidden"  class="kn"  value="${i.koName}" >
								<input type="hidden"  class="el"  value="${i.venueName}" >
								<input type="hidden" class="kp"  value="${i.performersName}" >			
								<input type="hidden" class="category"  value="${i.ancestorsCategory}" >			
								<button class="button_black" type="button" name="getEvent"  value="${i.name }">상세보기</button></br>
							</div>
						</div>			
				  </td>
			    </tr>
			   </c:forEach>
				<input type="hidden"  id="eventName" name="eventName"  value="" >
				<input type="hidden"  id="koName" name="koName"  value="" >
				<input type="hidden"  id="koLocation" name="koLocation"  value="" >
				<input type="hidden"  id="koPerformer" name="koPerformer"  value="" >
		  		 </tbody>
				</table>
			</div>
			<div class="col-lg-2"></div>
		</div>

		
	</div>
</form>
<jsp:include page="/layout/footer.jsp" />
</body>
</html>