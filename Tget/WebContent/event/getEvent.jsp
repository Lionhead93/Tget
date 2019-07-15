<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Searching Youtube Video</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	
	var str = "";
	var videoList = [];
	
	$(function(){
		$("#searchSubmit").on("click",function(){
			alert("searchKeyword : "+$("#searchKeyword").val());
			//str = $("#searchKeyword").val();
			//$("form").attr("method" , "POST").attr("action" , "/event/youtubeSearch").submit();
			
			$.ajax(
					{
						url : "/event/json/youtubeSearch",
						method : "POST",
						data : {
										searchCondition : $("#searchCondition").val(),
										searchKeyword : $("#searchKeyword").val(),

									},
						dataType : "json",
						success : function(JSONData, status){
							alert(status);
							alert("JSONData : \n"+JSONData);		
					
						},
						error : function(request, status, error ) {   
						 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
			
					});			
		});		
	});
	
	</script>
</head>

<body>

<form>
	<div class="container-fluid">
	<%-- 	<input type="hidden" id="currentPage" name="currentPage" value="${!empty search.currentPage? search.currentPage: ''}"/> --%>
	category : <input type="text"  id="category" name="category"  value="${!empty category? category : ''}" ><br/>
	searchCondition : <input type="text" id="searchCondition" name="searchCondition"   value="  ${!empty search.searchCondition? search.searchCondition : ''}"   />
	searchKeyword : <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어" value="${!empty search.searchKeyword? search.searchKeyword : ''}" >
	<button type="submit" id="searchSubmit" >검색</button>
	eventListByName<br/><br/>
	이벤트 ${i.eventName }의 검색 결과 : 총 ${totalResults} 건</br></br>		
	<c:forEach items="${eventListByName}"  var="i">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10 event">
				날짜 : ${i.eventDate }<br/>
				시간 : ${i.eventTime}<br/>
				이벤트 장소 : ${i.eventLocation }<br/>
				현재 등록된 티켓 수 : ${i.totalTicketCount }<br/>
				티켓최저가 : ${i.ticketLowestPrice }<br/>				
				DB에 저장된 카테고리2 Eng Name  : <input type="text"  id="category2" name="category2"  value="${i.categoryTwoEng}" ><br/>
				<button  type="button" id="getEvent" name="getEvent"  value="${i.name }">상세보기</button><br/>
				============================<br/>
			</div>
			<div class="col-md-1"></div> 
		</div>
	</c:forEach>
		
	</div>
</form>

</body>
</html>