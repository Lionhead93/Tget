<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge" />
	
 
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		<script src="/resources/javascript/common.js" ></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	</script>		
    
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
			
		  
		  <script type="text/javascript">

		  $(function() {
				
				$("button:contains('전송')").on("click" , function() {
					alert("인증번호 전송");
					$.ajax({ 
						   url: "/user/json/sendSms",
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
					
				   var btn = document.getElementById('btn');
				   
					$("button:contains('인증')").on("click" ,function(){ 
						//alert("오예");
					
				   $.ajax({ 
					   url: "/user/json/smsCheck",
				   data: { 
					   code: $("#sms").val() 
					   }, 
					   type: "post", 
				   success: function(result){ 
					   console.log(result);
					   
					   
					   
					   if (result == "true") { 
				   
					   alert("인증 성공");
					   
					 
					   btn.disabled = false;

					   
				   } else if (result == "false")
				  		 { 
					   alert("인증 실패"); 
				  	 	} 
				 	  } 
				   })
			   })
			   });
			   
			   $( function() {
					
					$("#userName").focus();
					
					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("button:contains('찾기')").on("click" , function() {
						
						alert("눌리니");
				
						 $.ajax({ 
							   url: "/user/json/findPassword",
						   data: { 
							   userId: $("#userId").val()
							   }, 
							   type: "post", 
							   
						   success: function(result){ 
							   console.log(result);
							   
							   if(result == "no"){
								   $('#findpassword').modal('hide');
								   alert("입력하신 정보의 회원정보가 없습니다");
								   
							   }
							  
						   }
							   });
				});	
					});
				
			   $(function(){
			         $("#alert-success").hide();
			         $("#alert-danger").hide();
			         $("input").keyup(function(){
			             var pwd1=$("#password").val();
			             var pwd2=$("#password2").val();
			             if(pwd1 != "" || pwd2 != ""){
			                 if(pwd1 == pwd2){
			                	 
			                 	$("#check1").show();
			                     $("#alert-success").show();
			                     $("#alert-danger").hide();
			                     $("#submit").removeAttr("disabled");
			                 }else{
			                	 
			                	 $("#check1").hide();	
			                     $("#alert-success").hide();
			                     $("#alert-danger").show();
			                     $("#submit").attr("disabled", "disabled");
			                 }    
			             }
			         });
			     });

			   $(function() {
					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
							$("button:contains('변경')").on("click" , function() {
			   
								$("form").attr("method" , "GET").attr("action" , "/user/updatePassword").submit();
				
							});
			   });
			   
		     </script>
				
		  <form class="form-horizontal">
		  <h4 align="center">비밀번호 찾기</h4>
			<hr/>
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">아이디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
		    </div>
		  </div>
		
		
		  
		  <div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">휴대전화</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="phone" name="phone" placeholder="'-' 없이 입력해주세요."><button type="button" class="btn btn-primary">전송</button>
		       
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="sms" class="col-sm-offset-1 col-sm-3 control-label">인증번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="sms" name="sms" placeholder="인증번호">
		      <button type="button" class="btn btn-primary">인증</button>
		    </div>
		  </div>
		  
	
			
			<div class="form-group" align="center">
		      <button type="button" id= "btn" class="btn btn-primary" data-toggle="modal" data-target="#findpassword" disabled="disabled">찾기</button>
			  <a class="btn btn-danger btn" href="#" role="button" >취&nbsp;소</a>
		</div>
		
				
 
		<div class="modal fade" id="findpassword" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-lg" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="modalCenterTitle">변경할 비밀번호 설정</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					     <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <img src="/resources/images/check.jpg" width="25" height="25" id="check1" style="display:none;"/> <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
		      
		    </div>
		  </div>

		  <div class="form-group">
		  <label for="password3" class="col-sm-offset-1 col-sm-3 control-label"></label>
		<!--   <div class="col-sm-4" id="alert-success">비밀번호가 일치합니다.</div> -->
		  <span id = "alert-success"><Strong class="text-success">비밀번호가 일치합니다.</Strong>
		      </span>
			<!-- <div class="col-sm-4" id="alert-danger">비밀번호가 일치하지 않습니다.</div> -->
			<span id = "alert-danger"><Strong class= "text-danger">비밀번호가 일치하지 않습니다.</Strong>
		      </span>
		</div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">변경</button>
					      </div>
					    </div>
					  </div>
	</div>	
	</form>			
 	
	</body>

</html>