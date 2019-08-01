 <%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form name="searchEvent">
			<div id="tgetHeader" class="text-center">
			<br/><br/><br/>
				<input type="hidden"  id="category" name="category"  value="${!empty category? category : ''}" >
				<input type="hidden"  id="searchKeyword" name="searchKeyword"  placeholder="searchKeyword" value="${!empty search.searchKeyword? search.searchKeyword : ''}" >
				<input type="hidden"  id="searchCondition" name="searchCondition"  placeholder="searchCondition" value="${!empty search.searchCondition? search.searchCondition : ''}" >
				<div class="row"><div class="col-lg-3  col-md-3 col-1"></div>
				<div class="col-lg-6 col-md-6 col-10">	
					<div class="input-group mb-1">
				  		<input type="text" class="form-control searchEventHeader" placeholder="이벤트명을 입력하세요"  aria-describedby="basic-addon2">
				  		<div class="input-group-append">
				    		<span class="input-group-text btn"  id="button-addon2">검색</span>
				 		 </div>
					</div>
					<div class="col-lg-3 col-md-3 col-1"></div>
				</div>
			</div>
			<input type="hidden"  id="requestPageToken" name="requestPageToken"  value="${!empty requestPageToken? requestPageToken : ''}"/><br/>
		</div>
</form>
<br/>
<script>
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
</script>