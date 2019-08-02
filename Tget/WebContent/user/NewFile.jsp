
<!--
author: Boostraptheme
author URL: https://boostraptheme.com
License: Creative Commons Attribution 4.0 Unported
License URL: https://creativecommons.org/licenses/by/4.0/
-->



<!DOCTYPE html>
<html>

<head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">

    <link rel="shortcut icon" href="img/favicon.ico">
    
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/font-icon-style.css">
    <link rel="stylesheet" href="/resources/newTemplate/admin/css/style.default.css" id="theme-stylesheet">

    <!-- Core stylesheets -->
    <link rel="stylesheet" href="css/pages/register.css">
    
		

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="848949930774-4ka6kl79kq1fv7h3q89leonj9ki1o6v7.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js"></script>
    
	<link rel="shortcut icon" href="/resources/file/others/favicon.png">
	<link rel="icon" href="/resources/file/others/favicon.png">  
	
    <!-- Global Stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i" rel="stylesheet">
    <link href="/resources/newTemplate/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/newTemplate/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/css/animate/animate.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/css/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/css/owl-carousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/newTemplate/css/style.css">
   
  	<style type="text/css">
 		
 		@font-face {
    		font-family: 'YouandiModernTR';
   		 	font-style: normal;
    		font-weight: normal;
    		src: url(/resources/font/Youandi_Modern_TextRegular.woff) format('woff');
		}
    	
    	#mainNav, body, .nav-link, .dropdown-item, .navbar-brand, h2, h3, h4, p, a, th, td {
    		font-family: 'YouandiModernTR', sans-serif !important;
    	} 	
		
		.navbar-brand{
			font-weight: bold;
		}
		
		.swal-button {
		  background-color: #f04f23;
		  border: 1px  #f04f23;
		}
		
		.swal-button:hover {
		  background-color: #f04f23;
		  border: 1px  #f04f23;
		}
		
		.swal-button--cancel {
		    color: white;
		    background-color: #f04f23;
		}
		
		html {
	 		scroll-behavior: smooth;
		}
		
		
  	</style>
  </head>
  
<body id="page-top">

<!--====================================================
                         HEADER
======================================================--> 

    <header>

      <!-- Top Navbar  -->
      <div class="top-menubar">
        <div class="topmenu">
          <div class="container">
            <div class="row">
              <div class="col-md-7">
