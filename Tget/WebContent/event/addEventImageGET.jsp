<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="editEventImage">
	<div class="container">
		<input type="hidden"  id="eventName" name="eventName"  value="${eventName}" >
		<input type="hidden"  id="eventImage" name="eventImage"  value="${!empty eventImage? eventImage : ''}" />
		<c:if test="${!empty eventImage}">
			<img class="main" src="/resources/images/uploadFiles/${eventImage}" style="" />
		</c:if>
		<c:if test="${empty eventImage}">
			<img  class="main" src="/resources/images/logo.png"  style="width:400px; height=250px;"/>
		</c:if><br/><br/>
						
		<div class="input-group mb-3">
  			<div class="custom-file">
			    <input type="file" class="custom-file-input"  id="file" name="file" value="${!empty eventImage? eventImage : ''}">
			    <label class="custom-file-label" for="inputGroupFile02" aria-describedby="inputGroupFileAddon02">여기를 클릭하세요</label>
			</div>
		</div>
		<br/>
	</div>
</form>
