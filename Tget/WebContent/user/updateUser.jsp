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
       body{	
		      color: #FBFCFE ;		  
			  background-color: #062038;
			  margin-top: 50px;				
			  font-family: 'Nanum Gothic', sans-serif;
		}
		a{
			color: #FBFCFE ;	
		}
		hr{
			border: 1px groove white;
		}
		.list-group-item{
			  margin-left:50px;	
			  color: #FBFCFE ;
			  border: 1px groove white;		  
			  background-color: #062038;
		}
		.col-2{
		}	
		.col-lg-3{			
			margin-bottom: 20px;
		}
		.row.in{
			margin-left:50px;
			margin-right: 50px;
		}
		.border{
			padding-top: 20px;
			background-color: #193147;
		}
		section{
			margin-left: 100px;
		}
		#inputGroupSelect01, nav{
			background: rgba(4, 22, 37, 0.75);
			color: #c0c5c9;
		} 
		#tgetHeader{
			margin-top:30px;
		   color: #FBFCFE;	
	       padding-top: 30px;
	       padding-bottom: 70px;
	       margin-bottom: 30px;
	       		background: url(/resources/images/pic05.jpg) no-repeat center center fixed; 
				  -webkit-background-size: cover;
				  -moz-background-size: cover;
				  -o-background-size: cover;
				  background-size: cover;	
       } 
       #footer{
			background-color: #1B1B1F;
		}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	var ch = 0;
	
	var cch = 0;
	
		  $(function() {
			 
		 		var rand = "";
			
				
				$("button:contains('전송')").on("click" , function() {
					alert("인증번호 전송");
					
			
					
					
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
				
						var join = document.getElementById('join');
		
						var phone = document.getElementById("phone");
						
						var code = $("#sms").val();
			
						
					   if (rand == code) { 
				   
					   alert("인증 성공");
					   
					   $("#inj").hide();
						phone.style.border = "3px solid gold";
						phone.readOnly = true;
						$("#pij").hide();
					   	cch = 1;
						
				   } else
				  		 { 
					   alert("인증 실패"); 
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
														"<strong  class=\"text-danger\">변경할 닉네임 입력해주세요.</strong>");
												}
								
											}

										});
									});

									});
	
	
	
	
	
	
	
	
	
		//============= "수정"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("button:contains('수정')").on("click" , function() {
				
						fncUpdateUser();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
 
			   $(function() {
			   $("button:contains('취소')").on("click" , function() {
				  
			   		self.close();
			   
			   });
			   });

		///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
		
			var pwd1=$("#password").val();
            var pwd2=$("#password2").val();
        	var address1=$("input[name='address']").val();
			var address2=$("input[name='address2']").val();
			
			
			if(pwd1 != pwd2){
				
				alert("비밀번호가 일치하지 않습니다.");	
				return;
			}
			
			var address = address1+address2;
			
			
			
		 	$("input[name='address']").val(address); 
			
				
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		}
	
	</script>
	
</head>

