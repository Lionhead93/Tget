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
	
	 <script type="text/javascript">
	   $(function() {
		
		$("button:contains('전송')").on("click" , function() {
			alert("인증번호 전송");
			$.ajax({ 
				   url: "/user/sendSms",
				   data: { 
					   receiver: $("#phone").val() 
					   }, 
					   type: "post", 
					
		   success: function(result) { 
			
			   if (result == "true") { 
				   console.log(result);
				   }  else { 
					   alert("인증번호 전송 실패");
					   } 
			   }
				 }); 
			
				});
			});
	   
	   $(function() {
			
			$("button:contains('인증')").on("click" ,function(){ 
				alert("오예");
			
		   $.ajax({ 
			   url: "/user/smsCheck",
		   data: { 
			   code: $("#sms").val() 
			   }, 
			   type: "post", 
		   success: function(result){ 
			   console.log(result);
			   if (result == "true") { 
		   
			   alert("번호 인증 성공"); 
		   } else if (result == "false")
		  		 { 
			   alert("번호 인증 실패"); 
		  	 	} 
		 	  } 
		   })
	   })
	   });
	     </script>
	     
	     <script type="text/javascript">
	     
	$(function() {
				
				$("button:contains('주소찾기')").on("click" ,function(){
				    
			     	new daum.Postcode({
			            oncomplete: function(data) {
			                var address = '';

			                if (data.userSelectedType === 'R') {
			                	addresss = data.roadAddress;
			                } else { 
			                	address = data.jibunAddress;
			                }				
			               
			                $("#address").val(address);
			            }
			        }).open(); 
			 	
			 		});
				});
	     
			
			 $(function() {

					$("input[name='nickName']").on('keyup',function() {

						var inputed = $("input[name='nickName']").val();
										

						$.ajax({
						url : "/user/json/checknickNameDuplication",
						method : "POST",
						dataType : "json",
							headers : {
								"Accept" : "application/json",
							"Content-Type" : "application/json"
										},
									data : JSON.stringify({
										nickName : inputed,
										}),

									success : function(JSONData) {
														//alert(JSONData); 
														//alert(typeof(JSONData));

										if (JSONData && inputed != "") {
											$("#check").children("strong")
												.remove();
													$("#check")
														.append(
														"<strong class=\"text-success\">사용 가능합니다.</strong>");
												} else {
													$("#check").children("strong")
															.remove();
													$("#check")
														.append(
														"<strong  class=\"text-danger\">사용 불가능합니다.</strong>");
												}
											if (inputed == "") {
												$("#check").children("strong")
													.remove();
												$("#check")
														.append(
																"<strong class=\"text-muted\">닉네임을 입력해주세요.</strong>");
											}
											}

										});
									});

									});
	
	
	
	
	
	
	
	
	
		//============= "수정"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("button:contains('수정')").on("click" , function() {
						alert("오예");
				fncUpdateUser();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("button:contains('취소')").on("click" , function() {
						alert("오예");
				$("form")[0].reset();
			});
		});	
		

		///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
			var name=$("input[name='userName']").val();
			
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
				
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		}
	
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">회원정보수정</h3>
	       
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아 이 디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" placeholder="중복확인하세요"  readonly>
		       <span id="helpBlock" class="help-block">	      	
		      </span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="변경비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="변경비밀번호 확인">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" placeholder="변경회원이름">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="nickName" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" value="${user.nickName}"placeholder="닉네임">
		      <span id = "check"><Strong>닉네임을 입력해주세요</Strong>
		      </span>
		    </div>
		  </div>
		  
	
		  
		
		  
		  <div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">휴대전화</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="phone" name="phone" placeholder="'-' 없이 입력해주세요." value="${user.phone}"><button type="button" class="btn btn-primary">전송</button>
		       
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="sms" class="col-sm-offset-1 col-sm-3 control-label">인증번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="sms" name="sms" placeholder="인증번호">
		      <button type="button" class="btn btn-primary">인증</button>
		      <span id = "check2"><Strong>인증번호를 입력해주세요</Strong></span>
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
		    <div class="col-sm-4">
		    
		      <input type="text" class="form-control" id="address" name="address" value="${user.address}" >
		      <button type="button" class="btn btn-link">주소찾기</button>
		    </div>
		      </div>
		      
		        <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">위치정보문의</label>
		    <div class="col-sm-4">
		     <input type="checkbox" id= "local" name="local" value="1" checked="checked"> 동의
		     <input type="checkbox" id= "local" name="local" value="2"> 비동의
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>