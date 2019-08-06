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
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">	
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
		<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>

		body {
			  background-color: white;
			  font-family: 'Nanum Gothic', sans-serif;
		}
		a{
			color: #041625;
		}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	</script>		
    
</head>

<body>

		  
		  <script type="text/javascript">

		  
		  $(function() {

				$("input[name='userId']").on('keyup',function() {

					var inputed = $("input[name='userId']").val();
									

					
					$.ajax({
					url : "/user/json/checkuserIdDuplication",
					method : "POST",
					dataType : "json",
						headers : {
							"Accept" : "application/json",
						"Content-Type" : "application/json"
									},
								data : JSON.stringify({
									userId : inputed,
									}) ,

								success : function(JSONData) {
													//alert(JSONData); 
													//alert(typeof(JSONData));

									if (JSONData && inputed != "") {
										$("#check").children("strong")
											.remove();
												$("#check")
													.append(
													
												
													"<strong  class=\"text-danger\">회원 정보가 없습니다.</strong>");
												document.getElementById("ff").style.display = "none" ;
												document.getElementById("p1").style.display = "none" ;
												document.getElementById("p2").style.display = "none" ;
												
											} else {
												
												
												$("#check").children("strong")
														.remove();
												$("#check")
													.append(
													"<strong class=\"text-success\">휴대전화 인증을 해주세요.</strong>");
												document.getElementById("ff").style.display = "block" ;
												document.getElementById("p1").style.display = "block" ;
												document.getElementById("p2").style.display = "block" ;
											}
										if (inputed == "") {
											
											
											$("#check").children("strong")
												.remove();
											$("#check")
													.append(
															"<strong class=\"text-muted\">아이디를 입력해주세요.</strong>");
											
									
										}
										}

									});
								});

								});
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  $(function() {
				
			  var rand = "";
			  
				
				$("button:contains('전송')").on("click" , function() {
					alert("인증번호 전송");
					
					$.ajax({ 
						
						   url: "/user/json/sendSms",
						   data: { 
							   receiver: $("#phone").val() 
							   }, 
							   type: "post", 
							   dataType:"json", 
	
							   
							   success : function(JSONData){
									console.log(JSONData);   
					
									rand = JSONData.rand;
						   
						   }  
					
					
						});
					
					});
			   
				   var btn = document.getElementById('btn');
				   
				   var code = $("#sms").val();
				   
					$("button:contains('인증')").on("click" ,function(){ 
						//alert("오예");
					
					var btn = document.getElementById('btn');
				   
				   var code = $("#sms").val();
						
				
					   
					   
				   if (rand == code) { 
					   
					   alert("인증 성공");
					   
						
					
						document.getElementById("btn").style.display = "block" ;
						
						phone.style.border = "3px solid gold";
						phone.readOnly = true;
						$("#p2").hide();
						
				   } else
			  		 { 
				   alert("인증 실패"); 
			  	 	} 
				 	  
		   });
				   });
			
			   $( function() {
					
					$("#userName").focus();
					
					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("button:contains('찾기')").on("click" , function() {
						
			
				
						 $.ajax({ 
							   url: "/user/json/findPassword",
						   data: { 
							   userId: $("#userId").val(),
							   phone : $("#phone").val(),
							   }, 
							   type: "post", 
							   
						   success: function(result){ 
							   console.log(result);
							   
							   if(result == "no"){
								   alert("잘못된 회원정보 입니다.");
								   $('#find').modal("hide");
								 
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
			                	 
			                     $("#alert-success").show();
			                     $("#alert-danger").hide();
			                     $("#submit").removeAttr("disabled");
			                 }else{
			                	 
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
			   
			   
			   $(function() {
			   $("button:contains('취소')").on("click" , function() {
				  
			   		self.close();
			   
			   });
			   });
			   
			   
				$(function() {
					$("input[name='phone']").on('keyup',function() {

						
				 $(this).val($(this).val().replace(/[^0-9]/g,""));
			
				 
					});
				   });

			   
			   
		     </script>
				
		  <form class="form-horizontal">
		  <h4 align="center">비밀번호 찾기</h4>
			<hr/><br/>
			<div class="text-center">
			
		<div>
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">아이디</label>
		    <div class="text-center">
		      <input type="text" id="userId" name="userId" placeholder="아이디"><br>
		       <span id = "check"><Strong>아이디를 입력해주세요</Strong>
							      </span>
		    </div>
		  </div>
		
		
		  <br/>
		  <div id ="p1" style="display:none;">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">휴대전화</label>
		    <div class="text-center">
		      <input type="text" id="phone" name="phone" placeholder="'-' 없이 입력해주세요."><button type="button" class="btn btn-outline-primary">전송</button>
		       
		    </div>
		  </div>
		  <br/>
		  <div id ="p2" style="display:none;">
		    <label for="sms" class="col-sm-offset-1 col-sm-3 control-label">인증번호</label>
		    <div class="text-center">
		      <input type="text" id="sms" name="sms" placeholder="인증번호">
		      <button type="button" class="btn btn-outline-primary">인증</button>
		    </div>
		  </div>
		  
	<br/><br/><br/>
			
			<div id= "ff" class="form-group" align="center">
		      <button type="button" id= "btn" class="btn btn-outline-primary" 
		      data-toggle="modal" data-target="#find" style="display:none;">찾기</button>
		     </div><div>
			   <button type="button" id= "btn2" class="btn btn-outline-danger btn">취소</button>
		</div>
		
				
 
		<div class="modal fade" id="find" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
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
		   <div class="text-center">
		      <input type="password" id="password" name="password" placeholder="비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		   <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="text-center">
		      <input type="password"id="password2" name="password2" placeholder="비밀번호 확인">
		      
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
	</div>
	</form>			
 	
	</body>

</html>