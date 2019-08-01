<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html lang="ko">
  <head>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>T-GET</title>
    	
		<link rel="shortcut icon" href="/resources/images/logo.png">
		<link rel="icon" href="/resources/images/logo.png">		  	
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/css/login.css" />
		<link rel="stylesheet" href="/resources/css/yr.css" />
		<link rel="stylesheet" href="/resources/css/videoBox.css" />
		<link rel="stylesheet" href="/resources/css/main.css" />
		<link rel="stylesheet" href="/resources/css/neon.css" />
		<link href="https://fonts.googleapis.com/css?family=PT+Sans+Caption:700&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="/resources/css/yr_neon.css" />
		<script src="/resources/javascript/yr.js" ></script>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
		<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
		<script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>		
		<script src="/resources/javascript/common.js" ></script>
		<script src="/resources/javascript/alarm.js" ></script>
		<script src="/resources/javascript/jquery.min.js"></script>
		<script src="/resources/javascript/jquery.scrolly.min.js"></script>
		<script src="/resources/javascript/skel.min.js"></script>
		<script src="/resources/javascript/util.js"></script>
		<script src="/resources/javascript/main.js"></script>
		<style type="text/css">
			img{
				height: 300px;
			}
		</style>
	</head>
	<body>
		
 	 <jsp:include page="/layout/tgetToolbar.jsp" />
 	 <jsp:include page="/user/xx.jsp" />
			<!-- Banner -->
			<!--
				To use a video as your background, set data-video to the name of your video without
				its extension (eg. images/banner). Your video must be available in both .mp4 and .webm
				formats to work correctly.
			-->
				<section id="banner" data-video="/resources/video/main">
					<div class="inner">
					<form name="searchEvent">
					<input type="hidden" id="requestPageToken" name="requestPageToken" value="${requestPageToken }"/>
					<input type="hidden" id="searchCondition" name="searchCondition" 
					placeholder="searchCondition" value="${!empty search.searchCondition? search.searchCondition : ''}"/>
					<input type="hidden"  id="searchKeyword" name="searchKeyword"  
					placeholder="searchKeyword" value="${!empty search.searchKeyword? search.searchKeyword : ''}" >
							<h1>
							<div style="font-family: 'PT Sans Caption', sans-serif;font-size:80px;">
								<span class="textcontainer">
									<span class="particletext bubbles">
									
									<span class="yr-blue  " ><span class="yr-blue-off ">T</span>-GET</span><br/>
