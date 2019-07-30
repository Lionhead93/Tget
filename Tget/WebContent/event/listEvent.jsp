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
	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/jquery.scrolly.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
<!-- 	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> -->
<!-- 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!--   	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
	<script type="text/javascript">
	var str = "";
	var arr = [];
	$(function(){
		$("input[type='text']").on("keyup",function(){
			$("#searchKeyword").val($("input[type='text']").val());
		});
		
		$("input[type='text']").on("keypress",function(){
			if (event.keyCode ==13) {
				$("#searchCondition").val("1");
				$("form[name='searchEvent']").attr("method" , "POST").attr("action" , "/event/getEventList").submit();
			}
		});
		
		$("#button-addon2").on("click",function(){
			$("#searchCondition").val("1");
			$("form[name='searchEvent']").attr("method" , "POST").attr("action" , "/event/getEventList").submit();
		});
		
		$("button.btn-light").on("click",function(){			
			arr = $(this).parent().children("input.category").val().split(' ');
			$("#category").val(arr[arr.length-1]);
			$("#eventName").val($(this).val());
			$("#koName").val($(this).parent().children(".kn").val());
			$("#koLocation").val($(this).parent().children(".el").val());
			$("#koPerformer").val($(this).parent().children(".kp").val());
// 			self.location = "/event/getEvent?category="+arr[arr.length-1]+"&eventName="+$(this).val();
// 			$("form").attr("method" , "POST").attr("action" , "/event/getEvent?category="+arr[arr.length-1]+"&eventName="+$(this).val()).submit();
			$("form[name='searchEvent']").attr("method" , "POST").attr("action" , "/event/getEvent").submit();

		});		
		
		$("#addEvent").on("click",function(){
			alert("requestPageToken+1 : "+parseInt($("#requestPageToken").val())+1);
			var requestPT = parseInt($("#requestPageToken").val())+1;
			$.ajax(
					{
						url : "/event/rest/getEventList/"+requestPT,
						method : "POST",
						data : {
										searchCondition : $("#searchCondition").val(),
										searchKeyword : $("#searchKeyword").val()
									},
						dataType : "json",
						success : function(JSONData, status){
							alert(status);
							alert("JSONData : \n"+JSONData);		
							alert("eventList : \n"+JSONData.eventList);		
							alert("totalResults : \n"+JSONData.totalResults);		
						},
						error : function(request, status, error ) {   
						 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}			
				});			
		});				
		
	});
	
	</script>
	<style type="text/css">
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
	#tgetHeader{
		   color: #FBFCFE;	
	       padding-top: 30px;
	       padding-bottom: 30px;
	       margin-bottom: 30px;
	       		background: url(/resources/images/pic05.jpg) no-repeat center center fixed; 
				  -webkit-background-size: cover;
				  -moz-background-size: cover;
				  -o-background-size: cover;
				  background-size: cover;	
       } 
       
		body{
			background-color : #062038; 
			color: #FBFCFE;
		}
		
		table{
			background-color : #193147; 
			border: 1px solid #FBFCFE;	
			color: #FBFCFE;		
		}
		
		td:hover{
			background-color : #041625; 
		}
		
		th, td{
			color: #FBFCFE;		
			font-size:20px;
		}

	</style>
<body>	
<jsp:include page="/layout/tgetToolbar.jsp" />

<form name="searchEvent">

	<div class="container-fluid" align="center">	
		<div id="tgetHeader" class="text-center">
		<br/><br/>
			<input type="hidden"  id="category" name="category"  value="${!empty category? category : ''}" >
			<input type="hidden"  id="searchKeyword" name="searchKeyword"  placeholder="searchKeyword" value="${!empty search.searchKeyword? search.searchKeyword : ''}" >
			<input type="hidden"  id="searchCondition" name="searchCondition"  placeholder="searchCondition" value="${!empty search.searchCondition? search.searchCondition : ''}" >
			<div class="row"><div class="col-lg-3  col-md-3 col-1"></div>
			<div class="col-lg-6 col-md-6 col-10">	
				<div class="input-group mb-1">
			  		<input type="text" class="form-control" placeholder="이벤트명을 입력하세요"  aria-describedby="basic-addon2">
			  		<div class="input-group-append">
			    		<span class="input-group-text btn"  id="button-addon2">검색</span>
			 		 </div>
				</div>
				<div class="col-lg-3 col-md-3 col-1"></div>
			</div>
		</div>
		<input type="hidden"  id="requestPageToken" name="requestPageToken"  value="${!empty requestPageToken? requestPageToken : ''}"/><br/>
	</div>
		
					
					

	<div class="row" >
		<div class="col-lg-2"></div>
		<div class="col-lg-8" align="center">
			
			<table class="table ">
			  <thead>
			    <tr align="center">
			      <th scope="col"><h4>검색 결과 총 ${!empty totalResults? totalResults: 0}건</h4></th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach items="${eventList}"  var="i">
			    <tr>
			      <td align="center" >
					<div  align="left"  >
						<div  style="margin-left:10%; margin-right:10%" >
							이벤트명 : ${!empty i.koName? i.koName:i.name}</br>
							이벤트 장소 : ${!empty i.koLocation? i.koLocation:i.venueName }</br>
							<c:if test="${!empty i.performersName and i.performersName.trim() != 'null'}">
								출연진 : ${i.performersName }
							</c:if>								
						</div>						 
						<div align="right"  style="padding: 20px  70px ;">				
							<input type="hidden"  class="kn"  value="${i.koName}" >
							<input type="hidden"  class="el"  value="${i.venueName}" >
							<input type="hidden" class="kp"  value="${i.performersName}" >			
							<input type="hidden" class="category"  value="${i.ancestorsCategory}" >			
<%-- 								<button class="button_black" type="button" name="getEvent"  value="${i.name }">상세보기</button> --%>
							<button type="button" class="btn btn-light" name="getEvent"  value="${i.name }">상세보기</button></br>
						</div>
					</div>			
			  </td>
		    </tr>
		   </c:forEach>
			<input type="hidden"  id="eventName" name="eventName"  value="" >
			<input type="hidden"  id="koName" name="koName"  value="" >
			<input type="hidden"  id="koLocation" name="koLocation"  value="" >
			<input type="hidden"  id="koPerformer" name="koPerformer"  value="" >
	  		 </tbody>
			</table>
		</div>
		<div class="col-lg-2"></div>
	</div>		
</div><!-- container -->
</form>
<jsp:include page="/layout/footer.jsp" />
</body>
</html>