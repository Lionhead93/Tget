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
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
	
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
		<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
									if (JSONData && inputed != "") {
										$("#check").children("strong")
											.remove();
												$("#check")
													.append(
													
												
													"<strong  class=\"text-danger\">회원 정보가 없습니다.</strong>");
												document.getElementById("p1").style.display = "none" ;
												document.getElementById("p2").style.display = "none" ;
												
											} else {
												
												
												$("#check").children("strong")
														.remove();
												$("#check")
													.append(
													"<strong class=\"text-success\">휴대전화 인증을 해주세요.</strong>");
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
					swal("인증번호 전송", "", "info");
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
					var btn = document.getElementById('btn');
				   
				   var code = $("#sms").val();
						
				
					   
					   
				   if (rand == code) { 
					   				   					
					   swal("인증 성공", "", "success");
						phone.style.border = "3px solid gold";
						phone.readOnly = true;
						$("#p2").hide();
						$("#check").hide();
						$("#sendRend").hide();
						$("#p3").show();
				   } else
			  		 { 
					   swal("인증 실패", "", "error");
			  	 	} 
				 	  
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
			                     $("#changeButton").show();
			                 }else{
			                	 
			                     $("#alert-success").hide();
			                     $("#changeButton").hide();
			                     $("#alert-danger").show();
			                 }    
			             }
			         });
			     });

			   $(function() {
					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
							$("button:contains('변경')").on("click" , function() {
								swal("변경 성공!", "", "success")
								.then(function(result){
									$("form").attr("method" , "GET").attr("action" , "/user/updatePassword").submit();
									window.close();
								});								
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
		  <h4 align="center"><strong>T-GET 비밀번호 찾기</strong></h4>
			<br/>
			
			<div class="form-group row">	
			  <div class="col-3 text-right" style="padding-top: 8px;">아이디 </div>		    
			    <div class="col-6">
			         <input type="text" class="form-control" id="userId" name="userId" value="" placeholder="아이디를 입력해주세요."/>
			    </div>	
			    <div class="col-3"></div>	    		    
			  </div>
			  <div id ="p1" style="display:none;">		
				  <div class="form-group row">
				    <div class="col-3 text-right" style="padding-top: 8px;">휴대전화 </div>		    
					 <div class="col-6">
					      <input type="text" class="form-control" id="phone" name="phone" value="" placeholder="'-' 없이 입력해주세요."/>
					 </div>	
					 <div class="col-3"><button type="button" id="sendRend" class="btn btn-outline-primary">전송</button></div>		    
				  </div>
		  	  </div>
		  <div id="check" class="text-center" style="margin-bottom: 8px;">
		  	
		  </div>
		  <div id ="p2" style="display:none;">
		  		<div class="form-group row">
					 <div class="col-3 text-right" style="padding-top: 8px;">인증번호 </div>		    
					 <div class="col-6">
					      <input type="text" class="form-control" id="sms" name="sms" value="" placeholder="인증번호"/>
					 </div>	
					 <div class="col-3"><button type="button" class="btn btn-outline-primary">인증</button></div>		    
				  </div>
		  </div>
		  <div id ="p3" style="display:none;">
		  		<div class="form-group row">
					 <div class="col-3 text-right" style="padding-top: 8px;">비밀번호 </div>		    
					 <div class="col-6">
					      <input type="password" class="form-control" id="password" name="password" value="" placeholder="비밀번호"/>
					 </div>	
					 <div class="col-3"></div>		    
				</div>
				<div class="form-group row">
					 <div class="col-3 text-right" style="padding-top: 8px;">확인 </div>		    
					 <div class="col-6">
					      <input type="password" class="form-control" id="password2" name="password2" value="" placeholder="비밀번호 확인"/>
					 </div>	
					 <div class="col-3"></div>
					  					  		    
				</div>				
		  </div>
			<div class="text-center" style="margin-bottom: 8px;">
					<span id = "alert-success"><Strong class="text-success">비밀번호가 일치합니다.</Strong>
				      </span>
					<!-- <div class="col-sm-4" id="alert-danger">비밀번호가 일치하지 않습니다.</div> -->
					 <span id = "alert-danger"><Strong class= "text-danger">비밀번호가 일치하지 않습니다.</Strong>
				     </span>				     
			</div>
		<div class="text-center">
			   <button type="button" id="changeButton" class="btn btn-outline-primary" style="display: none;">변경</button>
			   <button type="button" id= "btn2" class="btn btn-outline-danger btn">취소</button>
		</div>
		
	</form>			
 	
	</body>

</html>