<!-- 									T-GET -->
<!-- 									<span class="particle" style="top:29%; left:82%;width:5.2px; height:5.2px;animation-delay: 3s;"></span><span class="particle" style="top:67%; left:53%;width:4.8px; height:4.8px;animation-delay: 1.8s;"></span><span class="particle" style="top:65%; left:90%;width:5.5px; height:5.5px;animation-delay: 1.2s;"></span><span class="particle" style="top:56%; left:64%;width:7.2px; height:7.2px;animation-delay: 2.5s;"></span><span class="particle" style="top:80%; left:77%;width:7.1px; height:7.1px;animation-delay: 2.2s;"></span><span class="particle" style="top:31%; left:58%;width:5.4px; height:5.4px;animation-delay: 0.5s;"></span><span class="particle" style="top:28%; left:95%;width:6.1px; height:6.1px;animation-delay: 2.7s;"></span><span class="particle" style="top:57%; left:58%;width:7.9px; height:7.9px;animation-delay: 2.3s;"></span><span class="particle" style="top:72%; left:61%;width:7.6px; height:7.6px;animation-delay: 0s;"></span><span class="particle" style="top:49%; left:51%;width:4.9px; height:4.9px;animation-delay: 1.9s;"></span><span class="particle" style="top:42%; left:43%;width:7.4px; height:7.4px;animation-delay: 1.1s;"></span><span class="particle" style="top:69%; left:39%;width:4.7px; height:4.7px;animation-delay: 1.8s;"></span><span class="particle" style="top:61%; left:92%;width:7.2px; height:7.2px;animation-delay: 0s;"></span><span class="particle" style="top:28%; left:16%;width:4.9px; height:4.9px;animation-delay: 2.1s;"></span><span class="particle" style="top:69%; left:24%;width:5.4px; height:5.4px;animation-delay: 0.4s;"></span><span class="particle" style="top:51%; left:59%;width:6.5px; height:6.5px;animation-delay: 1.2s;"></span><span class="particle" style="top:74%; left:67%;width:7.4px; height:7.4px;animation-delay: 2.5s;"></span><span class="particle" style="top:63%; left:16%;width:6.8px; height:6.8px;animation-delay: 1.3s;"></span><span class="particle" style="top:31%; left:29%;width:5.9px; height:5.9px;animation-delay: 2.1s;"></span><span class="particle" style="top:23%; left:42%;width:4.5px; height:4.5px;animation-delay: 1.3s;"></span><span class="particle" style="top:71%; left:76%;width:5.7px; height:5.7px;animation-delay: 1.5s;"></span><span class="particle" style="top:76%; left:79%;width:5.7px; height:5.7px;animation-delay: 0.5s;"></span><span class="particle" style="top:71%; left:1%;width:5.3px; height:5.3px;animation-delay: 1.8s;"></span><span class="particle" style="top:77%; left:11%;width:7.7px; height:7.7px;animation-delay: 2.1s;"></span><span class="particle" style="top:68%; left:34%;width:4px; height:4px;animation-delay: 2.3s;"></span><span class="particle" style="top:49%; left:78%;width:6.6px; height:6.6px;animation-delay: 2.8s;"></span><span class="particle" style="top:37%; left:41%;width:5.1px; height:5.1px;animation-delay: 2.3s;"></span><span class="particle" style="top:57%; left:75%;width:4.9px; height:4.9px;animation-delay: 2.4s;"></span><span class="particle" style="top:62%; left:58%;width:7.9px; height:7.9px;animation-delay: 0.6s;"></span><span class="particle" style="top:25%; left:6%;width:5.3px; height:5.3px;animation-delay: 2.8s;"></span><span class="particle" style="top:71%; left:52%;width:5.6px; height:5.6px;animation-delay: 2.8s;"></span><span class="particle" style="top:71%; left:22%;width:7.9px; height:7.9px;animation-delay: 0.1s;"></span><span class="particle" style="top:30%; left:59%;width:6.2px; height:6.2px;animation-delay: 0.7s;"></span><span class="particle" style="top:60%; left:90%;width:6px; height:6px;animation-delay: 0.1s;"></span><span class="particle" style="top:45%; left:79%;width:6.2px; height:6.2px;animation-delay: 0.1s;"></span></span> -->
								</span>
							</div></h1><br/>
							<div class="input-group" >		    
							    <input name="searching" type="text" class="form-control" width="100%"  placeholder="이벤트/아티스트/팀">
							    <div class="input-group-append">
							    	<a class="input-group-text" href="#" style="color:black;">검색</a>
								</div>							
						     </div>
					</form>	     
						     <br/>
						     <small class="form-text">판매 및 구매하고 싶은 이벤트를 검색 해보세요.</small>	
						<br/>
						<div class="nav-scroller py-1 mb-2">
						    <nav class="nav d-flex justify-content-between">
						      <a href="#" class="p-2 text-muted"  ><strong>콘서트</strong></a>
						      <a href="#" class="p-2 text-muted"  ><strong>페스티벌</strong></a>
						      <a href="#" class="p-2 text-muted"  ><strong>뮤지컬</strong></a>
						      <a href="#" class="p-2 text-muted"  ><strong>클래식/오페라</strong></a>
						      <a href="#" class="p-2 text-muted"  ><strong>축구</strong></a>
						      <a href="#" class="p-2 text-muted"  ><strong>야구</strong></a>
						      <a href="#" class="p-2 text-muted"  ><strong>골프</strong></a>
						    </nav>
						  </div>
						  <br/>
						<a href="#main" class="button big alt scrolly">
<!-- 							<span class="textcontainer"> -->
<!-- 								<span class="particletext fire" style="font-size: 20px;"> -->
									인기 이벤트
