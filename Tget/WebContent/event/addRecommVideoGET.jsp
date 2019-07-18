<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	
	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet">
		
<title>��õ �̺�Ʈ�� ����ϼ���!</title>

	<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script type="text/javascript">
	
	$(function(){

		$("#cancel").on("click",function(){	
			window.close();
		})	;
		
		$("#submit").on("click",function(){	
			$(this).val($("#file").val());
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
			if ("${recommEvent.eventName}"=="") {
				$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/event/addRecommendedEvent").submit();
			}else{
				$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/event/updateRecommendedEvent").submit();
			}
			
// 			window.close();
		})	;
	});
	</script>
	<style type="text/css">
		@media (max-width: 500px) {
			
		}
		form{
			border: 2px solid #5D5D5D;  
			padding: 20px;       
		}
	 div.container{
	 	padding: 20px;
	 	font-family: 'Sunflower', sans-serif;
	 	font-size:  20px;   
	 	width: 500px;
	 }
	 img, button{
	 	padding: 5px 5px 5px 5px ;
	 }
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
</head>

<body>

<div class="container">
	<div align="center"><h3 style="font-weight: bold;">
		<c:if test="${empty recommEvent }">��õ �̺�Ʈ�� ����ϼ���!</c:if>
		<c:if test="${!empty recommEvent }">��õ �̺�Ʈ�� �����ϼ���!</c:if>
	</h3></div>
	<form>		
		<div class="form-group">
    		<label for="recommEventName">�� ��õ�̺�Ʈ��</label>
    		<input type="text" class="form-control" name="recommEventName" id="recommEventName" 
    		value="${recommEvent.recommEventName }" placeholder="��õ �̺�Ʈ�� �̸��� �Է����ּ���">
 		 </div>
 		 <div class="form-group">
		    <label for="recommEventDetail">�� ��õ�̺�Ʈ ����</label>
		    <textarea class="form-control" name="recommEventDetail" id="recommEventDetail"
		    value="${recommEvent.recommEventDetail }"  rows="3">${recommEvent.recommEventDetail }</textarea>
		 </div>
 		 <div class="form-group">
    		<label for="recommEventUrl">�� ����ȸ url</label>
    		<c:if test="${empty recommEvent }"><input type="text" class="form-control" id="recommEventUrl" name="recommEventUrl" 
    			placeholder="��õ �̺�Ʈ�� ����� �������� url�� �Է��ϼ���"></c:if>
    		<c:if test="${!empty recommEvent }"><input type="text" class="form-control" id="recommEventUrl" name="recommEventUrl" 
    			value="http://127.0.0.1:8080/event/getEvent?category=&eventName=${recommEvent.eventName }"></c:if>
 		 </div>
 		 <div class="form-group">
    		<label for="videoName">�� ������</label>
    		<input type="file" class="form-control" id="videoName" name="file" value="${!empty recommEvent.videoName? recommEvent.videoName : ''}">
 		 </div>
		
<%-- 		eventImage  ; ${eventImage }<br/> --%>
		<div align="center">
			<button class="button_black"  id="cancel">���</button>
			<button class="button_black"  id="submit" >���</button>
		</div>
	</form>
</div>


</body>
</html>