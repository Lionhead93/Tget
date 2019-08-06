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
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   				
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
	
	<!-- ToolBar Start /////////////////////////////////////-->

			
		  
		  <script type="text/javascript">

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
			   
			  
					
				$("button:contains('인증')").on("click" ,function(){ 
				   
				 
					var phone = document.getElementById("phone");
					
					var code = $("#sms").val();
					
						//alert("오예");
					
		
					   
					   if (rand == code) { 
						   
						   alert("인증 성공");
						   
							phone.readOnly = true;
						
					   btn.disabled = false;

					   
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
						
					//	alert("눌리니");
						
					
						
						 $.ajax({ 
							   url: "/user/json/finduserId",
						   data: { 
							
							   userName: $("#userName").val(), 
							   phone: $("#phone").val(), 
							   }, 
							   type: "post", 
							   dataType:"json", 
							   
							   
							   success : function(JSONData){
									console.log(JSONData);   
							   
							   if(JSONData.msg== "no"){
								   
								   alert("입력하신 정보의 회원정보가 없습니다");
							   }
							   else if(JSONData.msg== "yes"){
								   
							   
								   alert(JSONData.Id);
							   }
						   }
							   });
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
					$("input[name='phone']").on('keyup',function() {

						
				 $(this).val($(this).val().replace(/[^0-9]/g,""));
				 //alert("숫자만 입력하셔야 합니다.");
				 
					});
				   });

				 $(function() {
					   $("button:contains('취소')").on("click" , function() {
						
					   		self.close();
					   
					   });
					   });
			   
			   
		     </script>
				
		  <form class="form-horizontal">
		  <h4 align="center">아이디 찾기</h4>
			<hr/><br/>
			<div class="text-center">
		<div>
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label"><Strong>이름</Strong></label>
		    <div class="text-center">
		      <input type="text" id="userName" name="userName" class="input" placeholder="회원이름">
		    </div>
		  </div>
		
		
		  <br/>
		  <div>
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label"><Strong>휴대전화</Strong></label>
		    <div class="text-center">
		      <input type="text" id="phone" name="phone" class="input" placeholder="'-' 없이 입력해주세요."><button type="button" class="btn btn-outline-primary">전송</button>
		       
		    </div>
		  </div>
		  <br/>
		  <div id = "injj">
		    <label for="sms" class="col-sm-offset-1 col-sm-3 control-label"><Strong>인증번호</Strong></label>
		    <div class="text-center">
		      <input type="text" class="text-center"  class="input" id="sms" name="sms" placeholder="인증번호">
		      <button type="button" class="btn btn-outline-primary">인증</button>
		    </div>
		  </div>
		  
	<br/><br/><br/>
	<br/>
		  <div>
		    <div class="text-center">
		     
		      <button type="button" id ="btn" class="btn btn-outline-primary" disabled="disabled">찾기</button> 
		      
		  			 <button type="button" id ="btn" class="btn btn-outline-danger btn">취소</button> 
			 
			  
		    </div>
 			 </div>
		  
		  
		</div>	
		</form>
		
</body>

</html>