<!--                 <ul class="list-inline top-contacts"> -->
<!--                   <li> -->
<!--                     <i class="fa fa-envelope"></i> Email: <a href="mailto:info@themeborn.com">info@themeborn.com</a> -->
<!--                   </li> -->
<!--                   <li> -->
<!--                     <i class="fa fa-phone"></i> Hotline: (1) 111 222 33 -->
<!--                   </li> -->
<!--                 </ul> -->
              </div> 
              <div class="col-md-5">
                <ul class="list-inline top-data">
                  
                  <li><a href="#" class="log-top login-modal" data-toggle="modal" data-target="#login-modal">Login</a></li>
                  <li><a href="/users/addUsersBase" class="log-top regist">Regist</a></li>
                  
                  
                </ul>
              </div>
            </div>
          </div>
        </div> 
      </div> 
      
      <!-- Navbar -->
      <div class="navbar navbar-expand-lg navbar-light" id="mainNav" data-toggle="affix">
        <div class="container">
         <b><a class="navbar-brand smooth-scroll" href="/index.jsp">
            <img src="/resources/file/others/favicon.png" alt="logo" height="40px" width="40px">&ensp;<span >보호할개</span>
          </a></b> 
          <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"> 
                <span class="navbar-toggler-icon"></span>
          </button>  
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item" ><a class="nav-link smooth-scroll" href="index.html">집</a></li>
                <li class="nav-item dropdown" >
                  <a class="nav-link dropdown-toggle smooth-scroll" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">분양 · 실종
                 </a> 
                  <div class="dropdown-menu dropdown-cust" aria-labelledby="navbarDropdownMenuLink">
	              	<a class="dropdown-item" href="/adopt/listAdopt?boardCode=AD">분양리스트</a>
	                <a class="dropdown-item" href="../adopt/listMissing.jsp">테스트</a>
	                <a class="dropdown-item" href="/adoptReview/listAdoptReview">후기</a>
                  </div>
                </li>
                <li class="nav-item dropdown" >
                  <a class="nav-link dropdown-toggle smooth-scroll" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">스토리펀딩</a> 
                  <div class="dropdown-menu dropdown-cust" aria-labelledby="navbarDropdownMenuLink">
	              	<a class="dropdown-item" href="/funding/listVoting">투표게시판</a>
	                <a class="dropdown-item" href="/funding/listFunding">후원게시판</a>
                  </div>
                </li>
                <li class="nav-item dropdown" >
                  <a class="nav-link dropdown-toggle smooth-scroll" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">커뮤니티</a> 
                  <div class="dropdown-menu dropdown-cust" aria-labelledby="navbarDropdownMenuLink">
	                <a class="dropdown-item" href="/info/listInfo">정보공유</a>
	                <a class="dropdown-item" href="/community/getDogSense.jsp">애견상식</a>
	                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#chatbot-modal">챗봇</a>
	                
                  </div>
                </li>
              
                <li class="nav-item dropdown" >
                  <a class="nav-link dropdown-toggle smooth-scroll" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">스토어</a> 
                  <div class="dropdown-menu dropdown-cust" aria-labelledby="navbarDropdownMenuLink">
	               <a class="dropdown-item" href="/prodQna/listProdQna?order=1">상품Q&a</a>
	                <a class="dropdown-item" href="/market/listMarket?order=1">보호마켓</a>
	                <a class="dropdown-item" href="/product/listProduct">상품리스트</a>
	                
                  </div>
                </li>
                <li class="nav-item" ><a class="nav-link smooth-scroll" href="/community/getBreedPedia.jsp">견종백과</a></li>
                <li class="nav-item" ><a class="nav-link smooth-scroll" href="/hospital/getHospital.jsp">동물병원</a></li>
                <li>
                  <div class="top-menubar-nav">
                    <div class="topmenu ">
                      <div class="container">
                        <div class="row">
                          <div class="col-md-9">
                            <ul class="list-inline top-contacts">
                              <li>
                                <i class="fa fa-envelope"></i> Email: <a href="mailto:info@htmlstream.com">info@htmlstream.com</a>
                              </li>
                              <li>
                                <i class="fa fa-phone"></i> Hotline: (1) 396 4587 99
                              </li>
                            </ul>
                          </div> 
                          <div class="col-md-3">
                            <ul class="list-inline top-data">
                              <li><a href="#" target="_empty"><i class="fa top-social fa-facebook"></i></a></li>
                              <li><a href="#" target="_empty"><i class="fa top-social fa-twitter"></i></a></li>
                              <li><a href="#" target="_empty"><i class="fa top-social fa-google-plus"></i></a></li> 
                              <li><a href="#" class="log-top" data-toggle="modal" data-target="#login-modal">Login</a></li>  
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div> 
                  </div>
                </li>
            </ul>  
          </div>
        </div>
      </div>
    </header> 
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

      <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
          <div class="modal-dialog">
              <div class="modal-content loginSection">
                  <div class="modal-header" align="center">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span class="fa fa-times" aria-hidden="true"></span>
                      </button>
                  </div>
                  <div id="div-forms">
                      <form id="login-form">
                          <h3 class="text-center">로그인</h3>
                          <div class="modal-body">
                              <label for="username">아 이 디</label> 
                              <input id="login_username" name="id" class="form-control id" type="text" placeholder="Enter username " required>
                              <label for="username">비밀번호</label> 
                              <input id="login_password" name="pw" class="form-control pw" type="password" placeholder="Enter password" required>


                          </div>
                          <div class="modal-footer text-center">
                              <div>
                                  <button type="submit" id="submitLogin" class="btn btn-general btn-white">Login</button>
                              </div>
                              <div>
                              	  <img src="/resources/file/others/kakao.png" height="30px" width="30px" class="kakaoLogin">
                              </div>
							  <div id="naver_id_login"></div>


                          </div>
                      </form>
                  </div>
              </div>
          </div>
      </div>

