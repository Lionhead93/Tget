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


	
	/*  $(function() {
	
	$('#nickNameCheck').on('click' ,function(){
		 
		alert("좀 떠라ㅠㅠ");
		
		 var query = {nickName : $("#nickName").val()};
		 
		 $.ajax({
		  url : "/user/nickNameCheck",
		  type : "post",
		  data : query,
		  success : function(data) {
		  
		   if(data == 1) {
		    $(".result .msg").text("사용 불가");
		    $(".result .msg").attr("style", "color:#f00");    
		   } else {
		    $(".result .msg").text("사용 가능");
		    $(".result .msg").attr("style", "color:#00f");
		   }
		  }
		 });  // ajax 끝
		});

	
	function emailcheck(email1, email2){
	    // 유효성 검사
		if(!insertform.email1.value || !insertform.email2.value){ 
			alert(emailerror);
			insertform.email1.focus();
			return;
		}else{
			if(insertform.email1.value){
				if(insertform.email2.value==0){
					// 직접입력
					if(insertform.email1.value.indexOf("@")==-1){
						alert(emailerror);
						insertform.email1.focus();
						return false;
					}
				}else{
					// 선택입력
					if(insertform.email1.value.indexOf("@")!=-1){
						alert(emailerror);
						insertform.email1.focus();
						return false;
					}
				}
			}
		} */
	/*     // 인증을 위해 새창으로 이동
		var url="email.jsp?email1="+email1+"&email2="+email2;
	    
		open(url,"emailwindow", "statusbar=no, scrollbar=no, menubar=no, 
                width=400, height=200" );


 */

/* 		function check() {
			var form = document.authenform;
			var authNum = ${authNum};
			
			if(!form.authnum.value){
				alert("인증번호를 입력");
				return false;
			}
			if(form.authnum.value!=authNum){
				alert("틀렸어 다시써");
				form.authnum.value="";
				return false;
			}
			if(form.authnum.value==authNum){
				alert("좋아")
				opener.document.userinput.mailCheck.value="완료";
				self.close();
			}
		} */
			
	

/* } */
	

		//==>"이메일" 유효성Check  Event 처리 및 연결
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("이메일 형식이 아닙니다.");
			     }
			});
			 
		});	
		
		
	  
	
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
					//alert("오예");
				
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
					
					$("button:contains('가 입')").on("click" , function() {
						alert("오예");
					 fncAddUser(); 
					 
					
					});
				});	 
			  /* $(function() {
					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					$("a:contains('취 소')").on("click" , function() {
						
					});
				});	  */
			  
				 function fncAddUser() {
				
					var id=$("input[name='userId']").val();
					var id2=$("select[name='userId2']").val();
				/* 	var id3=$("option[id='ih']").val();
					var id4=$("option[id='ig']").val(); */
					var pw=$("input[name='password']").val();
					var pw_confirm=$("input[name='password2']").val();
					var name=$("input[name='userName']").val();
					
					
					if(id == null || id.length <1){
						alert("아이디는 반드시 입력하셔야 합니다.");
						return;
					}
					if(pw == null || pw.length <1){
						alert("패스워드는  반드시 입력하셔야 합니다.");
						return;
					}
					if(pw_confirm == null || pw_confirm.length <1){
						alert("패스워드 확인은  반드시 입력하셔야 합니다.");
						return;
					}
					if(name == null || name.length <1){
						alert("이름은  반드시 입력하셔야 합니다.");
						return;
					}
					
					if( pw != pw_confirm ) {				
						alert("비밀번호 확인이 일치하지 않습니다.");
						$("input:text[name='password2']").focus();
						return;
					}
				
					
					$("input[name='userId']").val(id+id2);
				
			
					$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
					
				}
		     
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
					 
					 $("input[name='email']").on("change" , function() {
						
						 var email=$("input[name='email']").val();
					    
						 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
					    	alert("이메일 형식이 아닙니다.");
					     }
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
		     

				
		     
				 
				 
				 
				 
				 
				 
		     </script>
		  <form class="form-horizontal">
		  
		 <!--  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아이디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
		    </div>
		  </div> -->
		  
		   <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">아이디</label>
		    <div class="col-sm-4">
		      <td>
	    <input type="text" name="userId" maxlength="15">@
		 <select name="userId2">
		      <option  id = "ig" value="@naver.com">naver.com</option>
		      <option  id = "ig" value="@daum.net">daum.net</option>
		      <option  id = "ig" value="@nate.com">nate.com</option>
		      <option id = "ig"  value="@gmail.com">gmail.com</option>
		      <option id = "ih" value="">직접입력</option>
		  </select>
		<!-- <input type="button" name="emailconfirm_btn" value="인증" 
         onclick="emailcheck(insertform.email1.value,insertform.email2.value)"> -->
	</td>
		    </div>
		  </div>
		  
		  	  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		  <label for="password2" class="col-sm-offset-1 col-sm-3 control-label"></label>
		  <div class="col-sm-4" id="alert-success">비밀번호가 일치합니다.</div>
		  <span id = "alert-success"><Strong>비밀번호가 일치합니다.</Strong>
		      </span>
			<div class="col-sm-4" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
			<span id = "alert-danger"><Strong>비밀번호가 일치하지 않습니다.</Strong>
		      </span>
		</div>

		    <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="회원이름">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="nickName" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" placeholder="닉네임">
		      <span id = "check"><Strong>닉네임을 입력해주세요</Strong>
		      </span>
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
		  
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
		    <div class="col-sm-4">
		    
		      <input type="text" class="form-control" id="address" name="address" >
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
		  
		  <!-- 	  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">관심카테고리</label>
		    <div class="col-sm-4">
		     <input type="checkbox" name="chbox" value="K-POP"> K-POP
			<input type="checkbox" name="chbox" value="rap"> 랩/힙합
			<input type="checkbox" name="chbox" value="balad">발라드<br><br>
		    </div>
		  </div> -->
 
		
	
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">가 입</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 소</a>
			 
			  
		    </div>
 			 </div>
		  
		  
		
		</form>
		
 	
	
</body>

</html>