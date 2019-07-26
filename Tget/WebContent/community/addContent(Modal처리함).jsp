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
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/css/toolbar.css" />
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
		<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
				
		<script src="/resources/javascript/common.js" ></script>
		<script src="/resources/javascript/alarm.js" ></script>
		<script src="/resources/javascript/jquery.min.js"></script>
		<script src="/resources/javascript/jquery.scrolly.min.js"></script>
		<script src="/resources/javascript/skel.min.js"></script>
		<script src="/resources/javascript/util.js"></script>
		<script src="/resources/javascript/main.js"></script>	
   <script src="//cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
   
	<style>
	.dropbtn {
  background-color: #7FFFD4;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #7FFFD4;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #7FFFD4;}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddContent();
				
				
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]:contains('취 &nbsp;소')").on("click" , function() {
				history.go(-1);
			});
		});	
			
			 
		
		///////////////////////////////////////////////////////////////////////
	function fncAddContent(){
	//Form 유효성 검증
 	
		var contentName= $("input[name='contentName']").val();
		var contentBody= $("textarea[name='contentBody']").val();
		
		if(contentName == null || contentName.length<1){
			alert("제목을 입력해 주세요.");
			return;
		}
// 		if(contentBody == null || contentBody.length<1){
// 			alert("내용을 입력해 주세요.");
// 			return;
// 		}
		
		alert("등록 되었습니다.")
		$("form").attr("method" , "POST").attr("action" , "/community/addContent").submit();
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

	
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">게시글 등록</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<div>
<!-- 		<div class="dropdown"> -->
<!--   			<button class="dropbtn">게시판 선택</button> -->
<!--   		<div class="dropdown-content"> -->
<%--    			 <a href="#" id="boardCode0" value="${search.searchCodition==1&&search.searchKeyword==0}">공지사항</a> --%>
<%--    			 <a href="#" id="boardCode1" value="${search.searchCodition==1&&search.searchKeyword==1}">자유게시판</a> --%>
<%--     		 <a href="#" id="boardCode2" value="${search.searchCodition==1&&search.searchKeyword==2}">고객센터</a>	  --%>
<!--   			</div> -->
<!-- 		</div> -->
		
		
		</div>
		<form class="form-horizontal" >
		<!-- enctype="multipart/form-data" -->
	  
<!-- 		  <div class="dropdown"> -->
<!--   			<button class="dropbtn">게시글 선택</button> -->
<!--   		<div class="dropdown-content"> -->
   			 <select id="boardCode" name="boardCode">
   			 	<option value="">게시판 선택</option>
		   			<option value="0">공지사항</option>
	   			 	<option value="1">자유게시판</option>
	   			 	<option value="2">고객센터</option>
   			 	</select> 
   			 	
   			 <select id="contentCode" name="contentCode">
   			 	<option value="">게시글 선택</option>
		   			 <c:if test="${sessionScope.user.role == '2'}">   			 		
			   			 	<option value="0">티켓 거래 공지</option>
			   			 	<option value="1">자유 게시판 이용 공지</option>
					</c:if>
			   		<option value="2">자주 찾는 질문</option>
	   			 	<option value="3">삽니다</option>
	   			 	<option value="4">팝니다</option>
	   			 	<option value="5">수다방</option>
	   			 	<option value="6">1:1 문의하기</option>
	   			 	<option value="7">환불 게시판</option>
   			 	</select>  			 
<!--   			</div> -->
<!-- 		</div> -->
		
			<select id="open" name="open">
				<option value="">공개 여부</option>
					<option value="0">공개</option>
					<option value="1">비공개</option>
			</select>	
		
		  
		  <div class="form-group">
		    <label for="userNickname" class="col-sm-offset-1 col-sm-3 control-label">회원 닉네임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userNickname" name="userNickname" value="${sessionScope.user.nickName}" readonly>
		      <input type="hidden" name="userId" value="${sessionScope.user.userId}">
		    </div>
		  </div>
 
		  <div class="form-group">
		    <label for="contentName" class="col-sm-offset-1 col-sm-3 control-label">제목</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="contentName" name="contentName">
		      
		    </div>
		  </div>
		
		  <label for="contentBody" class="col-sm-offset-1 col-sm-3 control-label">글 내용</label>
		  <hr>
		
		<textarea class="form-control" id="contentBody" name="contentBody"></textarea>
		<script type="text/javascript">
		CKEDITOR.replace('contentBody'
				, {height: 200});
		</script>
					
			<!-- <div class="custom-file">
					&nbsp;<input type="file" class="form-control-file" id="exampleFormControlFile1">
					</div> -->
	
			<br/>  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >등 &nbsp;록</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>