</body>
</html>

    <!--Global JavaScript -->
    <script src="/resources/newTemplate/js/jquery/jquery.min.js"></script>
    <script src="/resources/newTemplate/js/popper/popper.min.js"></script>
    <script src="/resources/newTemplate/js/bootstrap/bootstrap.min.js"></script>
    <script src="/resources/newTemplate/js/wow/wow.min.js"></script>
    <script src="/resources/newTemplate/js/owl-carousel/owl.carousel.min.js"></script>
	
    <!-- Plugin JavaScript -->
    <script src="/resources/newTemplate/js/jquery-easing/jquery.easing.min.js"></script> 
    <script src="/resources/newTemplate/js/custom.js"></script> 
    <script src="/resources/prodmenu/js/jquery.animateNumber.min.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

    
    <!-- fontawesome key -->
    <script src="https://kit.fontawesome.com/e26616618e.js"></script>
    
    <!-- sweetalter CDN -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
    <!--  Chat Bot -->

	
  	<script type="text/javascript">

		//============= "로그인"  Event 처리 =============
		$(".login-modal").on("click", function() {
			
// 			alert("ㅎㅇ");
			fncLogin();

// 			alert("ㅎㅇ");
			
		});
		
		function fncLogin(){
			$(".id").focus();
			$("#submitLogin").on("click" , function() {
				var id=$("input:text[name='id']").val();
				var pw=$("input:password[name='pw']").val();
// 				alert(id);
// 				alert(pw);
				if(id == null || id.length <1) {
					alert('ID를 입력하십시오.');
					$("#login_username").focus();
					return;
				}
				
				if(pw == null || pw.length <1) {
					alert('비밀번호를 입력하십시오.');
					$("#login_password").focus();
					return;
				}
				
				var chkLogin={id:id, pw:pw};
// 				alert("ajax id : "+id);
// 				alert("ajax pw : "+pw);
				$.ajax({
					
					type : "POST",
					contentType : "application/json",
					url : "/users/json/login",
					data : JSON.stringify(chkLogin),
					datatype : "json",
					success : function(response){
// 						alert("pw : "+JSON.stringify(response))
						if(response.pw == pw && response.id == id && response.levelPoint >= 0){
// 							alert("로그인 성공 pw : "+response.pw+" && "+response.levelPoint);
							alert(response.nickname+" 님 환영합니다!");
							self.location="/index.jsp";
// 							swal({
// 								title : "로그인 성공",
// 								text : response.nickname+" 님 환영합니다!"
// 								buttons: true
// 							});
// 							$('#login-form').attr('method', 'POST').attr('action', '/users/login').submit();
						}
						if(response.pw != pw || response.id != id){
// 							alert(response.pw);
							alert("아이디 혹은 비밀번호가 맞지 않습니다.");
							$("#login_password").val('');
							return;
							$("#id").focus();
						}
						if(response.levelPoint < 0) {
							alert("블랙리스트 처리된 회원입니다.");
							return;
							$("#id").focus();
						}
						
					},
					error : function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});

			});
		}
		
		$(document).ready(function(){
			$("#pw").keyup(function(key){
				if(key.keyCode==13){
					$("#login").click();
				}
			})
		})
		
		Kakao.init('153d14a106a978cdc7a42f3f236934a6')
		$(".kakaoLogin").on("click", function(){
			Kakao.Auth.login({
				success : function(authObj){
					Kakao.API.request({
						url : "/v2/user/me",
						success : function(result){
							var info = JSON.stringify(result);
							$(location).attr('href', '/users/kakao?kakao='+result.id);
						}
					});
					Kakao.Auth.getAccessToken();
				},
				fail : function(err) {
					alert(JSON.stringify(err));
					alert("로그인 실패");
				}
			})
		})
		

		var naver_id_login = new naver_id_login("qhgCBZA6iuY4bImpUhhX", "http://localhost:8080/users/callback.jsp");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("green", 1 , 30);
	  	naver_id_login.setDomain("http://localhost:8080/");
	  	naver_id_login.setState(state);
// 	  	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
	  	
	  	
	  	

// 			  	var naverLogin=new naver.LoginWithNaverId({
			  		
// 			  		clientId : "qhgCBZA6iuY4bImpUhhX",
// 			  		callbackUrl : "http://localhost:8080/users/callback.jsp",
// 			  		isPopup : false,
// 			  		loginButton: {color: "green", type: 3, height: 30},
// 			  		callbackHandle : false
			  		
// 			  	});
// 			  	naverLogin.init();
			  	
// 			  	naverLogin.getLoginStatus(function(status){
// 			  		if(status){
// 						var email = naverLogin.user.getEmail();
// 						var name = naverLogin.user.getNickName();
// 						var profileImage = naverLogin.user.getProfileImage();
// 						var birthday = naverLogin.user.getBirthday();			
// 						var uniqId = naverLogin.user.getId();
// 						var age = naverLogin.user.getAge();
// 			  		} else {
// 			  			alert("AccessToken 확인이요");
// 			  		}
// 			  	});

	  	
		      


		//============= 회원가입 Event처리 =============
		$( function() {
			$("#regist").on("click" , function() {
				self.location = "/users/addUsersBase"
			});
		});
		
		
		//============= 맨위로  =============
		$( function() {

			$("#back-to-top").on("click" , function() {
				$('html').scrollTop(0);
			});
			
		});
		

		