<!-- 								<span class="particle" style="top:45%; left:13%;width:12px; height:12px;animation-delay: 0.2s;"></span><span class="particle" style="top:55%; left:87%;width:10px; height:10px;animation-delay: 0.3s;"></span><span class="particle" style="top:53%; left:-5%;width:11px; height:11px;animation-delay: 2s;"></span><span class="particle" style="top:53%; left:77%;width:8px; height:8px;animation-delay: 1.5s;"></span><span class="particle" style="top:69%; left:24%;width:8px; height:8px;animation-delay: 0.3s;"></span><span class="particle" style="top:57%; left:98%;width:9px; height:9px;animation-delay: 1.8s;"></span><span class="particle" style="top:66%; left:70%;width:8px; height:8px;animation-delay: 0.2s;"></span><span class="particle" style="top:64%; left:75%;width:8px; height:8px;animation-delay: 1.3s;"></span><span class="particle" style="top:41%; left:57%;width:11px; height:11px;animation-delay: 0.4s;"></span><span class="particle" style="top:50%; left:5%;width:10px; height:10px;animation-delay: 1.2s;"></span><span class="particle" style="top:48%; left:6%;width:8px; height:8px;animation-delay: 0.1s;"></span><span class="particle" style="top:60%; left:82%;width:8px; height:8px;animation-delay: 0.7s;"></span><span class="particle" style="top:57%; left:70%;width:8px; height:8px;animation-delay: 1s;"></span><span class="particle" style="top:45%; left:43%;width:9px; height:9px;animation-delay: 0.3s;"></span><span class="particle" style="top:48%; left:3%;width:11px; height:11px;animation-delay: 1.8s;"></span><span class="particle" style="top:49%; left:72%;width:8px; height:8px;animation-delay: 0s;"></span><span class="particle" style="top:40%; left:79%;width:11px; height:11px;animation-delay: 1.4s;"></span><span class="particle" style="top:49%; left:54%;width:11px; height:11px;animation-delay: 1.8s;"></span><span class="particle" style="top:49%; left:48%;width:8px; height:8px;animation-delay: 0.1s;"></span><span class="particle" style="top:58%; left:26%;width:8px; height:8px;animation-delay: 2s;"></span><span class="particle" style="top:41%; left:57%;width:10px; height:10px;animation-delay: 0.2s;"></span><span class="particle" style="top:66%; left:15%;width:11px; height:11px;animation-delay: 2s;"></span><span class="particle" style="top:60%; left:22%;width:10px; height:10px;animation-delay: 0.9s;"></span><span class="particle" style="top:40%; left:25%;width:12px; height:12px;animation-delay: 0.6s;"></span><span class="particle" style="top:62%; left:93%;width:8px; height:8px;animation-delay: 0.9s;"></span><span class="particle" style="top:47%; left:9%;width:10px; height:10px;animation-delay: 0.7s;"></span><span class="particle" style="top:43%; left:-2%;width:8px; height:8px;animation-delay: 0.8s;"></span><span class="particle" style="top:69%; left:2%;width:11px; height:11px;animation-delay: 1.8s;"></span><span class="particle" style="top:65%; left:9%;width:11px; height:11px;animation-delay: 2s;"></span><span class="particle" style="top:43%; left:22%;width:11px; height:11px;animation-delay: 0.8s;"></span><span class="particle" style="top:64%; left:37%;width:11px; height:11px;animation-delay: 1.8s;"></span><span class="particle" style="top:70%; left:84%;width:8px; height:8px;animation-delay: 1.1s;"></span></span> -->
<!-- 							</span> -->
						</a>
						<a href="#popular" class="button big alt scrolly">
<!-- 							<span class="textcontainer"> -->
<!-- 								<span class="particletext confetti" style="font-size: 20px;"> -->
									추천 이벤트
