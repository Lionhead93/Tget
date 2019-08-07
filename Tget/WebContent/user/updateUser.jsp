<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<script type="text/javascript">
	
	var ch = 0;
	
	var cch = 0;
	
		  $(function() {
			 
		 		var rand = "";
			
				
				$("button:contains('전송')").on("click" , function() {
					swal("인증번호 전송", "", "info");
					
			
					
					
					$("#inj").show();
				
					
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
						var phone = document.getElementById("phone");
						
						var code = $("#sms").val();
			
						
					   if (rand == code) { 
				   
					   swal("인증 성공", "", "success");
					   $("#inj").hide();
						phone.style.border = "3px solid gold";
						phone.readOnly = true;
						$("#pij").hide();
					   	cch = 1;
						
				   } else
				  		 { 
					   swal("인증 실패", "", "error");
				  	 	} 
				 	   
				   });
			   }); 
	
		  $(function(){
		         $("#alert-success").hide();
		         $("input").keyup(function(){
		             var pwd1=$("#password01").val();
		             var pwd2=$("#password02").val();
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
														"<strong  class=\"text-danger\">변경할 닉네임 입력해주세요.</strong>");
												}
								
											}

										});
									});

									});
	
	
	
	
	
	
	
	
	
		//============= "수정"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("#updateUserSubmit").on("click" , function() {
				
						fncUpdateUser();
			});
		});			
		

		///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
		
			var pwd1=$("#password01").val();
            var pwd2=$("#password02").val();
        	var address1=$("input[name='address']").val();
			
			
			if(pwd1 != pwd2){
				
				swal("비밀번호가 일치하지 않습니다.", "", "error");
				return;
			}
			
		
			swal("수정 완료!", "", "success")
		 	.then(function(result){
		 		$("form[name=updateUser]").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		 	});	
			
		}
	
</script>
	

	
<div class="modal fade" id="updateUserModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
		<div class="modal-body">
	
	     <div class="login-card shadow rounded">
			 <div class="text-center" style="background-color: white;"><br/><br/>
				<div class="row">	
					<div class="col-md-3" style="margin-left: 10px;">
					<span style="color: black;"><Strong>아이디</Strong> </span>
					<br/><br/><br/>
					<span id= "h1" style="color: black; display: none;" >인증번호<br/><br/><br/><br/></span>
					
					<span style="color: black;"><Strong>비밀번호</Strong> </span>
					<br/><br/><br/><br/><br/><br/><br/>
					<span style="color: black;"><Strong>이름</Strong> </span>
				<br/><br/><br/><br/>
					<span style="color: black;"><Strong>닉네임</Strong> </span>
				<br/><br/><br/>
					<span style="color: black;"><Strong>휴대전화</Strong> </span>
						<br/><br/>
					<span style="color: black;"><Strong>주소</Strong> </span><br><br>
					
				</div>
					
					<div class="col-md-8">
							
							
					
						<form name="updateUser" class="form-horizontal">
						
						   	   <div class="form-group" >
							   
						    <input type="text" class="form-control col-md-10"  id="userId" name="userId" value="${user.userId}" readOnly/>
								
							    </div>
							    
						<br>
							  	  <div class="form-group">
							  	  <div class="input-group-prepend">
					
							      <input type="password" class="form-control col-md-10" value="${user.password}" id="password01" name="password" placeholder="비밀번호">
							    </div>
							  </div>
							  
							  
							  
							  <div class="form-group">
						 <div class="input-group-prepend">
							      <input type="password"  class="form-control col-md-10"  value="${user.password}" id="password02" name="password2" placeholder="비밀번호 확인">
							      
							  </div>
							  </div>
							 
							  <div class="form-group">
							  <label for="password3"></label>
							  <div class="text-left">
							  <span id = "alert-success"><Strong class="text-success">비밀번호가 일치합니다.</Strong>
							      </span>								
							   <span id = "alert-danger"><Strong class= "text-danger">비밀번호가 일치하지 않습니다.</Strong>
							      </span>
							  </div>    
							</div>
								
							    <div class="form-group">
							    <label for="userName"></label>
							    
							    <input type="text" class="form-control col-md-10"  id="userName" name="userName" value="${user.userName}" readOnly/>
								
							
							  </div>
							  <br>
							  <div class="form-group">
							  <div class="input-group-prepend">
							  
							  
							    <label for="nickName"></label>
							      <input type="text" class="form-control col-md-10"  id="nickName" name="nickName" value="${user.nickName}"><br>
							     
							
							  </div>
							  <div class="text-left">
							   <span id = "check" class="text-secondary"><Strong>변경할 닉네임을 입력해주세요.</Strong></span>
							  </div>
							  </div>
						
							  
							
							  
							  <div class="form-group"> 
							  <div class="input-group-prepend">
							
							    
									<input type="text" class="form-control col-md-7"  id="phone" name="phone" value="${user.phone}" >
							      &nbsp;&nbsp;&nbsp;<button id="pij" type="button" class="btn btn-outline-primary">전송</button>
							      <i id="sm2" class="far fa-grin fa-2x" style="color:Green; display:none;"></i>
							  
							  </div>
							   </div>
							   
							   <div id="inj" class="text-center" style="display:none">
							 <div class="form-group">
							   <div class="input-group-prepend">
							      <input type="text" class="form-control col-md-7"  id="sms" name="sms" placeholder="인증번호 입력">
							      &nbsp;&nbsp;&nbsp;<button id="injb2" type="button" class="btn btn-outline-primary">인증</button>
							    </div>
							  </div>
							  </div>	 
							  	<div class="text-left">
					 
								<input class="form-control col-md-10"  type="text" id="address" name="address" value="${user.address}">
								<button type="button" class="btn btn-link">주소찾기</button>
							      </div>
						
						  
							</form>						
					</div>
				</div>
				<div class="text-center">
				<button id= "updateUserSubmit" type="button" class="btn btn-outline-primary" title="반드시 휴대폰 본인인증을 하세요.">수정</button>
				<a class="btn btn-outline-danger btn" href="#" role="button" data-dismiss="modal">취 소</a>
				</div>				
				<br/>
			</div>
			</div>
			</div>		
			</div>	
	 </div>		
	 </div>
	 