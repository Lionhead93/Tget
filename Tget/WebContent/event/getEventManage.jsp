<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>T-GET</title>
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/blog/">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	<link rel="stylesheet" href="/resources/css/yr.css" />
	<link rel="shortcut icon" href="/resources/images/logo.png">
	<link rel="icon" href="/resources/images/logo.png">		
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

  	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>
  	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
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
		$("button:contains('삭제하기')").on("click",function(){			
			var temp = $(this).val();
			$.ajax(
					{
						url : "/event/rest/deleteRecommendedEvent",
						method : "GET",
						contentType: 'application/json; charset=UTF-8',
						data : {
										recommEventNo : temp
									},
						dataType : "json",
						success : function(JSONData, status){
							$("#recommEventlistSize").val(parseInt($("#recommEventlistSize").val())-1);
							$("#"+temp).html("");		
						},
						error : function(request, status, error ) {   
						 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}			
				});					
		});
		
		$("button:contains('수정하기')").on("click",function(){	
			$("#recommEventNo").val($(this).val());	
			$.ajax(
					{
						url : "/event/rest/getRecommendedEvent",
						method : "POST",
						data : {
							recommEventNo : $(this).val()							
						},
						dataType : "json",
						success : function(JSONData,status){
							$("input[name='recommEventNo']").val(JSONData.recommEvent.recommEventNo);
							$("input[name='recommEventName']").val(JSONData.recommEvent.recommEventName);							
							$("textarea[name='recommEventDetail']").text(JSONData.recommEvent.recommEventDetail);
							$("input[name='koName']").val(JSONData.recommEvent.koName);	
						},
						error : function(request, status, error ) {   
						 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}			
				});	
		});
		
		$("#submit").on("click",function(){	
			$("#editRecommEvent").attr("method" , "POST").attr("enctype","multipart/form-data");
// 			var temp = $("#koName").val();
			$("#koName").val(encodeURIComponent( $("#koName").val()));
			$("#recommEventName").val(encodeURIComponent( $("#recommEventName").val()));
			$("#recommEventDetail").val(encodeURIComponent( $("#recommEventDetail").val()));
				var formData = new FormData($("#editRecommEvent")[0]);			
				if($("#recommEventNo").val()==""|| $("#recommEventNo").val()==null){
					if (parseInt($("#recommEventlistSize").val()) < 3) {
						$.ajax(
							{
								url : "/event/rest/addRecommendedEvent",
								method : "POST",
								data : formData,
								processData: false,
								contentType: false,
								dataType : "json",
								success : function(JSONData,status){
									$("#recommEventlistSize").val(parseInt($("#recommEventlistSize").val())+1);
									$("button.close").click();
									location.reload();
								},
								error : function(request, status, error ) {   
								 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								}			
							});
					}else{					
		 				alert("추천 이벤트를 더 이상 추가할 수 없습니다.");
					}
				}else{
					$.ajax(
							{
								url : "/event/rest/updateRecommendedEvent",
								method : "POST",
								data : formData,
								processData: false,
								contentType: false,
								dataType : "json",
								success : function(JSONData,status){								
									$("button.close").click();
									location.reload();
								},
								error : function(request, status, error ) {   
								 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								}			
						});				
				}
		});
		$("button.close").on("click",function(){
			$("input[name='recommEventNo']").val("");
			$("input[name='recommEventName']").val("");
			$("input[name='file']").val("");
			$("textarea[name='recommEventDetail']").text("");
			$("input[name='koName']").val("");	
			$("#categoryTwoNo").val("");
			$("#categoryOneCode").val("");
			$("#categoryTwoName").val("");
			$("#categoryTwoEng").val("");		
		});
	});
	
	$(function(){
		
		$("div.category").on("click", function(){
			var tempCateNo = $(this).children("input[type='hidden']").val();
			$.ajax(
					{
						url : "/event/rest/updateCategoryTwo",
						method : "GET",
						data : {
									categoryTwoNo : tempCateNo
									},
						dataType : "json",
						success : function(JSONData, status){			
								$("input[name='categoryTwoNo']").val(tempCateNo);
								$("select[name='categoryOneCode']").val(JSONData.category.categoryOneCode);
								$("input[name='categoryTwoName']").val(JSONData.category.categoryTwoName);
								$("input[name='categoryTwoEng']").val(JSONData.category.categoryTwoEng);
								
						},
						error : function(request, status, error ) {   
						 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
			});
		});
		
		$("#submit2").on("click",function(){
			if ($("#categoryTwoNo").val() == "") {
				$.ajax(
						{
							url : "/event/rest/addCategoryTwo",
							method : "POST",
							data : {
										categoryOneCode : $("select[name='categoryOneCode']").val(),
										categoryTwoName : $("input[name='categoryTwoName']").val(),
										categoryTwoEng : $("input[name='categoryTwoEng']").val()
										},
							dataType : "json",
							success : function(JSONData, status){								
								location.reload();
								$("#list-category-list").attr("class","list-group-item list-group-item-action active");
								$("#list-recomm-list").attr("class","list-group-item list-group-item-action");
								$("button.close").click();			
							},
							error : function(request, status, error ) {   
							 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
				});
			}else{
				$.ajax(
						{
							url : "/event/rest/updateCategoryTwo",
							method : "POST",
							data : {
										categoryTwoNo : $("#categoryTwoNo").val(),
										categoryOneCode : $("#categoryOneCode").val(),
										categoryTwoName : $("#categoryTwoName").val(),
										categoryTwoEng : $("#categoryTwoEng").val()
										},
							dataType : "json",
							success : function(JSONData, status){
								var tempHtml = '<ion-icon name="checkmark"></ion-icon>'
								+'<div class="category"   data-toggle="modal"  data-target="#categoryModal" onClick="updateCategoryGET('+$("#categoryTwoNo").val()+')">'
								+'<input type="hidden"  value="'+$("#categoryTwoNo").val()+'">'
								+JSONData.category.categoryTwoName+'</div>';
								
								if (JSONData.existingCode==JSONData.category.categoryOneCode) {
									alert('JSONData.existingCode==JSONData.category.categoryOneCode');
									$("#div"+JSONData.category.categoryTwoNo).html(tempHtml);
								} else {
									alert('JSONData.existingCode!=JSONData.category.categoryOneCode');
									$("#div"+JSONData.category.categoryTwoNo).remove();
									$("#div"+JSONData.category.categoryOneCode).append('<div class="row"  id="div'+JSONData.category.categoryTwoNo+'">'
											+tempHtml+'</div>');
								}
								$("button.close").click();					
							},
							error : function(request, status, error ) {   
							 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
				});
			}			
		});
		
		$("#delete").on("click",function(){
			$.ajax(
					{
						url : "/event/rest/deleteCategoryTwo",
						method : "POST",
						data : {
									categoryTwoEng : $("#categoryTwoEng").val()
									},
						dataType : "json",
						success : function(JSONData, status){
							$("#div"+$("#categoryTwoNo").val()).remove();
							$("button.close").click();						
						},
						error : function(request, status, error ) {   
						 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
			});
		});
	});
	
	function updateCategoryGET(recommNo){
		$.ajax(
				{
					url : "/event/rest/updateCategoryTwo",
					method : "GET",
					data : {
								categoryTwoNo : recommNo
								},
					dataType : "json",
					success : function(JSONData, status){
							$("input[name='categoryTwoNo']").val(recommNo);
							$("select[name='categoryOneCode']").val(JSONData.category.categoryOneCode);
							$("input[name='categoryTwoName']").val(JSONData.category.categoryTwoName);
							$("input[name='categoryTwoEng']").val(JSONData.category.categoryTwoEng);
							
					},
					error : function(request, status, error ) {   
					 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
		});
	}
	</script>
	
	<style>
	
		body{
			background-color: #EBF7FF;
			color: #041625;
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
		.tab-content{
			min-height: 400px;
		}	
	    div.container {
	        	margin-top: 40px;
	        	font-size: 20px;
	    }
        #list-recomm, #list-category{  
			padding : 10px 10px 10px 10px;
		}
		div.row{  
			padding : 10px  10px 10px 20px;
		}
        .tab-content{
        	border: 1px solid #D9E5FF ;            
	       	background-color : #F8FFFF ;
        }
        .categoryCard{
        	padding : 5px 5px 5px 5px;
        	color: #041625;
        	background-color:#D9E5FF;
        	font-weight: bold;
        }                
        .card-header{
        	font-weight:bold; background-color:#D9E5FF; color:#041625 ;
        }        
        .card-bodys{
        	background-color:  white; color: #041625;
        	padding: 5%;
        }

    </style>
    
</head>

<body>
<jsp:include page="/layout/tgetToolbar.jsp" />
<jsp:include page="/layout/tgetHeader.jsp" />
	<div class="container">
	
		<div class="row"  style="margin-top: 30px;">
		  <div class="col-2 col-lg-2" >
		    <div class="list-group" id="list-tab" role="tablist">
		      <a class="list-group-item list-group-item-action active " id="list-recomm-list" data-toggle="list" href="#list-recomm" role="tab" aria-controls="recomm">추천이벤트</a>
		      <a class="list-group-item list-group-item-action" id="list-category-list" data-toggle="list" href="#list-category" role="tab" aria-controls="category">카테고리</a>
		    </div>
		  </div>
		  <div class="col-10 col-lg-10">
		    <div class="tab-content" id="nav-tabContent">
		      <div class="tab-pane fade show active" id="list-recomm" role="tabpanel" aria-labelledby="list-recomm-list">
			      <div  class="row" >
			      	<div class="col-11"></div>
			      	<div class="col-1" align="left"  class="btn btn-light"	data-toggle="modal" 						
									 data-target="#exampleModalCenter"><ion-icon id="addRecomm" name="add" size="large"></ion-icon></div>		      	
			      </div>	
		  		  <input type="hidden" id="recommEventlistSize" value="${recommEventlistSize }"/>
		    	  <input type="hidden" id="recommEventNo"  name="recommEventNo"  />
		  		  <input type="hidden" name="recommEventName" />
		  		  <input type="hidden" name="recommEventDetail" />
			 	  <input type="hidden" name="recommEventUrl" />
  
				  <div class="row" align="center" >		      	
						<c:forEach items="${recommEventlist}"  var="i">			
							<div class="card shadow rounded col-lg-4" id="${i.recommEventNo }" >
							<div style="height: 400px;" >
								<video controls id="videoplay"  name="${i.recommEventNo }"  value="video" style="width: 16rem; height: 170px;">
									<source src="/resources/video/${i.videoName}" type="video/mp4">
								</video>
								<div class="card-body">
								<div style="height: 140px;" >
									<input type="hidden" name="eventName" value="${i.eventName }"/>
									<h5 class="card-title" style="font-weight: bold;">${i.recommEventName }</h5>
									<p class="card-text"><small>${i.recommEventDetail }</small></p>
								</div>	
									<button class="btn btn-outline-primary"  data-toggle="modal" 						
										 data-target="#exampleModalCenter" value="${i.recommEventNo }" >수정하기</button>
									<button class="btn btn-outline-primary" value="${i.recommEventNo }">삭제하기</button>							
								</div>
							</div>
							</div>
						</c:forEach>	
				  </div>
		 	  </div>
		      <div class="tab-pane fade" id="list-category" role="tabpanel" aria-labelledby="list-category-list">
		      	<div  class="row" >
			      	<div class="col-11"></div>
			      	<div class="col-1" align="left" data-toggle="modal"  data-target="#categoryModal" >
			      		<ion-icon id="addCate" name="add" size="large"></ion-icon>
			      	</div>		      	
			    </div>
			    <div class="row ">
		      		<div class="col-1"></div>
			      	<div class="card col-10 categoryCard">
					  <h5 class="card-header" >음악공연</h5>
					  <div class="card-bodys">
					  	<h5 class="card-title">
					  	<div id="div0">
					 	 <c:forEach items="${categorylist }"  var="i">
						    <c:if test="${i.categoryOneCode == 0}">
						   		<div class="row"  id="div${i.categoryTwoNo }">
							        <ion-icon name="checkmark"></ion-icon>
									<div class="category"   data-toggle="modal"  data-target="#categoryModal" >
									<input type="hidden"  value="${i.categoryTwoNo }">
								   	 ${i.categoryTwoName }</div>
						   		</div>
					    	</c:if>
					  	</c:forEach></div></h5>				    
					  </div>
					</div>
					<div class="col-1"></div>
				 </div>
					
				 <div class="row ">
		      		<div class="col-1"></div>
			      	<div class="card col-10 categoryCard">
					  <h5 class="card-header" >스포츠</h5>
					  <div class="card-bodys">
					  	<h5 class="card-title">
					  	<div id="div1">
					 	 <c:forEach items="${categorylist }"  var="i">
						    <c:if test="${i.categoryOneCode == 1}">
						   		<div class="row" id="div${i.categoryTwoNo }">
							        <ion-icon name="checkmark"></ion-icon>
									<div class="category"   data-toggle="modal"  data-target="#categoryModal" >
										<input type="hidden"  value="${i.categoryTwoNo }">
								   	 ${i.categoryTwoName }</div>
						   		</div>
					    	</c:if>
					  	</c:forEach></div></h5>				    
					  </div>
					</div>
					<div class="col-1"></div>
				 </div>
					
				 <div class="row ">
		      		<div class="col-1"></div>
			      	<div class="card col-10 categoryCard">
					  <h5 class="card-header" >기타예술공연</h5>
					  <div class="card-bodys">
					  	<h5 class="card-title">
					  	<div id="div2">
					 	 <c:forEach items="${categorylist }"  var="i">
						    <c:if test="${i.categoryOneCode == 2}">
						   		<div class="row"  id="div${i.categoryTwoNo }">
							        <ion-icon name="checkmark"></ion-icon>
									<div class="category"   data-toggle="modal"  data-target="#categoryModal" >
									<input type="hidden"  value="${i.categoryTwoNo }">
								   	 ${i.categoryTwoName }</div>
						   		</div>
					    	</c:if>
					  	</c:forEach></div></h5>				    
					  </div>
					</div>
					<div class="col-1"></div>
				 </div>  			  
		 </div>
	  </div>
	</div>
  </div>
 </div>
<!-- </form> -->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"  
aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content"  style="background-color:#D9E5FF; color: #041625;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">추천이벤트 편집</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <jsp:include page="/event/addRecommVideoGET.jsp" />
      </div>
      <div class="modal-footer">       
        <button type="button" class="btn btn-outline-primary"  id="submit" >저장</button>
         <button type="button" class="btn btn-outline-dark" data-dismiss="modal">닫기</button>
      </div>
    </div>
    </div>
</div>


<div class="modal fade" id="categoryModal" tabindex="-1" role="dialog"  
aria-labelledby="categoryModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content"  style="background-color:#D9E5FF; color: #041625;">
      <div class="modal-header">
        <h5 class="modal-title" id="categoryModalTitle">카테고리 편집</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<input type="hidden"  id="categoryTwoNo"  name="categoryTwoNo" />
        <div style="margin:30px; ">
			<div class="form-group">
			   <label  for="categoryOneCode"><ion-icon name="checkmark"></ion-icon>카테고리명</label>			  
			   <select class="custom-select" id="categoryOneCode" name="categoryOneCode">
			     <option disabled>--------------------------선택---------------------------</option>
			     <option value="0">음악공연</option>
        		 <option value="1">스포츠</option>
        		 <option value="2">기타예술공연</option>
			   </select>
			</div>        	
        	<div class="form-group">
			   <label  for="categoryTwoName"><ion-icon name="checkmark"></ion-icon>세부 카테고리명</label>			  
			   <input type="text" class="form-control"  id="categoryTwoName"   name="categoryTwoName"
			   placeholder="세부 카테고리명을 입력해주세요" />
			</div>			
			<div class="form-group">
			   <label  for="categoryTwoEng"><ion-icon name="checkmark"></ion-icon>영문명</label>			  
			   <input type="text" class="form-control"  id="categoryTwoEng" name="categoryTwoEng"
			   placeholder="세부 카테고리 영문명을 입력해주세요" />
			</div>        	
        </div>
      </div>
      <div class="modal-footer">       
      	 <button type="button" class="btn btn-outline-primary"  id="delete" >삭제</button>
         <button type="button" class="btn btn-outline-primary"  id="submit2" >저장</button>
         <button type="button" class="btn btn-outline-dark" data-dismiss="modal">닫기</button>
      </div>
    </div>
    </div>
</div>

<jsp:include page="/layout/footer.jsp" />
</body>
</html>