<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>


<script type="text/javascript">

	$( function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#forgotId' ]").on("click" , function() {
		
			var popOption = "left=500, top=100, width=600, height=600, resizable=no, location=no;"		
				window.open("/user/finduserId","find userId",popOption);
		});
	});
	
	$( function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#forgotPassword' ]").on("click" , function() {
		
			var popOption = "left=500, top=100, width=700, height=700, resizable=no, location=no;"		
				window.open("/user/findPassword","find password",popOption);
		});
	});
	
	$( function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[href='#signUp' ]").on("click" , function() {
		
			self.location = "/user/addUser"
		});
	});
	
	$( function() {
		
		$("#userId").focus();
		
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("input[id='signin']").on("click" , function() {
			
			//alert("눌리니");
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			
			
			
			if(id == null || id.length <1) {
				alert('ID 를 입력하지 않으셨습니다.');
				$("#userId").focus();
				return;
			}
			
			if(pw == null || pw.length <1) {
				alert('패스워드를 입력하지 않으셨습니다.');
				$("#password").focus();
				return;
			}
			
			 $.ajax({ 
				   url: "/user/json/login",
			   data: { 
				   userId: $("#userId").val(), 
				   }, 
				   type: "post", 
				   dataType: "json",
			   success: function(JSONData){ 
				   console.log(JSONData);
				   
				   if (JSONData.msg == "no") {
						  alert("ID/password error");
						  return;
			  		 }else if (JSONData.msg == "true") { 
					
					  $('#black').modal('show');
					  
					// alert("응 너 블랙이야~");
					 $("#nickName").text(JSONData.nickName);
					 $("#startDate").text(JSONData.startDate);
					 $("#endDate").text(JSONData.endDate);
					 
				   } else if (JSONData.msg == "false")
				  		 { 
					   		$("form[name='user-login']").attr("method","POST").attr("action","/user/login").submit();
				  	 	
				  		 }
		
		
			   }
				   });
	});	
		});
	
	$( function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[id='kakao' ]").on("click" , function() {
				
				var popOption = "left=500, top=100, width=600, height=600, resizable=no, location=no;"		
				window.open("https://kauth.kakao.com/oauth/authorize?client_id=ea9f389c17a2bd4b4fd122a0c9184bc2&redirect_uri=http://192.168.0.16:8080/user/oauth&response_type=code","Kakao login",popOption);
				
				
		});
	});
	
	$( function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$("a[id='naver' ]").on("click" , function() {
				
				var popOption = "left=500, top=100, width=600, height=600, resizable=no, location=no;"		
				window.open("https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=AziWQOW7S2sZhD1PEBi9&state=STATE_STRING&redirect_uri=http://192.168.0.24:8080/user/callback","Naver login",popOption);
				
				
		});
	});
</script>




<!-- 80%size Modal at Center -->
<form name="user-login" class="form-horizontal">
<div class="modal modal-center fade" id="my80sizeCenterModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
  <div class="modal-dialog modal-80size modal-center" role="document">
    <div class="modal-content modal-80size">
     
    <div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
		<input style="display: none;" id="tab-2" type="radio" name="tab" class="sign-up"><label style="display: none;" for="tab-2" class="tab"></label>
		<div class="login-form">
			<div class="sign-in-htm">
				<div class="group">
					<label for="user" class="label">UserId</label>
					<input id="userId" name="userId" type="text" class="input" placeholder="Email">
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="password"  name="password"  type="password" class="input" data-type="password" placeholder="Password">
				</div>
				<div class="group">
					<input id="signin" class="button" value="Sign In">
				</div>
				
				<div class="text-center">
				     <a id="kakao"><img src="/resources/images/kakaos.jpg" style="max-width: 100%; height: auto;"/></a>
     <a id="naver"><img src="/resources/images/navers.jpg" style="max-width: 100%; height: auto;"/></a>
		<a id="google"><img src="/resources/images/googles.jpg" style="max-width: 100%; height: auto;"/></a>
		</div>
			<div class="foot-lnk">Not a member?   
					<a href="#signUp">Sign up</a>
				</div>			<br>
				<div class="foot-lnk">
					<a href="#forgotId">Forgot Id?   </a>
				<br>	<a href="#forgotPassword">Forgot Password?</a>
			</div>
		
		</div>
	</div>
	
</div>
</div>
</div>
</div>
</div> <!-- ---로그인창--- -->


<div class="modal fade" id="black" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
				  <div class="modal-dialog modal-lg" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				       <h5 class="modal-title" id="modalCenterTitle"><p id="nickName"></p></h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				
					      </div>
					     
					      
					     <div class="form-group">
		    <label for="blacklistStartDate" class="col-sm-offset-1 col-sm-3 control-label">블랙리스트 시작일자</label>
		    <div class="col-sm-4">
		
		   <p id="startDate"></p>
		    </div>
		  </div>
		  
		  <div class="form-group">
		   <label for="blacklistEndDate" class="col-sm-offset-1 col-sm-3 control-label">블랙리스트 종료일자</label>
		    <div class="col-sm-4">
		     <p id="endDate"></p>
		    </div>
		  </div>
    		  <div class="modal-footer">	      
        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
	   	    	</div>


				   </div>
	  </div>
		 </div>  
		 
		 	
		 
		 
</form>