<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>내 리뷰</title>
	<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/blog/">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Acme|Bungee+Shade|Fredericka+the+Great&display=swap" rel="stylesheet">
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="/resources/javascript/common.js" ></script>
    <script type="text/javascript">

    $(function(){
    
    	
    });
   
	</script>
	<style type="text/css">
		h1{
			font-weight: bold; 
		}
		small{
			font-family: 'Nanum Pen Script', cursive;
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
 		.container-fluid{ 
 			padding: 50px;
/*  			font-family: 'Sunflower', sans-serif; */
	 		font-size: 20px;    
 		} 
	</style>
<body>	
<jsp:include page="/layout/toolbar.jsp" />

<form>
	<div class="container-fluid" align="center">	
		<div class="row" >
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<input type="hidden"  id="userId" name="userId"  value="${user.userId}" >
				<h1>${user.nickName}<small>님의 리뷰내역</small></h1>
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
				      <th scope="col"><h4>리뷰</h4></th>
				      <th scope="col"><h4>평점</h4></th>
				      <th scope="col"><h4>등록일</h4></th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${reviewList}"  var="i">
				    <tr>
				      <td>
						<div align="center">
							<input type="hidden" name="tranNo" value="${i.tranNo }"/>
						</div>			
				  	  </td>
				  	  <td>
						<div align="left" >
							${i.reviewBody}<br/>
<!-- 							<button type="button" class="btn btn-outline-primary" >Primary</button> -->
						</div>			
				  	  </td>
				  	  <td>
						<div align="center" >
							<div style="font-size: 15px; font-weight: bold; margin: 10px;">
								${i.score}.0
							</div>
							<button type="button" class="btn btn-outline-primary"  value="${i.eventId }">바로가기</button>						
						</div>			
				  	  </td>
				  	  <td>
				  	  	<div align="center" >
				  	  		${i.regDate}
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