<!-- 								<span class="particle c2" style="top:23%; left:77%;width:8px; height:4px;animation-delay: 1.9s;"></span><span class="particle c2" style="top:10%; left:17%;width:7px; height:4px;animation-delay: 0.4s;"></span><span class="particle c1" style="top:16%; left:71%;width:6px; height:4px;animation-delay: 0.7s;"></span><span class="particle c2" style="top:23%; left:4%;width:7px; height:4px;animation-delay: 0.2s;"></span><span class="particle c1" style="top:35%; left:21%;width:8px; height:4px;animation-delay: 2.2s;"></span><span class="particle c1" style="top:36%; left:61%;width:6px; height:3px;animation-delay: 1.8s;"></span><span class="particle c1" style="top:20%; left:76%;width:6px; height:4px;animation-delay: 2.5s;"></span><span class="particle c1" style="top:10%; left:87%;width:7px; height:4px;animation-delay: 0.7s;"></span><span class="particle c1" style="top:10%; left:82%;width:7px; height:4px;animation-delay: 2.1s;"></span><span class="particle c1" style="top:26%; left:60%;width:6px; height:3px;animation-delay: 0.1s;"></span><span class="particle c1" style="top:33%; left:82%;width:8px; height:3px;animation-delay: 2.8s;"></span><span class="particle c2" style="top:22%; left:68%;width:7px; height:4px;animation-delay: 2.5s;"></span><span class="particle c1" style="top:14%; left:91%;width:7px; height:4px;animation-delay: 1.2s;"></span><span class="particle c2" style="top:46%; left:95%;width:7px; height:4px;animation-delay: 2.5s;"></span><span class="particle c2" style="top:40%; left:55%;width:8px; height:4px;animation-delay: 2.2s;"></span><span class="particle c2" style="top:34%; left:37%;width:6px; height:3px;animation-delay: 2s;"></span><span class="particle c2" style="top:36%; left:16%;width:7px; height:3px;animation-delay: 0.8s;"></span><span class="particle c2" style="top:45%; left:92%;width:6px; height:3px;animation-delay: 2.3s;"></span><span class="particle c1" style="top:28%; left:49%;width:7px; height:3px;animation-delay: 1.6s;"></span><span class="particle c1" style="top:17%; left:79%;width:6px; height:4px;animation-delay: 0.3s;"></span><span class="particle c2" style="top:39%; left:15%;width:6px; height:4px;animation-delay: 1.7s;"></span><span class="particle c1" style="top:20%; left:86%;width:7px; height:4px;animation-delay: 1.9s;"></span><span class="particle c2" style="top:38%; left:54%;width:6px; height:4px;animation-delay: 2.8s;"></span><span class="particle c2" style="top:25%; left:60%;width:6px; height:4px;animation-delay: 0.4s;"></span><span class="particle c2" style="top:21%; left:29%;width:7px; height:4px;animation-delay: 1.6s;"></span><span class="particle c2" style="top:43%; left:78%;width:6px; height:3px;animation-delay: 0s;"></span><span class="particle c1" style="top:28%; left:79%;width:7px; height:3px;animation-delay: 1.6s;"></span><span class="particle c2" style="top:33%; left:16%;width:8px; height:3px;animation-delay: 3s;"></span><span class="particle c1" style="top:49%; left:79%;width:6px; height:3px;animation-delay: 0s;"></span><span class="particle c2" style="top:17%; left:9%;width:7px; height:4px;animation-delay: 1.1s;"></span><span class="particle c2" style="top:12%; left:95%;width:6px; height:3px;animation-delay: 1.1s;"></span><span class="particle c1" style="top:15%; left:62%;width:6px; height:3px;animation-delay: 1.9s;"></span><span class="particle c2" style="top:13%; left:58%;width:6px; height:4px;animation-delay: 0.7s;"></span><span class="particle c1" style="top:42%; left:39%;width:8px; height:4px;animation-delay: 1.8s;"></span><span class="particle c1" style="top:50%; left:95%;width:6px; height:4px;animation-delay: 0.6s;"></span></span> -->
<!-- 							</span> -->
						</a>
					</div>

				</section>

		<!-- Main -->
			<div id="main">

			<!-- One -->
				<section class="wrapper style1">
					<div class="inner">
						<header class="align-center">
							<h2>
								<span class="textcontainer">
									<span class="particletext fire">
										인기 이벤트
									<span class="particle" style="top:45%; left:13%;width:12px; height:12px;animation-delay: 0.2s;"></span><span class="particle" style="top:55%; left:87%;width:10px; height:10px;animation-delay: 0.3s;"></span><span class="particle" style="top:53%; left:-5%;width:11px; height:11px;animation-delay: 2s;"></span><span class="particle" style="top:53%; left:77%;width:8px; height:8px;animation-delay: 1.5s;"></span><span class="particle" style="top:69%; left:24%;width:8px; height:8px;animation-delay: 0.3s;"></span><span class="particle" style="top:57%; left:98%;width:9px; height:9px;animation-delay: 1.8s;"></span><span class="particle" style="top:66%; left:70%;width:8px; height:8px;animation-delay: 0.2s;"></span><span class="particle" style="top:64%; left:75%;width:8px; height:8px;animation-delay: 1.3s;"></span><span class="particle" style="top:41%; left:57%;width:11px; height:11px;animation-delay: 0.4s;"></span><span class="particle" style="top:50%; left:5%;width:10px; height:10px;animation-delay: 1.2s;"></span><span class="particle" style="top:48%; left:6%;width:8px; height:8px;animation-delay: 0.1s;"></span><span class="particle" style="top:60%; left:82%;width:8px; height:8px;animation-delay: 0.7s;"></span><span class="particle" style="top:57%; left:70%;width:8px; height:8px;animation-delay: 1s;"></span><span class="particle" style="top:45%; left:43%;width:9px; height:9px;animation-delay: 0.3s;"></span><span class="particle" style="top:48%; left:3%;width:11px; height:11px;animation-delay: 1.8s;"></span><span class="particle" style="top:49%; left:72%;width:8px; height:8px;animation-delay: 0s;"></span><span class="particle" style="top:40%; left:79%;width:11px; height:11px;animation-delay: 1.4s;"></span><span class="particle" style="top:49%; left:54%;width:11px; height:11px;animation-delay: 1.8s;"></span><span class="particle" style="top:49%; left:48%;width:8px; height:8px;animation-delay: 0.1s;"></span><span class="particle" style="top:58%; left:26%;width:8px; height:8px;animation-delay: 2s;"></span><span class="particle" style="top:41%; left:57%;width:10px; height:10px;animation-delay: 0.2s;"></span><span class="particle" style="top:66%; left:15%;width:11px; height:11px;animation-delay: 2s;"></span><span class="particle" style="top:60%; left:22%;width:10px; height:10px;animation-delay: 0.9s;"></span><span class="particle" style="top:40%; left:25%;width:12px; height:12px;animation-delay: 0.6s;"></span><span class="particle" style="top:62%; left:93%;width:8px; height:8px;animation-delay: 0.9s;"></span><span class="particle" style="top:47%; left:9%;width:10px; height:10px;animation-delay: 0.7s;"></span><span class="particle" style="top:43%; left:-2%;width:8px; height:8px;animation-delay: 0.8s;"></span><span class="particle" style="top:69%; left:2%;width:11px; height:11px;animation-delay: 1.8s;"></span><span class="particle" style="top:65%; left:9%;width:11px; height:11px;animation-delay: 2s;"></span><span class="particle" style="top:43%; left:22%;width:11px; height:11px;animation-delay: 0.8s;"></span><span class="particle" style="top:64%; left:37%;width:11px; height:11px;animation-delay: 1.8s;"></span><span class="particle" style="top:70%; left:84%;width:8px; height:8px;animation-delay: 1.1s;"></span></span>
								</span>
								<span class='neon' style='font-family: FontAwesome;font-weight:bold;font-size:23px'>HOT</span>
							</h2>
							<p>조회수 Top 3</p>
						</header>
						
						<!-- 2 Column Video Section -->
							<div class="flex flex-3">
							
								<div class="video col">
									<div class="image fit">
										<img src="/resources/images/logo.jpg"  id="peImage0" />
										<div class="arrow">
