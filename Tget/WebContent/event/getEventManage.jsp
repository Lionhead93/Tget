<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>이벤트 관리</title>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	
	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<link rel="stylesheet" href="/resources/demos/style.css">
  	
  	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/jquery.scrolly.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>

	<script type="text/javascript">
	$( function() {
	    $( "#tabs" ).tabs();
	  } );

	$(function(){
		$("#addCate").on("click",function(){			
			alert("카테고리 추가");
		});
		
		$("button:contains('삭제하기')").on("click",function(){			
// 			alert("삭제하기");
			$.ajax(
					{
						url : "/event/rest/deleteRecommendedEvent",
						method : "GET",
						contentType: 'application/json; charset=UTF-8',
						data : {
										recommEventNo : $(this).val()
									},
						dataType : "json",
						success : function(JSONData, status){
// 							alert(status);
// 							alert("JSONData : \n"+JSONData);		
							$("#recommEventlistSize").val(parseInt($("#recommEventlistSize").val())-1);
// 							alert($("#recommEventlistSize").val());					
						},
						error : function(request, status, error ) {   
						 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}			
				});			
// 			var temp = parseInt($("#recommEventlistSize").val())-1;
			
		});
		
		$("button:contains('수정하기')").on("click",function(){			
			popWin = window.open("/event/updateRecommendedEvent?recommEventNo="+$(this).val(),"popWin",
					"left=500, top=100, width=600, height=600, "
					+"marginwidth=0, marginheight=0, scrollbars, scrolling, menubar=no, resizable");
		});
		
		$("#addRecomm").on("click",function(){	
			if (parseInt($("#recommEventlistSize").val()) < 3) {
				popWin = window.open("/event/addRecommendedEvent","popWin",
						"left=500, top=100, width=600, height=600, "
						+"marginwidth=0, marginheight=0, scrollbars, scrolling, menubar=no, resizable");
			} else {
				alert("추천 이벤트를 더 이상 추가할 수 없습니다.");
			}
			
// 			$.ajax(
// 					{
// 						url : "/event/rest/addRecommendedEvent",
// 						method : "POST",
// 						data : {
// 										recommEventNo : $("#recommEventNo").val(),
// 										eventName : $("#eventName").val(),
// 										videoName : $("#videoName").val(),
// 										recommEventName : $("#recommEventName").val(),
// 										recommEventDetail : $("#recommEventDetail").val()
// 									},
// 						dataType : "json",
// 						success : function(JSONData, status){
// 							alert(status);
// 							alert("JSONData : \n"+JSONData);		
					
// 						},
// 						error : function(request, status, error ) {   
// 						 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
// 						}
			
// 				});			
		});		
// 		$("video").on("click", function(){
// // 			alert($(this));
// 			$(this).play();
// 		});
	});
	
	</script>
	
	<style>
	.tab-content{
		min-height: 400px;
	}
      div.container {
        	margin-top: 50px;
        	font-family: 'Shadows Into Light', 'Nanum pen Script', cursive;
        	font-size: 25px;
        }
        #list-recomm, #list-category{  
			padding : 10px 10px 10px 10px;
		}
		div.row{  
			padding : 10px  10px 10px 20px;
		}
        .col-10{
        	border: 2px solid #5D5D5D;            
/*         	background-color : #5D5D5D ; */
        }
