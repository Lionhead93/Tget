<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/resources/css/toolbar.css" />
<title>Searching Youtube Video</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	
	var videoList = [];
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
		body{
			background-color : #062038; 
			color: #FBFCFE;
		}
	</style>
</head>

<body>
<jsp:include page="/layout/tgetToolbar.jsp" />
<form>
	<div class="container-fluid">
<%-- 	<input type="hidden" id="currentPage" name="currentPage" value="${!empty search.currentPage? search.currentPage: ''}"/> --%>
	<input type="hidden" id="searchCondition" name="searchCondition" value="1"/>
	<input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어" value="${!empty search.searchKeyword? search.searchKeyword : ''}" >
	<button type="submit" id="searchSubmit" >검색</button>
	</div>
</form>

</body>
</html>