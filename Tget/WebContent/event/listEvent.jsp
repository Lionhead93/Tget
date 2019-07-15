<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Searching Stubhub Event</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
		
		$("#getEvent").on("click",function(){
// 			alert($(this).val());
// 			str = $(this).parent().children("input").val();
			arr = $(this).parent().children("input").val().split(' ');
// 			alert(arr);
// 			if (arr.length != null) {
// 				alert(arr[arr.length-1]);
// 			}	
			self.location = "/event/getEvent?category="+arr[arr.length-1]+"&eventName="+$(this).val();
// 			alert($(this).parent().children("input[type='hidden']").val());
// 			self.location = "/event/getEvent?eventName="+$(this).parent().children("input[type='hidden']").val();
		});		
	});
	
	</script>
<jsp:include page="/layout/toolbar.jsp" />

<form>
	<div class="container-fluid">	
	<%-- 	<input type="hidden" id="currentPage" name="currentPage" value="${!empty search.currentPage? search.currentPage: ''}"/> --%>
		category : <input type="text"  id="category" name="category"  value="${!empty category? category : ''}" ><br/>
		searchKeyword : <input type="text"  id="searchKeyword" name="searchKeyword"  value="${!empty search.searchKeyword? search.searchKeyword : ''}" ><br/>
		searchCondition : <input type="text"  id="searchCondition" name="searchCondition"  placeholder="searchCondition" value="${!empty search.searchCondition? search.searchCondition : ''}" ><br/>
		requestPageToken : <input type="text"  id="requestPageToken" name="requestPageToken"  value="${!empty requestPageToken? requestPageToken : ''}"/><br/><br/>
		
		총 ${totalResults} 건의 검색 결과</br></br>
		eventList
		<c:forEach items="${eventList}"  var="i">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10 event">
<%-- 					<input type="hidden"  id="eventName" name="eventName"  value="${i.name }"/> --%>
					이벤트명 : ${i.name }</br>
					이벤트 장소 : ${i.venueName }</br>
					출연진 : ${i.performersName }</br>
					카테고리  : <input type="text"  id="category2" name="category2"  value="${i.ancestorsCategory}" ></br>
					<button  type="button" id="getEvent" name="getEvent"  value="${i.name }">상세보기</button></br>
					============================</br>
				</div>
				<div class="col-md-1"></div>
			</div>
		</c:forEach>
<!-- 		<button type="button"  id="addEvent" >더보기</button> -->
		
	</div>
</form>

</body>
</html>