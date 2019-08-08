<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>T-GET</title>
	<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/blog/">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Acme|Bungee+Shade|Fredericka+the+Great&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	<link rel="stylesheet" href="/resources/css/yr.css" />
	<link rel="shortcut icon" href="/resources/images/logo.png">
	<link rel="icon" href="/resources/images/logo.png">		
    
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
  	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
    
    <script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/jquery.scrolly.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	<script src="/resources/javascript/yr.js" ></script>
    <script type="text/javascript">

    $(function(){
    	
    	$("button.btn-outline-danger").on("click", function(){
    		var temp = $(this).val();
    		var content = $(this).closest(".col-sm-4");
    		$.ajax(
					{
						url : "/event/rest/deleteInterestedEvent/"+temp,
						method : "POST",
						dataType : "json",
						success : function(JSONData, status){
							content.remove();
						},
						error : function(request, status, error ) {   
						 	swal("삭제할 이벤트를 찾지 못했습니다.","","error");
						}			
				});	
        });
    	
    	$(".getEvent").on("click",function(){
    		self.location = "/event/getEventTicketList?eventIds="+$(this).children("input[type='hidden']").val();
    	});
    	    	 	
    	initparticles();    	
    });        
	</script>
	<style type="text/css">
 		.getEvent:hover{
 			color: blue;
			cursor:pointer;
			font-size:27px;
		}
		body{
			background-color: #EBF7FF;
			color: #041625;	
		}
		
	</style>
<body>	
<jsp:include page="/layout/tgetToolbar.jsp" />
<jsp:include page="/layout/tgetHeader.jsp" />
<form style="font-size: 20px;">
	<div class="container" align="center">	
		<div class="row" >
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<input type="hidden"  id="userId" name="userId"  value="${user.userId}" >
				<h1><span style="font-weight:bold;font-size:30px">${user.nickName}</span><small>님의 </small> 
					<span class="textcontainer" style="font-weight: bold; ">
						<span class="particletext hearts">관심이벤트<span class="particle" style="top:61%; left:26%;width:8px; height:8px;animation-delay: 2.5s;"></span><span class="particle" style="top:31%; left:70%;width:9.6px; height:9.6px;animation-delay: 1.5s;"></span><span class="particle" style="top:32%; left:48%;width:11.6px; height:11.6px;animation-delay: 1.2s;"></span><span class="particle" style="top:61%; left:33%;width:9.2px; height:9.2px;animation-delay: 0.9s;"></span><span class="particle" style="top:75%; left:86%;width:6.4px; height:6.4px;animation-delay: 1.2s;"></span><span class="particle" style="top:43%; left:74%;width:10.5px; height:10.5px;animation-delay: 0.8s;"></span><span class="particle" style="top:25%; left:10%;width:7.9px; height:7.9px;animation-delay: 2.6s;"></span><span class="particle" style="top:39%; left:2%;width:6.9px; height:6.9px;animation-delay: 0s;"></span><span class="particle" style="top:46%; left:73%;width:10.6px; height:10.6px;animation-delay: 3s;"></span><span class="particle" style="top:20%; left:86%;width:9.4px; height:9.4px;animation-delay: 2s;"></span><span class="particle" style="top:35%; left:45%;width:6.8px; height:6.8px;animation-delay: 2.3s;"></span><span class="particle" style="top:62%; left:41%;width:11.7px; height:11.7px;animation-delay: 0.7s;"></span><span class="particle" style="top:23%; left:59%;width:10.2px; height:10.2px;animation-delay: 1.7s;"></span><span class="particle" style="top:42%; left:66%;width:6.9px; height:6.9px;animation-delay: 0.2s;"></span></span>
					</span>					
				</h1>
			</div><br/><br/><br/><br/>
			<div class="col-lg-3"></div>
		</div>

		<div class="row" >
			  <c:forEach items="${interestedEventList}"  var="i">
				 
				 <div class="col-sm-4" style="margin-bottom: 20px;">
				 	<div class="card text-center shadow rounded" >
				 		<img src="/resources/images/uploadFiles/${i.eventImage}" class="card-img-top" onerror="this.src='/resources/images/logo.png'" height="200px;">
				 		<div class="card-body">
				 		
					 		<div class="card-text" style="padding-bottom: 10px;">
					 			
					 		 <h4>						 		 
							  <strong><a class="getEvent">
							  ${i.koName}
							  <input type="hidden" value="${i.eventId }"  />
							  </a></strong>							  					     				     
					    	 </h4>
					    	 </div>
				 			<p class="card-text text-dark">
					        <small>${i.koLocation}</small>	
					        </p>
				 		 	<p class="card-text text-dark">
					        <small>${i.eventDate }, ${i.eventTimeStr}</small>	
					        </p>
					        <p style="font-size: 15px; font-weight: bold; margin: 10px;">
					       		<i class="fas fa-chart-bar"></i> 최저가 ${i.ticketLowestPriceStr }원 / 총 ${i.totalTicketCount }건	
					        </p>
					        <div class="text-center">
					        <br/>
					        <button type="button" class="btn btn-outline-danger"  value="${i.eventId }">삭제</button>				        
				 			</div>
				 		</div>
				 		
				 	</div>			 
				 </div>
				 
				  <%-- <tr class="record">
				  	  <td class="record" >
				  	  	<input type="hidden" value="${i.eventId }"  />
						<div class="event" align="left" style="padding-left: 60px">
							${i.koName}<br/>
							${i.eventDate }, ${i.eventTimeStr}<br/>
							${i.koLocation}<br/>
						</div>			
				  	  </td>
				  	  <td>
						<div align="center" >
							<div style="font-size: 15px; font-weight: bold; margin: 10px;">
								최저가 ${i.ticketLowestPriceStr }원, 총 ${i.totalTicketCount }건
							</div>
							<button type="button" class="btn btn-outline-primary"  value="${i.eventId }">삭제</button>						
						</div>			
				  	  </td>
			    </tr> --%>
			   </c:forEach>
		</div>	
	</div>
</form>
	
<jsp:include page="/layout/footer.jsp" />
</body>
</html>