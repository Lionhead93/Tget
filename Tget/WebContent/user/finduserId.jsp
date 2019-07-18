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
					   url: "/user/json/smsCheck",
				   data: { 
					   code: $("#sms").val() 
					   }, 
					   type: "post", 
				   success: function(result){ 
					   console.log(result);
					   
					   
					   
					   if (result == "true") { 
				   
					   alert("인증 성공");
					   
				   } else if (result == "false")
				  		 { 
					   alert("인증 실패"); 
				  	 	} 
				 	  } 
				   })
			   })
			   });
		     </script>
				
		  <form class="form-horizontal">
		  
	
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userName" name="userName" placeholder="회원이름">
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
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">찾기</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 소</a>
			 
			  
		    </div>
 			 </div>
		  
		  
		
		</form>
		
 	
	
</body>

</html>