<body>

	
	<!--  화면구성 div Start /////////////////////////////////////-->
	
		<div class="page-header text-center">
	       <h3 class=" text-info">회원정보수정</h3>
	       
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
	    
	     <div class="login-card" style="margin-left:400px; margin-right: 400px; color:black;">
                    <div class="card form" id="form1">
                        <div class="card-header" align="center" style="background-color: Lime;">
                            <h3><i class="fas fa-user-edit"></i><br/></h3>
                            
                        </div>
			 <div class="text-center" style="background-color: white;"><br/><br/>
					<div class="row">	
					<div class="col-md-3" style="margin-left: 10px;">
					<span style="color: black;"><Strong>아이디</Strong> </span>
					<br/><br/><br/>
					<span id= "h1" style="color: black; display: none;" >인증번호<br/><br/><br/><br/></span>
					
					<span style="color: black;"><Strong>비밀번호</Strong> </span>
					<br/><br/><br/><br/><br/><br/>
					<span style="color: black;"><Strong>이름</Strong> </span>
				<br/><br/><br/>
					<span style="color: black;"><Strong>닉네임</Strong> </span>
				<br/><br/><br/>
					<span style="color: black;"><Strong>휴대전화</Strong> </span>
						<br/><br/><br/><br/>
					<span id= "h2" style="color: black;  display: none;" >인증번호<br/><br/><br/><br/></span>
		
					<span style="color: black;"><Strong>주소</Strong> </span>
				</div>
					
					<div class="col-md-8">
							
							
					
						<form class="form-horizontal">
						
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
							     <div class="input-group-prepend">
							        <div id="divemail" style="display:none;">인증번호
							      <input type="text"  class="form-control" id="emailcode" name="emailcode" placeholder="인증번호"><button type="button" class="btn btn-outline-primary">확인</button>
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
							<!--   <div class="col-sm-4" id="alert-success">비밀번호가 일치합니다.</div> -->
							
							  <span id = "alert-success"><Strong class="text-success">비밀번호가 일치합니다.</Strong>
							      </span>
								<!-- <div class="col-sm-4" id="alert-danger">비밀번호가 일치하지 않습니다.</div> -->
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
							   <span id = "check"><Strong>닉네임을 입력해주세요</Strong>
							      </span>
							    </div>
						
							  
							
							  
							  <div class="form-group"> 
							  <div class="input-group-prepend">
							
							    
					
							      <input class="form-control col-md-10"   type="text" id="phone" name="phone" placeholder="'-' 없이 입력해주세요.">　<button id="pij" type="button" class="btn btn-outline-primary">전송</button>
							      <i id="sm2" class="far fa-grin fa-2x" style="color:Green; display:none;"></i>
							  
							  </div>
							   </div>
							 <div class="form-group">
							   <div class="input-group-prepend">
							    <label for="ssn"></label>
							   <div id="inj" class="text-center" style="display:none">  인증번호
							      <input type="text" class="form-control"  id="sms" name="sms" placeholder="인증번호를 입력해주세요.">
							      <button id="injb2" type="button" class="btn btn-outline-primary">인증</button>
							    </div>
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
							        <br>
							        
							    <label for="ssn">	<span style="color: black;"><Strong>위치정보 문의</Strong> </span></label>
							    <div>
							    
							     <input type="radio" id= "local" name="local" value="1" checked="checked" /> 동의
							     <input type="radio" id= "local" name="local" value="2" /> 비동의
							    </div>
							  </div>
							  
						
							  <div class="form-group">
							   <!--  disabled="disabled" -->
							      <button id= "join" type="button" class="btn btn-outline-primary" title="반드시 휴대폰 본인인증을 하세요.">가 입</button>
								  <a class="btn btn-outline-danger btn" href="#" role="button">취 소</a>
								
					 			 </div>
					 			
					 			 
							
		
	
	<br/>
	<br/>
	
						  
							</form>
						
							</div>
							</div>
							</div>
							</div>
						</div>	
						
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
			 <%-- <div class="text-center">아이디
							  <form class="form-horizontal">
						   <div class="form-group" >
							   
						   
									${user.userId}
							    </div>
							     <input type="hidden" class="col-sm-2" id="userId" name="userId" value="${user.userId}" >
							     <div class="form-group">
							        <div id="divemail" style="display:none;">인증번호
							      <input type="text"  id="emailcode" name="emailcode" placeholder="인증번호"><button type="button" class="btn btn-primary">확인</button>
							    </div>
							  </div>
							    
							  
							  비밀번호
							  	  <div class="form-group">
							  	  
					
							      <input type="password" class="col-sm-2" id="password" name="password" placeholder="비밀번호">
							    
							  </div>
							  비밀번호확인
							  <div class="form-group">
						
							      <input type="password" class="col-sm-2" id="password2" name="password2" placeholder="비밀번호 확인">
							      
							  
							  </div>
							 
							  
							  
							  <div class="form-group">
							  <label for="password3"></label>
							<!--   <div class="col-sm-4" id="alert-success">비밀번호가 일치합니다.</div> -->
							  <span id = "alert-success"><Strong class="text-success">비밀번호가 일치합니다.</Strong>
							      </span>
								<!-- <div class="col-sm-4" id="alert-danger">비밀번호가 일치하지 않습니다.</div> -->
								<span id = "alert-danger"><Strong class= "text-danger">비밀번호가 일치하지 않습니다.</Strong>
							      </span>
							</div>
								
							    이름<div class="form-group">
							    <label for="userName"></label>
								<input type="hidden" class="col-sm-2" id="userName" name="userName" value="${user.userName}" >
							     ${user.userName}
							 
							  </div>
							  
							  닉네임<div class="form-group">
							  
							    <label for="nickName"></label>
							    
					
							      <input type="text" class="col-sm-2" id="nickName" name="nickName" value="${user.nickName}"><br>
							      <span id = "check"><Strong></Strong>
							      </span>
							
							  </div>
							  
						
							  
							
							  
							  휴대전화<div class="form-group">
							 
							    <label for="phonee"></label>
							    
					
							      <input value="${user.phone}" class="col-sm-2" type="text" id="phone" name="phone" placeholder="'-' 없이 입력해주세요."><button id="pij" type="button" class="btn btn-primary">전송</button>
							  
							  </div>
							  
							 <div class="form-group">
							    <label for="ssn"></label>
							   <div id="inj" style="display:none">  인증번호
							      <input type="text" id="sms" name="sms" placeholder="인증번호를 입력해주세요.">
							      <button id="injb2" type="button" class="btn btn-primary">인증</button>
							    </div>
							  </div>
							  
							  주소<div id="emailSend" style="display: none;"> 전송중.... </div>		 
							  <div>
							    <label for="ssn"></label>
					 
							    　 　　　　<input class="col-sm-3" type="text" id="address" name="address" value="${user.address}" >
							      <button type="button" class="btn btn-link">주소찾기</button>
							 
							      </div>상세주소<br>
							      <input class="col-sm-3" type="text" id="address2" name="address2" >
							        <div class="form-group">
							        <br>
							    <label for="ssn">위치정보문의</label>
							    <div>
							    
							     <input type="radio" id= "local" name="local" value="1" checked="checked" /> 동의
							     <input type="radio" id= "local" name="local" value="2" /> 비동의
							    </div>
							  </div>
							  
						
							  <div class="form-group">
							   <!--  disabled="disabled" -->
							      <button id= "join" type="button" class="btn btn-primary">수정</button>
								  <button id= "cancel" type="button" class="btn btn-primary">취소</button>
								
					 			 </div>
							
							  
							  
							
							</form>
							
						</div>	 --%>
</body>

</html>