<!-- 											<div class="icon fa-play"></div> -->
										</div>
									</div>
									<p class="caption" id="pe0">
										이벤트
									</p>
									<a id="pelink0" class="link"><span>Click Me</span></a>
								</div>
								<div class="video col">
									<div class="image fit">
										<img src="/resources/images/logo.jpg"  id="peImage1" />
										<div class="arrow">
<!-- 											<div class="icon fa-play"></div> -->
										</div>
									</div>
									<p class="caption" id="pe1">
										이벤트
									</p>
									<a id="pelink1" class="link"><span>Click Me</span></a>
								</div>
								<div class="video col">
									<div class="image fit">
										<img src="/resources/images/logo.jpg"  id="peImage2"   />
										<div class="arrow">
<!-- 											<div class="icon fa-play"></div> -->
										</div>
									</div>
									<p class="caption" id="pe2">
										이벤트
									</p>
									<a id="pelink2"  class="link"><span>Click Me</span></a>
								</div>
								
							</div>
							
							
					</div>
				</section>

			<!-- Two -->
				<section id="popular" class="wrapper style2">
					<div class="inner">
						<header>
							<h2>
								<span class="textcontainer">
									<span class="particletext confetti">
										추천 이벤트
									<span class="particle c2" style="top:23%; left:77%;width:8px; height:4px;animation-delay: 1.9s;"></span><span class="particle c2" style="top:10%; left:17%;width:7px; height:4px;animation-delay: 0.4s;"></span><span class="particle c1" style="top:16%; left:71%;width:6px; height:4px;animation-delay: 0.7s;"></span><span class="particle c2" style="top:23%; left:4%;width:7px; height:4px;animation-delay: 0.2s;"></span><span class="particle c1" style="top:35%; left:21%;width:8px; height:4px;animation-delay: 2.2s;"></span><span class="particle c1" style="top:36%; left:61%;width:6px; height:3px;animation-delay: 1.8s;"></span><span class="particle c1" style="top:20%; left:76%;width:6px; height:4px;animation-delay: 2.5s;"></span><span class="particle c1" style="top:10%; left:87%;width:7px; height:4px;animation-delay: 0.7s;"></span><span class="particle c1" style="top:10%; left:82%;width:7px; height:4px;animation-delay: 2.1s;"></span><span class="particle c1" style="top:26%; left:60%;width:6px; height:3px;animation-delay: 0.1s;"></span><span class="particle c1" style="top:33%; left:82%;width:8px; height:3px;animation-delay: 2.8s;"></span><span class="particle c2" style="top:22%; left:68%;width:7px; height:4px;animation-delay: 2.5s;"></span><span class="particle c1" style="top:14%; left:91%;width:7px; height:4px;animation-delay: 1.2s;"></span><span class="particle c2" style="top:46%; left:95%;width:7px; height:4px;animation-delay: 2.5s;"></span><span class="particle c2" style="top:40%; left:55%;width:8px; height:4px;animation-delay: 2.2s;"></span><span class="particle c2" style="top:34%; left:37%;width:6px; height:3px;animation-delay: 2s;"></span><span class="particle c2" style="top:36%; left:16%;width:7px; height:3px;animation-delay: 0.8s;"></span><span class="particle c2" style="top:45%; left:92%;width:6px; height:3px;animation-delay: 2.3s;"></span><span class="particle c1" style="top:28%; left:49%;width:7px; height:3px;animation-delay: 1.6s;"></span><span class="particle c1" style="top:17%; left:79%;width:6px; height:4px;animation-delay: 0.3s;"></span><span class="particle c2" style="top:39%; left:15%;width:6px; height:4px;animation-delay: 1.7s;"></span><span class="particle c1" style="top:20%; left:86%;width:7px; height:4px;animation-delay: 1.9s;"></span><span class="particle c2" style="top:38%; left:54%;width:6px; height:4px;animation-delay: 2.8s;"></span><span class="particle c2" style="top:25%; left:60%;width:6px; height:4px;animation-delay: 0.4s;"></span><span class="particle c2" style="top:21%; left:29%;width:7px; height:4px;animation-delay: 1.6s;"></span><span class="particle c2" style="top:43%; left:78%;width:6px; height:3px;animation-delay: 0s;"></span><span class="particle c1" style="top:28%; left:79%;width:7px; height:3px;animation-delay: 1.6s;"></span><span class="particle c2" style="top:33%; left:16%;width:8px; height:3px;animation-delay: 3s;"></span><span class="particle c1" style="top:49%; left:79%;width:6px; height:3px;animation-delay: 0s;"></span><span class="particle c2" style="top:17%; left:9%;width:7px; height:4px;animation-delay: 1.1s;"></span><span class="particle c2" style="top:12%; left:95%;width:6px; height:3px;animation-delay: 1.1s;"></span><span class="particle c1" style="top:15%; left:62%;width:6px; height:3px;animation-delay: 1.9s;"></span><span class="particle c2" style="top:13%; left:58%;width:6px; height:4px;animation-delay: 0.7s;"></span><span class="particle c1" style="top:42%; left:39%;width:8px; height:4px;animation-delay: 1.8s;"></span><span class="particle c1" style="top:50%; left:95%;width:6px; height:4px;animation-delay: 0.6s;"></span></span>
								</span>
							</h2>
							<p>T-GET이 추천하는 이달의 이벤트 Top 3</p>							
						</header>
						
						<!-- Tabbed Video Section -->
							<div class="flex flex-tabs">
								<ul class="tab-list">
									<li><a id="tab0"  href="#" data-tab="tab-1" class="active" style="display:none;">추천이벤트1</a></li>
									<li><a id="tab1" href="#" data-tab="tab-2" style="display:none;">추천이벤트2</a></li>
									<li><a  id="tab2"  href="#" data-tab="tab-3" style="display:none;">추천이벤트3</a></li>
								</ul>
								<div class="tabs">

									<!-- Tab 1 -->
										<div class="tab tab-1 flex flex-3 active">
											<div class="row mb-1">											    
											    <div class="col-md-12">
											      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
											        <div class="col p-4 d-flex flex-column position-static">
