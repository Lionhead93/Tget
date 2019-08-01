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
		
<!-- <title>추천 이벤트를 등록하세요!</title> -->

<!-- 	<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script> -->
<!-- 	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!-- 	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> -->
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->
	<script type="text/javascript">
	
	$(function(){
		
// 		$("#cancel").on("click",function(){	
// 			window.close();
// 		})	;
		
// 		$("#submit").on("click",function(){	
// 			$(this).val($("#file").val());
// 			$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/product/updateProduct").submit();
			
// 			$.ajax(
// 					{
// 						url : "/event/rest/addEventImage",
// 						method : "POST",
// 						data : {
// 										eventImage : $("#file").val(),
// 										eventName : $("#eventName").val()
// 									},
// 						dataType : "json",
// 						success : function(JSONData, status){
// 							alert(status);
// 							alert("JSONData : \n"+JSONData.stringify());		
// 						},
// 						error : function(request, status, error ) {   
// 						 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
// 						}			
// 				});		
			
// 			$(opener.document).find("#eventImage").val($(this).val());
// 			if ("${recommEvent.eventName}"=="") {
// 				$("#editRecommEvent").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/event/addRecommendedEvent").submit();
// 			}else{
// 				$("#editRecommEvent").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/event/updateRecommendedEvent").submit();
// 			}
			
// 			window.close();
// 		})	;
	});
	</script>
</head>

<!-- <body> -->
	<form id="editRecommEvent" style="margin-left: 30px; margin-right: 30px;">		
		<div class="form-group">
    		<label for="recommEventName"><ion-icon name="checkmark"></ion-icon>추천이벤트명</label>
    		<input type="hidden" name="recommEventNo" value="${recommEvent.recommEventName }">
    		<input type="text" class="form-control" name="recommEventName" id="recommEventName" 
    		value="${recommEvent.recommEventName }" placeholder="추천 이벤트의 이름을 입력해주세요">
 		 </div>
 		 <div class="form-group">
		    <label for="recommEventDetail"><ion-icon name="checkmark"></ion-icon>추천이벤트 설명</label>
		    <textarea class="form-control" name="recommEventDetail" id="recommEventDetail"
		    value="${recommEvent.recommEventDetail }"  rows="3" placeholder="추천이벤트에 대한 설명을 입력하세요">${!empty recommEvent.recommEventDetail ? recommEvent.recommEventDetail :''}</textarea>
		 </div>
 		 <div class="form-group">
    		<label for="recommEventUrl"><ion-icon name="checkmark"></ion-icon>상세조회 url</label>
    		<c:if test="${empty recommEventNo }"><input type="text" class="form-control" id="recommEventUrl" name="recommEventUrl" 
    			placeholder="추천 이벤트로 등록할 페이지의 url을 입력하세요"></c:if>
    		<c:if test="${!empty recommEventNo }"><input type="text" class="form-control" id="recommEventUrl" name="recommEventUrl" 
    			value="http://192.168.0.82:8080/event/getEvent?category=&eventName=${recommEvent.eventName }"></c:if>
 		 </div>
 		 <div class="form-group">
    		<label for="videoName"><ion-icon name="checkmark"></ion-icon>동영상</label>
    		<div class="input-group mb-3">
  			<div class="custom-file">
			    <input type="file" class="custom-file-input"  id="videoName" name="file" value="${!empty recommEvent.videoName? recommEvent.videoName : ''}">
			    <label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">여기를 클릭하세요</label>
			</div>
		</div>
<%--     		<input type="file" class="form-control" id="videoName" name="file" value="${!empty recommEvent.videoName? recommEvent.videoName : ''}"> --%>
 		 </div>
		
<%-- 		eventImage  ; ${eventImage }<br/> --%>
		<div align="center">
<!-- 			<button class="button_black"  id="cancel">취소</button> -->
<!-- 			<button class="button_black"  id="submit" >등록</button> -->
		</div>
	</form>


<!-- </body> -->
<!-- </html> -->