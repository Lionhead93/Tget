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
	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	
	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/jquery.scrolly.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	<script type="text/javascript">
	var str = "";
	var arr = [];
	
	$(function(){		
		$("div.card").on("click",function(){			
			arr = $(this).children("input.category").val().split(' ');
			$("#categoryTwo").val(arr[arr.length-1]);
			$("#eventName").val($(this).children(".getEvent").val());
			$("#koName").val($(this).children(".kn").val());
			$("#koLocation").val($(this).children(".el").val());
			$("#koPerformer").val($(this).children(".kp").val());
			$("form").attr("method" , "POST").attr("action" , "/event/getEvent").submit();
		});		
		
		$("#addEvent").on("click",function(){
			$("#addEvent").attr("style","display:none;");
			$("#loading").attr("style","display:block;");
			$.ajax(
					{
						url : "/event/rest/getEventList?requestPageToken="+$("#requestPageToken").val(),
						method : "POST",
						data : {
										searchCondition : $("#searchCondition").val(),
										searchKeyword : $("#searchKeyword").val()
									},
						dataType : "json",
						success : function(JSONData, status){
							$("#requestPageToken").val(JSONData.requestPageToken);
							$("#searchCondition").val(JSONData.search.searchCondition);
							$("#searchKeyword").val(JSONData.search.searchKeyword);
							if (JSONData.isTheLast == "true") {
								$("#addEvent").attr("style","display:none;");
							}
							$.each(JSONData.eventList, function(index,value){
								var tempStr = '<div class="card mb-3 shadow rounded" style="width: 21rem;height: 14rem;margin:15px;">'
									+'<div class="card-header" align="center"><h5  style="color:#193147;">T-GET</h5></div>'
									+'<div class="card-body text-center"><h5 class="card-title"><strong>'							
									+value.koName+'</strong></h5><p class="card-text">'
									+value.koLocation+'<br/></p></div>'
										'<input type="hidden"  class="kn" value="'+value.koName+'" >'
										'<input type="hidden"  class="el" value="'+value.koLocation+'" >'
										'<input type="hidden" class="kp" value="'+value.performersName+'">'
										'<input type="hidden" class="category" value="'+value.ancestorsCategory+'" >'	
										'<input type="hidden"  class="getEvent" value="'+value.name+'"></div>';
								$("div.eList").append(tempStr);
							});		
							$("#loading").attr("style","display:none;");
							$("#addEvent").attr("style","display:block;");
						},
						error : function(request, status, error ) {   
						 	swal("잘못된 접근입니다.","","error");
						}			
				});
		});						
	});
	
	</script>
	<style type="text/css">
	button{
		width: 800px;
		height:50px;
		font-weight:bold;
	}
	#footer{
		background-color: #1B1B1F ;
	}
	a, hr{
			color: #FBFCFE ;	
	}		
	button.btn-light:hover{
		background-color: gray;
		color: #FBFCFE ;
	}	       
	body{
			background-color: #EBF7FF;
			color: #041625;
	}

@import 'https://fonts.googleapis.com/css?family=Oswald';

#loading {
  display: flex;
  justify-content: center;
  align-items: center;
  font-family: 'Oswald', sans-serif;
  overflow: hidden;
  position: absolute;
}

.water-fill {
  animation: wave 0.8s infinite linear, 
             fill-up 10s infinite ease-out alternate;
}

@keyframes wave {
  0% { x: -400px; }
  100% { x: 0; }
}


@keyframes fill-up {
  0% {
    height: 0;
    y: 100px;
  }
  100% {
    height: 130px;
    y: -30px;
  }
}
	</style>
<body align="center" >	
<jsp:include page="/layout/tgetToolbar.jsp" />
<jsp:include page="/layout/tgetHeader.jsp" />

				
<div class="container" >
	<form>
	<div class="row eList" >
			<c:forEach items="${eventList}"  var="i">
				<div class="card mb-3 shadow rounded" style="width: 21rem;height: 14rem;margin:15px;">
					<div class="card-header" align="center"><h5  style="color:#193147;">T-GET</h5></div>
					<div class="card-body text-dark text-center">
						<h5 class="card-title"><strong>${!empty i.koName? i.koName:i.name}</strong></h5>
						<p class="card-text">${!empty i.koLocation? i.koLocation:i.venueName }<br/></p>
					</div>	
						<input type="hidden"  class="kn"  value="${i.koName}" >
						<input type="hidden"  class="el"  value="${i.koLocation}" >
						<input type="hidden" class="kp"  value="${i.performersName}" >			
						<input type="hidden" class="category"  value="${i.ancestorsCategory}" >	
						<input type="hidden"  class="getEvent"  value="${i.name }">
				</div>
			</c:forEach>			
			<input type="hidden"  id="categoryTwo" name="category"  value="" >
			<input type="hidden"  id="eventName" name="eventName"  value="" >
			<input type="hidden"  id="koName" name="koName"  value="" >
			<input type="hidden"  id="koLocation" name="koLocation"  value="" >
			<input type="hidden"  id="koPerformer" name="koPerformer"  value="" >
	</div>
	</form>	
</div><!-- container -->
<div align="center">
	<div align="center">
		<button id="addEvent" class="btn btn-primary">더보기</button>
	</div>
</div>

<div align="center" style="margin-left:45%;margin-right:45%;">	
	<div align="center"  id="loading"  style="display:none;">
		<svg  align="center" class="loading" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
		     width="200px" height="70px" viewBox="0 0 574.558 100" enable-background="new 0 0 574.558 100" xml:space="preserve">
		  <defs>
		    <pattern id="water" width=".25" height="1.0" patternContentUnits="objectBoundingBox">
		      <path fill="#fff" d="M0.25,1H0c0,0,0-0.659,0-0.916c0.083-0.303,0.158,0.334,0.25,0C0.25,0.327,0.25,1,0.25,1z"/>
		    </pattern>	    
		    <text  id="text" transform="matrix(1 0 0 1 -8.0684 100)" font-size="100" font-weight="bold">LOADING..</text>	    
		    <mask id="text_mask">
		      <use xlink:href="#text" opacity="1" fill="#0042ED"/>
		    </mask>
		  </defs>	 
		  <use xlink:href="#text" fill="#0042ED"/>	  
		  <rect class="water-fill" mask="url(#text_mask)" fill="url(#water)"width="1600" height="100"/>
		</svg>
	</div>	
</div>

<jsp:include page="/layout/footer.jsp" />
</body>
</html>