<!-- 											          <strong class="d-inline-block mb-2 text-primary">음악공연</strong> -->
											          <h3 class="mb-0"  id="goRecommEvent0">EXO Seoul</h3>
											          <div class="mb-1 text-muted" id="recommDetail0">2019-07-27</div>
											          <a id="getEvent0" href="#" class="">상세보기</a>
											        </div>
											        <video controls id="videoName0"  src="/resources/video/videoplayback.mp4"  type="video/mp4" ></video>
											        <div class="col-auto d-none d-lg-block">
											        	
<!-- 											          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"> -->
<!-- 											          <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
											        </div>
											      </div>
											    </div>
									
<!-- 											    <div class="col-md-12"> -->
<!-- 											      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative"> -->
<!-- 											        <div class="col p-4 d-flex flex-column position-static"> -->
<!-- 											          <strong class="d-inline-block mb-2 text-primary">음악공연</strong> -->
<!-- 											          <h3 class="mb-0">EXO Seoul</h3> -->
<!-- 											          <div class="mb-1 text-muted">2019-07-27</div> -->
<!-- 											          <a href="#" class="">상세보기</a> -->
<!-- 											        </div> -->
<!-- 											        <div class="col-auto d-none d-lg-block"> -->
<!-- 											          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"> -->
<!-- 											          <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
<!-- 											        </div> -->
<!-- 											      </div> -->
<!-- 											    </div> -->
											    
<!-- 											    <div class="col-md-6"> -->
<!-- 											      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative"> -->
<!-- 											        <div class="col p-4 d-flex flex-column position-static"> -->
<!-- 											          <strong class="d-inline-block mb-2 text-primary">음악공연</strong> -->
<!-- 											          <h3 class="mb-0">EXO Seoul</h3> -->
<!-- 											          <div class="mb-1 text-muted">2019-07-27</div> -->
<!-- 											          <a href="#" class="">상세보기</a> -->
<!-- 											        </div> -->
<!-- 											        <div class="col-auto d-none d-lg-block"> -->
<!-- 											          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"> -->
<!-- 											          <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
<!-- 											        </div> -->
<!-- 											      </div> -->
<!-- 											    </div> -->
											    
