<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<form name="addReviewForm"  style="font-size:20px; margin-top:30px;margin-left: 30px; margin-right: 30px;">		
		<input type="hidden" id="reviewTranNo" name="tranNo" value="${!empty tranNo? tranNo:'' }">
<%-- 		<input type="hidden" name="updatePoint" value="${updatePoint}"> --%>
		<div class="form-group row">
    		<label for="score" class="col-md-3"><ion-icon name="checkmark"></ion-icon><strong>평점</strong> </label>
    		<div class="col-md-9">
    		<select  class="custom-select"  id="score" name="score">
    			<option value="5">5.0</option>
    			<option value="4">4.0</option>
    			<option value="3">3.0</option>
    			<option value="2">2.0</option>
    			<option value="1">1.0</option>
    		</select>
    		</div>
 		 </div>
			<br/>
 		 <div class="form-group row">
		    <label for="reviewBody" class="col-md-3"><ion-icon name="checkmark"></ion-icon><strong>리뷰</strong></label>
		    <div class="col-md-9">
		    <textarea class="form-control" name="reviewBody" id="reviewBody"
		    value="${!empty review.reviewBody?review.reviewBody:''}"  rows="3" placeholder="리뷰를 입력하세요">${!empty review.reviewBody? review.reviewBody:''}</textarea>
		 	</div>
		 </div>
	</form>
