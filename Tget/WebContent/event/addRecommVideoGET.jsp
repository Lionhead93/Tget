<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="editRecommEvent" style="margin-left: 30px; margin-right: 30px;">		
	<div class="form-group">
    	<label for="recommEventName"><ion-icon name="checkmark"></ion-icon>추천이벤트명</label>
    	<input type="hidden" name="recommEventNo" value="${!empty recommEvent.recommEventNo ? recommEvent.recommEventNo :'0' }">
    	<input type="text" class="form-control" name="recommEventName" id="recommEventName" 
    	value="${recommEvent.recommEventName }" placeholder="추천 이벤트의 이름을 입력해주세요">
 	</div>
 	<div class="form-group">
		<label for="recommEventDetail"><ion-icon name="checkmark"></ion-icon>추천이벤트 설명</label>
			<textarea class="form-control" name="recommEventDetail" id="recommEventDetail"
		    value="${recommEvent.recommEventDetail }"  rows="3" placeholder="추천이벤트에 대한 설명을 입력하세요">${!empty recommEvent.recommEventDetail ? recommEvent.recommEventDetail :''}</textarea>
	</div>
	<div class="form-group">
		<label for="recommEventUrl"><ion-icon name="checkmark"></ion-icon>이벤트명</label>
			<c:if test="${empty recommEventNo }">
<!-- 				<input type="text" class="form-control" id="recommEventUrl" name="recommEventUrl"  -->
				<input type="text" class="form-control" id="koName" name="koName" 
    			placeholder="추천 이벤트로 등록할 이벤트의 이름을 입력하세요">
    		</c:if>
    		<c:if test="${!empty recommEventNo }">
<!--     			<input type="text" class="form-control" id="recommEventUrl" name="recommEventUrl"  -->
    			<input type="text" class="form-control" id="koName" name="koName" 
    			value="${recommEvent.koName }">
<%--     			value="http://127.0.0.1:8080/event/getEvent?category=&eventName=${recommEvent.koName }"> --%>
    		</c:if>
	</div>
	<div class="form-group">
		<label for="videoName"><ion-icon name="checkmark"></ion-icon>동영상</label>
			<div class="input-group mb-3">
				<div class="custom-file">
					<input type="file" class="custom-file-input"  id="videoName" name="file" value="${!empty recommEvent.videoName? recommEvent.videoName : ''}">
			    	<label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">여기를 클릭하세요</label>
			</div>
		</div>
	</div>
</form>