<!-- 											    <div class="col-md-6"> -->
<!-- 											      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative"> -->
<!-- 											        <div class="col p-4 d-flex flex-column position-static"> -->
<!-- 											          <strong class="d-inline-block mb-2 text-primary">음악공연</strong> -->
<!-- 											          <h3 class="mb-0">EXO Seoul</h3> -->
<!-- 											          <div class="mb-1 text-muted">2019-07-27</div> -->
<!-- 											          <a href="#" class="">상세보기</a> -->
<!-- 											        </div> -->
<!-- 											        <div class="col-auto d-none d-lg-block"> -->
<!-- 											          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"> -->
<!-- 											          <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
<!-- 											        </div> -->
<!-- 											      </div> -->
<!-- 											    </div> -->
											</div>
										</div>

									<!-- Tab 2 -->
									<div class="tab tab-2 flex flex-3">
											<div class="row mb-1">											    
											    <div class="col-md-12">
											      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
											        <div class="col p-4 d-flex flex-column position-static">
											          <strong class="d-inline-block mb-2 text-primary">음악공연</strong>
											          <h3 class="mb-0">EXO Seoul</h3>
											          <div class="mb-1 text-muted">2019-07-27</div>
											          <a id="getEvent1" href="#" class="">상세보기</a>
											        </div>
											        <video id="videoName1"  autoplay="autoplay"  controls id="videoName0"  src="/resources/video/videoplayback.mp4"  type="video/mp4" ></video>
											        <div class="col-auto d-none d-lg-block">
											        	
<!-- 											          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"> -->
<!-- 											          <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
											        </div>
											      </div>
											    </div>
											</div>
										</div>   
									
										<div class="tab tab-3 flex flex-3">
											<div class="row mb-1">											    
											    <div class="col-md-12">
											      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
											        <div class="col p-4 d-flex flex-column position-static">
											          <strong class="d-inline-block mb-2 text-primary">음악공연</strong>
											          <h3 class="mb-0">EXO Seoul</h3>
											          <div class="mb-1 text-muted">2019-07-27</div>
											          <a id="getEvent2"  href="#" class="">상세보기</a>
											        </div>
											        <video id="videoName1"  autoplay="autoplay"  controls id="videoName0"  src="/resources/video/videoplayback.mp4"  type="video/mp4" ></video>
											        <div class="col-auto d-none d-lg-block">
											        	
<!-- 											          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"> -->
<!-- 											          <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
											        </div>
											      </div>
											    </div>
											</div>
										</div>   
									
									
<!-- 										<div class="tab tab-2 flex flex-3"> -->
<!-- 											<div class="thumbnails"> -->
<!-- 												<div class="box"> -->
<!-- 														<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="/resources/images/pic01.jpg" alt="" /></a> -->
<!-- 														<div class="inner"> -->
<!-- 															<h3>Nascetur nunc varius commodo</h3> -->
<!-- 															<p>Interdum amet accumsan placerat commodo ut amet aliquam blandit nunc tempor lobortis nunc non. Mi accumsan.</p> -->
<!-- 															<a href="https://youtu.be/s6zR2T9vn2c" class="button fit" data-poptrox="youtube,800x400">Watch</a> -->
<!-- 														</div> -->
<!-- 												</div> -->
<!-- 												<div class="box"> -->
<!-- 														<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="/resources/images/pic01.jpg" alt="" /></a> -->
<!-- 														<div class="inner"> -->
<!-- 															<h3>Nascetur nunc varius commodo</h3> -->
<!-- 															<p>Interdum amet accumsan placerat commodo ut amet aliquam blandit nunc tempor lobortis nunc non. Mi accumsan.</p> -->
<!-- 															<a href="https://youtu.be/s6zR2T9vn2c" class="button fit" data-poptrox="youtube,800x400">Watch</a> -->
<!-- 														</div> -->
<!-- 												</div> -->
<!-- 												<div class="box"> -->
<!-- 														<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="/resources/images/pic01.jpg" alt="" /></a> -->
<!-- 														<div class="inner"> -->
<!-- 															<h3>Nascetur nunc varius commodo</h3> -->
<!-- 															<p>Interdum amet accumsan placerat commodo ut amet aliquam blandit nunc tempor lobortis nunc non. Mi accumsan.</p> -->
<!-- 															<a href="https://youtu.be/s6zR2T9vn2c" class="button fit" data-poptrox="youtube,800x400">Watch</a> -->
<!-- 														</div> -->
<!-- 												</div>												 -->
<!-- 											</div> -->
<!-- 										</div> -->

												<!-- Tab 3 -->
