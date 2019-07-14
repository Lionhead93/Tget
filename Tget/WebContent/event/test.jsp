<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	var str = "";
	$(function(){
		
		$("li").on("click",function(){
			//alert($(this).text());
			$("#searchCondition").val("0");
			 $.ajax(
						{
							url : "/event/rest/getCategory",
							method : "POST",
							data : {
								categoryTwoName : $(this).text()
										},
							dataType : "json",
							success : function(JSONData, status){
// 								str = JSONData.categoryTwoEng;
								$("#searchKeyword").val(JSONData.categoryTwoEng);
								alert(JSONData.categoryTwoEng);
								$("form").attr("method" , "POST").attr("action" , "/event/getEventList").submit();
							}
						});
		});	
		
		$("#testSubmit").on("click",function(){
			$("form").attr("method" , "POST").attr("action" , "/event/getEventList").submit();
		});
	});	
	</script>
</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />

<form>
	
	<div class="container">
	    
	    <div class="btn-group btn-group-justified" role="group" aria-label="...">
	    
		  <div class="btn-group" role="group" >
		    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    	음악공연<span class="caret"></span>
		    </button>
			 <ul class="dropdown-menu">
			    <li>콘서트</li>
			    <li>페스티벌</li>
			  </ul>
		  </div>
		  
		  <div class="btn-group" role="group" >
		    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    	스포츠<span class="caret"></span>
		    </button>
			 <ul class="dropdown-menu">
			    <li>축구</li>
			    <li>야구</li>
			    <li>골프</li>
			  </ul>
		  </div>
		  
		  <div class="btn-group" role="group" >
		    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		    	기타예술공연<span class="caret"></span>
		    </button>
			 <ul class="dropdown-menu">
			    <li>뮤지컬</li>
			    <li>클래식/오페라</li>
			  </ul>
		  </div>
		  
		</div>
		<br/>
		<br/>	  
		<br/>	  
		
	<div class="container-fluid">
	<br/><br/><br/>
	searchCondition이 0이면 카테고리 검색<br/>
	searchCondition이 1이면 키워드 검색<br/><br/>
	<input type="hidden" id="requestPageToken" name="requestPageToken" value="${requestPageToken }"/><br/>
	
	<input type="text" id="searchCondition" name="searchCondition" 
	placeholder="searchCondition" value="${!empty search.searchCondition? search.searchCondition : ''}"/><br/>
	
	<input type="text"  id="searchKeyword" name="searchKeyword"  
	placeholder="searchKeyword" value="${!empty search.searchKeyword? search.searchKeyword : ''}" ><br/>
	
	<button type="button" id="testSubmit" >이벤트검색테스트</button><br/>
	</div>
 	</div>
 	
	
	
</form>

</body>
</html>