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
   
	<style>
		
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		///////////////////////////////////////////////////////////////////////
	function fncAddReport(){
	//Form 유효성 검증
 	//var name = document.detailForm.prodName.value;
	//var detail = document.detailForm.prodDetail.value;
	//var manuDate = document.detailForm.manuDate.value;
	//var price = document.detailForm.price.value;
	
	//var name= $("input[content='contentName']").val();
	
		
		$("form").attr("method" , "POST").attr("action" , "/community/getReportList").submit();
	}

		
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "button.btn.btn-danger" ).on("click" , function() {
			alert("신고 접수되었습니다.")
			fncAddReport();
		});
	});	
	
	
	//============= "취소"  Event 처리 및  연결 =============
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#' ]:contains('취 &nbsp;소')").on("click" , function() {
			history.go(-1);
		});
	});	
		
		
		
	</script>
	
</head>

<body>

	
	<jsp:include page="/layout/toolbar.jsp" />
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		<div class="page-header text-center">
	       <h3 class=" text-info">신고 하기</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" >
		<!-- enctype="multipart/form-data" -->
		<input type="hidden" class="form-control" id="reportCode" name="reportCode" value="0">
		<div class="form-group">
		    <label for="contentNo" class="col-sm-offset-1 col-sm-3 control-label">게시글 번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="contentNo" name="contentNo" value="${content.contentNo}" readonly>
		      
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="whiteId" class="col-sm-offset-1 col-sm-3 control-label">신고자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="whiteId" name="whiteId" value="admin" readonly>  
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="whiteNickName" class="col-sm-offset-1 col-sm-3 control-label">신고자 닉네임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="whiteNickName" name="whiteNickName" value="나관리자얌" readonly>
		      
		    </div>
		  </div>
		<div class="form-group">
		    <label for="blackId" class="col-sm-offset-1 col-sm-3 control-label">신고 당한 사람</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="blackId" name="blackId" value="${content.userId}" readonly>
		      
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="contentBody" class="col-sm-offset-1 col-sm-3 control-label">신고글 내용</label>
		    <div class="col-sm-4">
		      ${content.contentBody}
			 </div>
		  </div>
		
		 
		<div class="col-xs-4 col-md-2 "><strong>신고 사유</strong></div>
	  	<div class="col-xs-8 col-md-4">
		<input type='checkbox' name='reportReasonCode' value='0'>부적절한 홍보 게시물<br>
		<input type='checkbox' name='reportReasonCode' value='1'>음란성 또는 청소년에게 부적합한 내용<br>
		<input type='checkbox' name='reportReasonCode' value='2' >특정인 대상의 비방/욕설<br>
		<input type='checkbox' name='reportReasonCode' value='3' >명예훼손/사생활 침해 및 저작권침해 등<br>
		</div>
		
		
		  <div class="form-group">
		    <label for="regDate" class="col-sm-offset-1 col-sm-3 control-label">작성일</label>
		    <div class="col-sm-4">
		      ${content.regDate}
		      
		    </div>
		  </div> 
		
			<br/>  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-danger"  >신고하기</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>