// 			$(document).ready(function(){
// 				var url="/index.jsp"
// 				window.open(url,"","width=400,height=400,left=600");
// 			})


		
		
	</script>	  

</body>
</html>

</head>

<body> 

<!--====================================================
                         MAIN NAVBAR
======================================================-->        


<!--====================================================
                        PAGE CONTENT
======================================================-->

	<div class="hero-wrap hero-bread" style="padding-bottom: 0px; padding-top : 10px;">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="/index.jsp">Regist</a></span>
					</p>
					<h1 class="mb-0 bread">회원가입</h1>
				</div>
			</div>
		</div>
	</div>
	
	<br/>
	<br/>
	
    <div class="page-content d-flex align-items-stretch">
                <!--***** USER INFO *****-->
                <div class="col-md-3">
                </div>
                <div class="col-md-6 login-card">
                    <div class="card form" id="form1">
                        <div class="card-header" align="center">
                            <h3><i class="fa fa-user-circle"></i>기본정보</h3>
                        </div>
                        <br>
                        <form class="addUsersForm" name="formal" style="padding-left: 90px;">
                        <input type="hidden" name="kakao" value="">
                        <input type="hidden" name="naver" value="">
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="form-group">
                                        <label for="id">아 이 디</label>
                                        <input type="text" class="form-control" id="id" name="id" aria-describedby="emailHelp" placeholder="Enter ID">
										<span id="helpBlock1" class="help-block" style="font-size: 14px;"></span>
                                    </div>
                                    <div class="form-group">
                                        <label for="cont-number">비 밀 번 호</label>
                                        <input type="password" class="form-control" id="pw" name="pw" aria-describedby="emailHelp" placeholder="Enter Password">
                                    </div> 

                                    <div class="form-group has-success">
                                        <label for="website">비밀번호 확인</label>
                                        <input type="password" class="form-control" id="pw2" name="pw2" aria-describedby="emailHelp" placeholder="Confirm Password"
                                        style="margin-bottom: 0;">
										<span id="helpBlock3" class="help-block" style="font-size: 14px;"></span>
                                    </div>  
                                    <div class="form-group">
                                        <label for="userName">회 원 명</label>
                                        <input type="text" class="form-control" id="userName" name="userName" aria-describedby="emailHelp" placeholder="Enter UserName">
                                    </div>
                                    <div class="form-group">
                                        <label for="nickname">닉 네 임</label>
                                        <input type="text" class="form-control" id="nickname" name="nickname" aria-describedby="emailHelp" placeholder="Enter Nickname">
                                        <span id="helpBlock2" class="help-block" style="font-size: 14px;"></span>
                                    </div>
                                </div>
                            </div> 
                            
                            <div class="card form col-md-10">
                            	<div class="row mt-3" align="center">
									<div class="col-md-12" align="center">
                                	    <h4 style="border-bottom: 1px solid #ddd; padding-bottom: 7px; color:#555; padding-right: 10px;">이용목적</h4>
                                	</div>
                           		</div>
							  	<div class="form-group col-md-12">

									<div class="col-sm-12">
										<span>이용목적을 3개 입력해주세요</span>
										<br/>
										<input type="checkbox" name="purpose[]" id="fund" value="펀딩참여"/>펀딩참여
							      		<br/>
					              		<input type="checkbox" name="purpose[]" id="adopt" value="입양 및 분양"/>입양 및 분양
					              		<br/>
					             		<input type="checkbox" name="purpose[]" id="buying" value="물품구매"/>물품구매
					              		<br/>
					              		<input type="checkbox" name="purpose[]" id="selling" value="물품판매"/>물품판매
					              		<br/>
					              		<input type="checkbox" name="purpose[]" id="info" value="정보공유"/>정보공유
					              		<br/>
					              		<input type="checkbox" name="purpose[]" id="etc" value="기타"/>기타
							    	</div>

							    	<br/>
							    </div>
							  </div>
							<button type="submit" id="submit" class="btn btn-general btn-blue mr-2">회원가입</button>
                            <button type="submit" id="addition" class="btn btn-general btn-blue mr-2">추가정보입력</button>
                            <button type="reset" id="reset" class="btn btn-general btn-white">취&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</button> 
                        	<br/>
                       		<br/>
                        	<br/>
							</form>	
                         </div> 
                    </div>
  
            </div> 

    	



</body>

</html>