/*         .row{ */
/*         	margin-top: 30px;  */
/*         } */
        .card{
        	padding : 5px 5px 5px 5px;
        }        
        button {
/*         	 height: 33px; width: 100px;  */
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
<jsp:include page="/layout/tgetToolbar.jsp" />
<form>
	<div class="container">
	
		<div class="row"  style="margin-top: 30px;">
		  <div class="col-2" >
		    <div class="list-group" id="list-tab" role="tablist">
		      <a class="list-group-item list-group-item-action active " id="list-recomm-list" data-toggle="list" href="#list-recomm" role="tab" aria-controls="recomm">추천이벤트</a>
		      <a class="list-group-item list-group-item-action" id="list-category-list" data-toggle="list" href="#list-category" role="tab" aria-controls="category">카테고리</a>
		    </div>
		  </div>
		  <div class="col-10">
		    <div class="tab-content" id="nav-tabContent">
		      <div class="tab-pane fade show active" id="list-recomm" role="tabpanel" aria-labelledby="list-recomm-list">
		      <div  class="row" >
		      	<div class="col-11"></div>
		      	<div class="col-1" align="left"><ion-icon id="addRecomm" name="add" size="large"></ion-icon></div>		      	
		      </div>
		      
<!-- <form class="was-validated"> -->
<!-- <div class="row">  -->
<!-- 	<div class="custom-control custom-checkbox mb-3"> -->
<!--     <input type="checkbox" class="custom-control-input" id="customControlValidation1" required> -->
<!--     <label class="custom-control-label" for="customControlValidation1">Check this custom checkbox</label> -->
<!--     <div class="invalid-feedback">Example invalid feedback text</div> -->
<!--   </div><br/> -->
<!-- </div> -->
<!-- </form> -->
  			<input type="hidden" id="recommEventlistSize" value="${recommEventlistSize }"/>
  
			<div class="row" align="center" >		      	
				<c:forEach items="${recommEventlist}"  var="i">			
					<div style="width: 18rem; height: 400px;" >
						<video controls id="videoplay"  name="" value="video" style="width: 300px; height: 170px;">
							<source src="/resources/video/${i.videoName}" type="video/mp4">
						</video>
						<div class="card-body" style="height: 220px;" >
							<input type="hidden" name="eventName" value="${i.eventName }"/>
							<h5 class="card-title" style="font-weight: bold;">${i.recommEventName }</h5>
							<p class="card-text">${i.recommEventDetail }</p>
							<button class="btn btn-dark" value="${i.recommEventNo }">수정하기</button>
							<button class="btn btn-dark" value="${i.recommEventNo }">삭제하기</button>
						</div>
					</div>
				</c:forEach>	
			</div>
		 </div>
			  
			  
		      <div class="tab-pane fade" id="list-category" role="tabpanel" aria-labelledby="list-category-list">
		      	<div  class="row" >
			      	<div class="col-11"></div>
			      	<div class="col-1" align="left"><ion-icon id="addCate" name="add" size="large"></ion-icon></div>		      	
			      </div>
		      	<div class="row ">
		      		<div class="col-3  " style="font-weight:bold; font-size: 30px;" align="right">
		      			<div>음악공연</div>	      			
		      		</div>
		      		<div class="col-8 card  text-white bg-dark mb-3">		      			
		      			<div class="row">
		      				 <c:forEach items="${categorylist }"  var="i">
						    	<c:if test="${i.categoryOneCode == 0}">
						    		${i.categoryTwoName }<br/>	
						    	</c:if>
						  	</c:forEach>	<br/><br/>	
		      			</div>
		      		</div>
		      		<div class="col-1" ></div>
		      </div>
		      
		      <div class="row ">
		      	<div class="col-3 " style="font-weight:bold; font-size: 30px;" align="right">
		      		<div>스포츠</div>	      			
		      	</div>
		      	<div class="col-8  card  text-white bg-dark mb-3">		      			
		      		<div class="row">
		      			 <c:forEach items="${categorylist }"  var="i">
						   	<c:if test="${i.categoryOneCode == 1}">
						   		${i.categoryTwoName }<br/>	
						   	</c:if>
						</c:forEach>	<br/><br/>	
		      		</div>
		      	 </div>
		      	 <div class="col-1" ></div>
		      </div>
		      
		      <div class="row">
		      	<div class="col-3" style="font-weight:bold; font-size: 30px;" align="right">
		      		<div>기타예술공연</div>	 	
		      	</div>
		      	<div class="col-8   card  text-white bg-dark mb-3">		      			
		      		<div class="row">
		      			 <c:forEach items="${categorylist }"  var="i">
						   	<c:if test="${i.categoryOneCode == 2}">
						   		${i.categoryTwoName }<br/>	
						   	</c:if>
						</c:forEach>	<br/><br/>	
		      		</div>
		      	 </div>
		      	 <div class="col-1" ></div>
		      </div>
		      
  			</div>
  			  
		 </div>
	  </div>
	</div>
	
  </div>
</form>
<jsp:include page="/layout/footer.jsp" />
</body>
</html>