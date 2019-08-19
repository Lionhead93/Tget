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
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>		
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>

		body {
			  background-color: #EBF7FF;
			  font-family: 'Nanum Gothic', sans-serif;
		}
		a{
			color: #041625;
		}
    </style>


    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

	var ch = 0;
	
	var cch = 0;
	
		  $(function() {
			 
		 		var rand = "";
		 		

				
				$("button:contains('전송')").on("click" , function() {
					var phone = $("input[name='phone']").val();						
					
					if (phone == null || phone.length != 11) {
						swal("올바른 전화번호를 입력하세요.", "", "error");
						return;
					}


					swal("인증번호 전송", "", "info");
					$("#inj").show();
					$("#h2").show();
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
				   
				   
					$("button:contains('인증')").on("click" ,function(){ 
				
						var join = document.getElementById('join');
		
						var phone = document.getElementById("phone");
						
						var code = $("#sms").val();
			
						
					   if (rand == code) { 
				   
					   swal("인증 성공!", "", "success");
					   $("#inj").hide();
						phone.style.border = "2px solid olive";
						phone.readOnly = true;
						$("#pij").hide();
					   	cch = 1;
					   	$("#h2").hide();
					    $("#sm2").show();

				   } else
				  		 { 
					   swal("인증 실패!", "", "error");
				  	 	} 
				 	   
				   });
			   }); 
	
	
	
	
			   $(function(){
			         $("#alert-success").hide();
			         $("#alert-danger").hide();
			         $("input").keyup(function(){
			             var pwd1=$("#password01").val();
			             var pwd2=$("#password02").val();
			             if(pwd1.length<8){
			            	 
			            	 
			            	 
			             }
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
						
						$("button:contains('가 입')").on("click" , function() {
					
						 fncAddUser(); 
						 
						
						});
					});	 
			     
			     
			     function fncAddUser() {
						
						var id=$("input[id='userId01']").val();
						var id2=$("select[id='userId02']").val();
						var nickName=$("input[name='nickName']").val();
						var pw=$("input[id='password01']").val();
						var pw_confirm=$("input[id='password02']").val();
						var name=$("input[name='userName']").val();
						var address1=$("input[name='address']").val();
						var address2=$("input[name='address2']").val();
						if(id == null || id.length <1){
							swal("아이디는 반드시 입력하셔야 합니다.", "", "warning");
							return;
						}
		
						if(name == null || name.length <1){
							swal("이름은  반드시 입력하셔야 합니다.", "", "warning");
							return;
						}
						
						if( pw != pw_confirm ) {
							swal("비밀번호 확인이 일치하지 않습니다.", "", "warning");
							$("input:text[id='password02']").focus();
							return;
						}
						
						
						if(ch !=1 ){
							swal("반드시 이메일 인증을 해야함.", "", "warning");
							return;
							
						}
						
						if(cch !=1 ){
							swal("반드시 휴대전화 인증을 해야함.", "", "warning");
							return;
							
						}
						
						
						var userId = id+id2;
						
			 			var address = address1+"/"+address2;
						
						
						
					 	$("input[name='address']").val(address); 
					 	
					 	swal("가입 성공!", nickName+" 님 환영합니다!", "success")
					 	.then(function(result){
					 		$("form[name='addUser']").attr("method" , "POST").attr("action" , "/user/addUser").submit();
					 	});
					 	
					}
			     
			     
			     
			     
				   $(function() {
						//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
						$("a:contains('취 소')").on("click" , function() {
							self.location = "/"
						});
					});	  				 
			     
					$(function() {
						
						$("button:contains('주소찾기')").on("click" ,function(){
						    
					     	new daum.Postcode({
					            oncomplete: function(data) {
					                var address = '';

					                if (data.userSelectedType === 'R') {
					                	address = data.roadAddress;
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
											}) ,

								success : function(JSONData) {
																
										if (JSONData && inputed != "") {
											$("#check").children("strong")
											.remove();
											$("#check")
											.append(
											"<strong class=\"text-success\">사용 가능합니다.</strong>");
											$("#check2").show();
											} else {
															
											$("#check2").hide();
											$("#check").children("strong")
											.remove();
											$("#check")
											.append(
											"<strong  class=\"text-danger\">사용 불가능합니다.</strong>");
												}
										
											if (inputed == "") {
														
												$("#check2").hide();
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
					 
					 
									$(function() {
												 
												var check = "";
										
												$("button:contains('인 증')").on("click" , function() {
													
													var Id = $("input[id='userId01']").val();
													
													
													if(Id == null || Id.length <1){
														swal("아이디는 반드시 입력하셔야 합니다.", "", "warning");
														return;
													}	
													
													
													
													
													swal("인증번호 발송", "", "info");
													
													 $("#divemail").show();
												 	
												 	 $.ajax({ 
														   url: "/user/rest/mailSender",
														   type: "post",
														   dataType:"json" ,
														   data: { 
															  Email: $("input[id='userId01']").val()+
															  $("#userId02").val(),
															 
														   },
														   beforeSend : function(){
															 
															   $('#loading').html("<div class='spinner-border text-primary' role='status'>"+
															            "<span class='sr-only'>Loading...</span>"+
															            "</div>");
															   
														   },
														   success : function(JSONData){
															console.log(JSONData);
															 $('#loading').html("");
															
															if(JSONData.msg== "bad"){
																swal("이미 존재하는 아이디입니다.", "", "warning");
															}else
															check = JSONData.check;
															} 
														   
														   
												 	});  
												});
												
												
											$("button:contains('확인')").on("click" , function() {
												
												var id=$("input[id='userId01']").val();
												var id2=$("select[id='userId02']").val();
												var userCheck = $("#emailcode").val();		
												var userId = document.getElementById("userId01");
												if(check.trim()==userCheck.trim()){
													swal("인증성공", "", "success");
													userId.value = id+id2;
													userId.style.border = "2px solid olive";
													userId.readOnly = true;
													 $("#divemail").hide();
													 $("#userId02").hide();
													 $("#injb").hide();
													 ch = 1;
													 $("#addon-wrapping").hide();
													 $("#sm1").show();
												}else{
													swal("인증실패", "", "error");
												}
												
												
											});
												
												
									});
							
									
									
									$(function() {
										$("input[name='phone']").on('keyup',function() {

											
									 $(this).val($(this).val().replace(/[^0-9]/g,""));
									 
										});
									   });
	
									$(function() {
										$("input[name='userName']").on('keyup',function() {

											
											  if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
									               var inputVal = $(this).val();
									               $(this).val(inputVal.replace(/[^(ㄱ-히a-zA-Z)]/gi, ''));
									            }
									         });
									 });
	
									$(function() {
									$("input[name='userId']").on('keyup',function() {
										
										 if (!(event.keyCode >=37 && event.keyCode<=40)) {
						                        var inputVal = $(this).val();
						                        $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
						                    }
						                });
									
									  });
									
									
									
	</script>		
    
</head>

<body>
	<jsp:include page="/layout/tgetToolbar.jsp"/>
                          
		<div class="container">
	<div class="row">
	<div class="col-lg-1"></div>
	
	<div class="col-lg-10">
	<br/><br/><br/><br/>
	<div class="login-card shadow rounded" style="color:black;">
	
    <div class="card form" id="form1">
    
    <div class="card-header" align="center" style="background-color: smokegray;">
    	
    	<h3><i class="fas fa-user-check"></i> T-GET 회원가입<br/></h3>
                            
    </div>
			 <div style="background-color: white;">
			
			 
			 <br/><br/>
					<div class="row">	
					 <div class="col-md-1"></div>
					<div class="col-md-2" >
					<span style="color: black;">아이디 </span>
					<br/><br/><br/>
					<span style="color: black;">비밀번호 </span>
					<br/><br/><br/><br/><br/><br/>
					<span style="color: black;">이름</span>
				<br/><br/>
					<span style="color: black;">닉네임 </span>
				<br/><br/><br/>
					<span style="color: black;">휴대전화 </span>
						<br/><br/><br/><br/>
					<span id= "h2" style="color: black;  display: none;" >
<br/><br/></span>
		
					<span style="color: black;">주소 </span><br/><br/><br/><br/>
				<span style="color: black;">상세주소 </span><br/><br/><br/>
				<span style="color: black;">위치정보 문의 </span><br/><br/><br/>
				</div>
			
					
					<div class="col-md-8">
							
							
					
						<form name="addUser" class="form-horizontal">
						
						   <div class="form-group" >
							    <div class="input-group-prepend">
							<input type="text" class="form-control col-md-5" name="userId" id="userId01" maxlength="15" style="width:23%" > 
    							<span class="input-group-text" id="addon-wrapping">@</span>
  
							 <select class="custom-select col-md-3" name="userId2" id="userId02" style="width:23%" >
							      <option  id = "ig" value="@naver.com">naver.com</option>
							      <option  id = "ig" value="@daum.net">daum.net</option>
							      <option  id = "ig" value="@nate.com">nate.com</option>
							      <option id = "ig"  value="@gmail.com">gmail.com</option>
							      <option id = "ih" value="">직접입력</option>							     
							  </select>
							     　<button id="injb" type="button" class="btn btn-outline-primary">인 증</button><i id="sm1" class="far fa-grin fa-2x" style="color:Green; display:none;"></i>
							    <div id="loading"></div>
								</div>

							    </div>
							    
							      <div class="form-group">							     
							      <div id="divemail" style="display:none;">
							      <div class="input-group-prepend">
							      <input type="text"  class="form-control" id="emailcode" name="emailcode" placeholder="인증번호" style="width:73%">&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-primary">확인</button>
							      </div>
								  </div>
								  </div>
							  
							  	  <div class="form-group">
							  	  <div class="input-group-prepend">
					
							      <input type="password" class="form-control col-md-10"  id="password01" name="password" placeholder="비밀번호">
							    </div>
							  </div>
							  
							  
							  
							  <div class="form-group">
						 <div class="input-group-prepend">
							      <input type="password"  class="form-control col-md-10"   id="password02" name="password2" placeholder="비밀번호 확인">
							      
							  </div>
							  </div>
							 
							  <div class="form-group">
							  <label for="password3"></label>
						
							
							  <span id = "alert-success"><Strong class="text-success">비밀번호가 일치합니다.</Strong>
							      </span>
							
								<span id = "alert-danger"><Strong class= "text-danger">비밀번호가 일치하지 않습니다.</Strong>
							      </span>
							</div>
								
							    <div class="form-group">
							      <div class="input-group-prepend">
							    <label for="userName"></label>
					
							      <input type="text" class="form-control col-md-10"  id="userName" name="userName" placeholder="회원이름">
							   </div>
							  </div>
							  
							  <div class="form-group">
							  <div class="input-group-prepend">
							  
							  
							    <label for="nickName"></label>
							      <input type="text" class="form-control col-md-10"   id="nickName" name="nickName" placeholder="닉네임"><br>
							     
							
							  </div>
							   <span id = "check"><Strong class= "text-danger">닉네임을 입력해주세요.</Strong>
							      </span>
							    </div>
						
							  
							
							  
							  <div class="form-group"> 
							  <div class="input-group-prepend">
							
							    
					
							      <input class="form-control"   type="text" id="phone" name="phone" placeholder="'-' 없이 입력해주세요." style="width:73%">　<button id="pij" type="button" class="btn btn-outline-primary">전송</button>
							      <i id="sm2" class="far fa-grin fa-2x" style="color:Green; display:none;"></i>
							  
							  </div>
							   </div>
							 <div id="inj" class="form-group" style="display:none">
							   <div class="input-group-prepend">
							      <input type="text" class="form-control"  id="sms" name="sms" placeholder="인증번호를 입력해주세요." style="width:73%">&nbsp;&nbsp;&nbsp;
							      <button id="injb2" type="button" class="btn btn-outline-primary">인증</button>
							  </div>
							  </div>
							  <div id="emailSend" style="display: none;"> 전송중.... </div>		 
							  <div>
							    <label for="ssn"></label>
					 
								<input class="form-control col-md-10"  type="text" id="address" name="address" >
								<button type="button" class="btn btn-link">주소찾기</button>
							      </div><br>
								<input class="form-control col-md-10"  type="text" id="address2" name="address2" >
							        <div class="form-group">
							        <br/><br/>
							   
							    <div style="padding-top: 6px;">
							     <input type="radio" id= "local" name="local" value="1" checked="checked" /> 동의
							     <input type="radio" id= "local" name="local" value="2" /> 비동의
							    </div>
							  </div>
	<br/>
	
						  
							</form>
						
							</div>
							<div class="col-md-1"></div>							
							</div>
							<div class="text-center">							
							      <button id= "join" type="button" class="btn btn-outline-primary" title="반드시 휴대폰 본인인증을 하세요.">가 입</button>
								  <a class="btn btn-outline-danger btn" href="#" role="button">취 소</a><br/>	<br/>								
					 		</div>
							</div>
							</div>
							
						</div>	
					</div>
					<div class="col-lg-1">
					</div>
					</div>
	</div>					
	<jsp:include page="/layout/footer.jsp"/>
</body>

</html>