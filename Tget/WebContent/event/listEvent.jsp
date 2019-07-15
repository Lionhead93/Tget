<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Searching Stubhub Event</title>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	
	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<script type="text/javascript">
	var str = "";
	var arr = [];
	$(function(){
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
		
		$(".getEvent").on("click",function(){
// 			alert($(this).val());
// 			str = $(this).parent().children("input").val();
			arr = $(this).parent().children("input").val().split(' ');
			self.location = "/event/getEvent?category="+arr[arr.length-1]+"&eventName="+$(this).val();
// 			alert($(this).parent().children("input[type='hidden']").val());
// 			self.location = "/event/getEvent?eventName="+$(this).parent().children("input[type='hidden']").val();
		});		
	});
	
	</script>
	
	<style>
	
		div.container-fluid {
	 		font-family: 'Sunflower', sans-serif;
	 		font-size: 20px;
	 	}
	</style>
	
<body>
<jsp:include page="/layout/toolbar.jsp" />
<form>
	<div class="container-fluid">	
	<%-- 	<input type="hidden" id="currentPage" name="currentPage" value="${!empty search.currentPage? search.currentPage: ''}"/> --%>
		<input type="hidden"  id="category" name="category"  value="${!empty category? category : ''}" >
		<input type="hidden"  id="searchKeyword" name="searchKeyword"  value="${!empty search.searchKeyword? search.searchKeyword : ''}" >
		<input type="hidden"  id="searchCondition" name="searchCondition"  placeholder="searchCondition" value="${!empty search.searchCondition? search.searchCondition : ''}" >
		<input type="hidden"  id="requestPageToken" name="requestPageToken"  value="${!empty requestPageToken? requestPageToken : ''}"/>
		</br>
		총 ${totalResults} 건의 검색 결과</br></br>
		eventList
		<c:forEach items="${eventList}"  var="i">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
<%-- 					<input type="hidden"  id="eventName" name="eventName"  value="${i.name }"/> --%>
					이벤트명 : ${i.name}</br>
					이벤트 장소 : ${i.venueName }</br>
					출연진 : ${i.performersName }</br>
					카테고리  : <input type="text"  id="category2" name="category2"  value="${i.ancestorsCategory}" ></br>
					<button  type="button" class="getEvent" value="${i.name}">상세보기</button></br>
					============================</br>
				</div>
				<div class="col-md-2"></div>
			</div>
		</c:forEach>		
	</div>
</form>
</body>
</html>