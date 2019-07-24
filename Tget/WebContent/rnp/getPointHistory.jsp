<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>포인트 내역 조회</title>
	<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/blog/">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Acme|Bungee+Shade|Fredericka+the+Great&display=swap" rel="stylesheet">
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

	<script type="text/javascript">
	
	$(function(){
		$("#searchSubmit").on("click",function(){
			//alert("searchKeyword : "+$("#searchKeyword").val());
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
	<style type="text/css">
		h1{
			font-weight: bold; 
		}
		small{
			font-family: 'Nanum Pen Script', cursive;
		}
		
 		.container-fluid{ 
 			padding: 50px;
/*  			font-family: 'Sunflower', sans-serif; */
	 		font-size: 20px;    
 		} 
	</style>
</head>

<body>

<form>
	<div class="container-fluid" align="center">
		<div class="row" >
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<input type="hidden"  id="userId" name="userId"  value="${user.userId}" >
				<h1>${user.nickName}<small>님의 포인트 내역</small></h1>
			</div><br/><br/><br/><br/>
			<div class="col-lg-3"></div>
		</div>

		<div class="row" >
			<div class="col-lg-2"></div>
			<div class="col-lg-8" align="center">
				
				<table class="table table-striped">
				  <thead>
				    <tr align="center">
				      <th scope="col"><h4>거래번호</h4></th>
				      <th scope="col"><h4>적립 및 사용일</h4></th>
				      <th scope="col"><h4>적립 및 사용 내역</h4></th>
				      <th scope="col"><h4>포인트 총 합계</h4></th>				      
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${pointHistoryList}"  var="i">
				    <tr>
				      <td>
						<div align="center">
							<input type="text" name="tranNo" value="${i.tranNo }"/>
						</div>			
				  	  </td>
				  	  <td>				  	  	
				  	  	<div align="center" >
				  	  		${i.regDate}
				  	  	</div>
				  	  </td>				  	  
				  	  <td>
						<div align="left" >
							<c:if test="${i.pointUpdateCode == 0}">+</c:if>
							<c:if test="${i.pointUpdateCode == 1}">-</c:if>
							${i.updatePoint}<br/>
<!-- 							<button type="button" class="btn btn-outline-primary" >Primary</button> -->
						</div>			
				  	  </td>
				  	  <td>
				  	  </td>
				  	  <td>
				  	  	<div align="center" >
							<div style="font-size: 15px; font-weight: bold; margin: 10px;">
								${i.totalPoint}
							</div>			
						</div>
				  	  </td>
			    </tr>
			   </c:forEach>
		  		 </tbody>
				</table>
			</div>
			<div class="col-lg-2">
			
			</div>
		</div>	
	</div>
</form>

</body>
</html>