<!-- 										<div class="tab tab-3 flex flex-3"> -->
											
<!-- 										</div> -->

								</div>
							</div>
					</div>
				</section>
			
			</div>

		<!-- Footer -->
			<footer id="footer">
				<div class="inner">
					<div class="flex flex-3">
						<div class="col">
							<h3>공지사항</h3>
							<ul class="alt">
								<li><a href="#">티켓거래 공지</a></li>
								<li><a href="#">자유게시판 이용공지</a></li>
								<li><a href="#">자주묻는질문</a></li>
							</ul>
						</div>
						<div class="col">
							<h3>자유게시판</h3>
							<ul class="alt">
								<li><a href="#">삽니다</a></li>
								<li><a href="#">팝니다</a></li>
								<li><a href="#">수다방</a></li>
							</ul>
						</div>
						<div class="col">
							<h3>고객센터</h3>
							<ul class="alt">
								<li><a href="#">1:1 문의하기</a></li>
								<li><a href="#">환불게시판</a></li>
							
							</ul>
						</div>
					</div>
				</div>
				<div class="copyright">
					<ul class="icons">
						<li><a href="#" >Back to Top</a></li>
					</ul>
					&copy; T-GET. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Coverr</a>. Video: <a href="https://coverr.co">Coverr</a>.
				</div>
			</footer>

		<!-- Scripts -->	
		
		<script type="text/javascript">
			var recommSize = "";
			var eventNameArr = [];
			var videoNameArr = [];
			var recommEventNameArr = [];
			var recommEventDetailArr = [];
			$(function(){
				
				$.ajax(
						{
							url : "/event/rest/getRecommendedEventList",
							method : "POST",
							dataType : "json",
							success : function(JSONData, status){
		// 							alert(status);
									recommSize = JSONData.recommEventlistSize;
									$.each(JSONData.eventNameList, function(index,value){
										$("#getEvent"+index).val(value);
										$("#tab"+index).attr( "style","display:block;");
									 });
									$.each(JSONData.videoNameList, function(index,value){
										$("#videoName"+index).attr("src","/resources/video/"+value);
									 });
									$.each(JSONData.recommEventNameList, function(index,value){
										$("#goRecommEvent"+index).text(value);
										
		// 								alert(value);
									 });
									$.each(JSONData.recommEventDetailList, function(index,value){
										$("#recommDetail"+index).text(value);
									 });
		// 						$("form").attr("method" , "POST").attr("action" , "/event/getEventList").submit();
							}
				});
				
				
				$.ajax(
						{
							url : "/event/rest/getPopularEventList",
							method : "POST",
							dataType : "json",
							success : function(JSONData, status){
		// 							alert(status);
									recommSize = JSONData.recommEventlistSize;
									$.each(JSONData.eventNameList, function(index,value){
										$("#pelink"+index).val(value);
									 });
									$.each(JSONData.eventImageList, function(index,value){
										$("#peImage"+index).attr("src","/resources/images/uploadFiles/"+value);
									 });
									$.each(JSONData.koNameList, function(index,value){
										$("#pe"+index).text(value);
									 });
		// 						$("form").attr("method" , "POST").attr("action" , "/event/getEventList").submit();
							}
				});
				
				$("input[name='searching']").on("keyup",function(){
					$("#searchKeyword").val($("input[name='searching']").val());
				});
				
				$("input[type='text']").on("keypress",function(){
					if (event.keyCode ==13) {
						$("#searchCondition").val("1");
						$("form[name='searchEvent']").attr("method" , "POST").attr("action" , "/event/getEventList").submit();
					}
				});
				
				$("a:contains('검색')").on("click",function(){
					$("#searchCondition").val("1");
					$("form").attr("method" , "POST").attr("action" , "/event/getEventList").submit();
				});
				
				$(".p-2").on("click",function(){
		// 			alert($(this).text());
					$("#searchCondition").val("0");
					 $.ajax(
								{
									url : "/event/rest/getCategory",
									method : "POST",
									data : {
										categoryTwoName : $(this).text()
												},
									dataType : "json",
									success : function(JSONData, status){
		// 								alert(status);
										$("#searchKeyword").val(JSONData.categoryTwoEng);
										$("form").attr("method" , "POST").attr("action" , "/event/getEventList").submit();
									}
						});
				});	
				
				
				$("a:contains('상세보기')").on("click",function(){
					$("form").attr("method" , "POST").attr("action" , "/event/getEvent?category=&eventName="+$(this).val()).submit();
				});
				
				$("a:contains('Click Me')").on("click",function(){
					$("form").attr("method" , "POST").attr("action" , "/event/getEvent?category=&eventName="+$(this).val()).submit();
				});

				initparticles();
			});	
			
	 </script>
	</body>
</html>
