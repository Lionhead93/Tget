<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "수정"  Event 연결 =============
		function fncUpdateContent() {
	// Form 유효성 검증
	
			$("form").attr("method" , "POST").attr("action" , "/community/updateContent").submit();
}//===========================================//
//==> 추가된부분 : "수정"  Event 연결
 $(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $( "button.btn.btn-primary" ).on("click" , function() {
		
		 fncUpdateContent();
		
	 });
});

$(function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $( "a[href='#' ]" ).on("click" , function() {
		//Debug..
		//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
		history.go(-1);
	});
});
	
	</script>
	
</head>

<body>

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
		  
		  <div class="form-group">
		    <label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">작성일</label>
		    <div class="col-sm-4">
		       <input type="text" class="form-control" id="regDate" name="regDate" value="${content.regDate }" placeholder="수정 불가합니다"  readonly>
		       <span id="helpBlock" class="help-block">
		      </span>
		    </div>
		  </div>
		 
		
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
		  
		  
		  
		   
		  <!-- 
		  <div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품 이미지</label>
		    <div class="col-sm-4">
		       <input type="file" multiple="multiple" class="form-control" id="fileName" name="fileName" value="" placeholder="file input...">
		    </div>
		  </div> -->
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>