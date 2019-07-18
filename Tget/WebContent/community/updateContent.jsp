<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "수정"  Event 연결 =============
		function fncUpdateContent() {
	
	
			$("form").attr("method" , "POST").attr("action" , "/community/updateContent").submit();
		}
		
	 $(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $( "button.btn.btn-warning" ).on("click" , function() {
		 alert("왜 또 안돼 ");
		 fncUpdateContent();
	 });
});

$(function() {
		
	 $("button.btn.btn-primary").on("click" , function() {
		
		history.go(-1);
	});
});
	
	</script>
	
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar Start /////////////////////////////////////-->

   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">게시글 수정</h3>
	       <!-- <h5 class="text-muted">내 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5> -->
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		   <div class="form-group">
		    <label for="contentNo" class="col-sm-offset-1 col-sm-3 control-label">게시글 번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="contentNo" name="contentNo" value="${content.contentNo }" placeholder="수정 불가합니다"  readonly>
		       <span id="helpBlock" class="help-block">
		      </span>
		    </div>
		  </div> 
		  
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">작성자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${content.userId }" placeholder="수정 불가합니다"  readonly>
		       <span id="helpBlock" class="help-block">
		      </span>
		    </div>
		  </div>
		  
<!-- 		  <div class="form-group"> -->
<!-- 		    <label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">작성일</label> -->
<!-- 		    <div class="col-sm-4"> -->
<%-- 		       <input type="text" class="form-control" id="regDate" name="regDate" value="${content.regDate }" placeholder="수정 불가합니다"  readonly> --%>
<!-- 		       <span id="helpBlock" class="help-block"> -->
<!-- 		      </span> -->
<!-- 		    </div> -->
<!-- 		  </div> -->
		 
		
		  <div class="form-group">
		    <label for="contentName" class="col-sm-offset-1 col-sm-3 control-label">게시글 제목</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="contentName" name="contentName" value="${content.contentName }">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="contentBody" class="col-sm-offset-1 col-sm-3 control-label">게시글 내용</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="contentBody" name="contentBody" value="${content.contentBody}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="boardCode" class="col-sm-offset-1 col-sm-3 control-label">게시판 코드</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="boardCode" name="boardCode" value="${content.boardCode}">
		    </div>
		  </div> 
		  
		 <div class="form-group">
		    <label for="contentCode" class="col-sm-offset-1 col-sm-3 control-label">게시글 코드</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="contentCode" name="contentCode" value="${content.contentCode}">
		    </div>
		  </div> 
		  
		   
		  <!-- 
		  <div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품 이미지</label>
		    <div class="col-sm-4">
		       <input type="file" multiple="multiple" class="form-control" id="fileName" name="fileName" value="" placeholder="file input...">
		    </div>
		  </div> -->
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-warning"  >수&nbsp;정</button>
		      <button type="button" class="btn btn-primary"  >취&nbsp;소</button>
			  <!-- <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a> -->
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>