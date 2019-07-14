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
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="//cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<style>
		body {
            padding-top : 30px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				alert("등록되었습니다.")
				$("form").attr("method" , "POST").attr("action" , "/community/addContent").submit();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				history.go(-1);
			});
		});	
			
			 
		
		///////////////////////////////////////////////////////////////////////
		function fncAddContent(){
	//Form 유효성 검증
 	//var name = document.detailForm.prodName.value;
	//var detail = document.detailForm.prodDetail.value;
	//var manuDate = document.detailForm.manuDate.value;
	//var price = document.detailForm.price.value;
	
	//var name= $("input[content='contentName']").val();
	
	
	if(content == null || content.length<1){
		alert("글을 입력해 주세요.");
		return;
	}
	
	$("form").attr("method" , "POST").attr("action" , "/community/getContentList").submit();
}

	$(function(){
			
		    $( "#manuDate" ).datepicker({
		    	changeMonth: true,
		        changeYear: true,
		        dateFormat: 'yy-mm-dd'			        
		    });
	});
	</script>
	
</head>

<body>

	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">신고하기</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" >
		<!-- enctype="multipart/form-data" -->
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>신고자</strong></div>
	  		<div class="col-xs-8 col-md-4">${report.whiteId}</div>
		</div>
		
		  
		  <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>신고글 내용</strong></div>
	  		<div class="col-xs-8 col-md-4">${report.contentBody}</div>
		</div>
		
		
		<div class="col-xs-4 col-md-2 "><strong>신고 사유</strong></div>
	  	<div class="col-xs-8 col-md-4">${report.reportReasonCode}
		<input type='radio' name='a' value='a'>부적절한 홍보 게시물<br>
		<input type='radio' name='b' value='b'>음란성 또는 청소년에게 부적합한 내용<br>
		<input type='radio' name='c' value='c' >특정인 대상의 비방/욕설<br>
		<input type='radio' name='d' value='d' >명예훼손/사생활 침해 및 저작권침해 등<br>
		</div>
		  <%-- <div class="form-group">
		    <label for="userNickName" class="col-sm-offset-1 col-sm-3 control-label">회원 닉네임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userNickName" name="userNickName" value="${content.userNickName}">
		      
		    </div>
		  </div> --%>
		  
		  
					
			<!-- <div class="custom-file">
					&nbsp;<input type="file" class="form-control-file" id="exampleFormControlFile1">
					</div> -->
	
			<br/>  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >신고하기</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>