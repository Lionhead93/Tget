<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>getEvent</title>
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
	var videoList = [];
	
	$(function(){
		$(".addTicket").on("click",function(){			
			self.location="/ticket/addTicketInfo?eventId="+$(this).parent().children("input[type='hidden']").val();
		});		
		
		$(".getTicketList").on("click",function(){
			$("form").attr("method" , "POST").attr("action" , "/event/getEventTicketList?eventId="+$(this).parent().children("input[type='hidden']").val()).submit();
// 			self.location="/event/getEventTicketList?eventId="+$(this).parent().children("input[type='hidden']").val();
		});		
		
		$("#addImage").on("click",function(){			
		});		
		
		$("#updateImage").on("click",function(){			
		});		
		
		$("#deleteImage").on("click",function(){			
		});		
	});
	
	</script>
	
	<style>
      div.container-fluid {
        	font-family: 'Sunflower', sans-serif;
	 		font-size: 20px;    
        }
        
        div.col-md-4{
        	border: 1px; color: black;
      	}
      	div.list{
        	font-family: 'Sunflower', sans-serif;
	 		font-size: 20px;
      	}
        
       img {
        	padding: 10px 10px;
        }
        
        .button_black{
			border:1px solid #616261; -webkit-border-radius: 3px; -moz-border-radius: 3px;border-radius: 3px;
			font-size:20px;font-family: 'Nanum Pen Script', cursive; padding: 0px 15px 0px 15px; 
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
<jsp:include page="/layout/toolbar.jsp" />
<form>
	<div class="container-fluid"  align="center">
			<br/>			
			<div class="row">
				<div class="col-lg-5" align="center">
					<h3>${eventName}</h3>
					${eventImage}</br>	
					<img src = "http://placehold.it/300x200" class="img-rounded"/><br/>
					<button class="button_black" id="addImage" >등록</button>&nbsp;&nbsp;
					<button class="button_black" id="updateImage" >수정</button>&nbsp;&nbsp;
					<button class="button_black" id="deleteImage">삭제</button><br/><br/><br/>
				</div>			
				<div class="col-lg-6">	
					<table class="table table-striped">
					  <thead>
					    <tr align="center">
					      <th scope="col"><h4>검색 결과 총 ${totalResults}건</h4></th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach items="${eventListByName}"  var="i">
					    <tr>
					      <td>
							<div class="event" align="left">
								<input type="hidden"  value="${i.eventId}"/><br/><br/>
								이벤트ID : ${i.eventId}<br/>
								날짜 : ${i.eventDate }<br/>
								시간 : ${i.eventTime}<br/>
								이벤트 장소 : ${i.eventLocation }<br/>
	
								현재 등록된 티켓 수 : ${i.totalTicketCount }<br/>
								티켓최저가 : ${i.ticketLowestPrice }<br/>				
								<input type="hidden"  id="category2" name="category2"  value="${i.categoryTwoEng}" >
								<button class="button_black addTicket" name="addTicket" >판매</button>&nbsp;&nbsp;&nbsp;&nbsp;
								<button class="button_black getTicketList" name="getTicketList" >구매</button><br/>
							</div>			
					  </td>
				    </tr>
				   </c:forEach>
			  		 </tbody>
					</table>					
				</div>
				<div class="col-lg-1"></div>
		</div>
		
	</div>
</form>

</body>
</html>