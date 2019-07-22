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
    	    	
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/css/videoBox.css" />
		<link rel="stylesheet" href="/resources/css/main.css" />
	</head>
	<body>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
		<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
				
		<script src="/resources/javascript/common.js" ></script>
		<script src="/resources/javascript/alarm.js" ></script>
		<script src="/resources/javascript/jquery.min.js"></script>
		<script src="/resources/javascript/jquery.scrolly.min.js"></script>
		<script src="/resources/javascript/skel.min.js"></script>
		<script src="/resources/javascript/util.js"></script>
		<script src="/resources/javascript/main.js"></script>	
		
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
										$("#goRecommEvent"+index).val(value);
									 });
									$.each(JSONData.videoNameList, function(index,value){
										$("#videoName"+index).attr("src","/resources/video/"+value);
									 });
									$.each(JSONData.recommEventNameList, function(index,value){
										$("#nav-"+index+"-tab").text(value).attr( "style","display:block;");
		// 								alert(value);
									 });
									$.each(JSONData.recommEventDetailList, function(index,value){
										$("#recommDetail"+index).text(value);
									 });
		// 						$("form").attr("method" , "POST").attr("action" , "/event/getEventList").submit();
							}
				});
				
				$("input[type='text']").on("keyup",function(){
					$("#searchKeyword").val($("input[type='text']").val());
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
				
				
				$("button:contains('이벤트바로가기')").on("click",function(){
					$("form").attr("method" , "POST").attr("action" , "/event/getEvent?category=&eventName="+$(this).val()).submit();
				});
				
			});	
			
	 </script>
 	 <jsp:include page="/layout/tgetToolbar.jsp" />
		
			<!-- Banner -->
			<!--
				To use a video as your background, set data-video to the name of your video without
				its extension (eg. images/banner). Your video must be available in both .mp4 and .webm
				formats to work correctly.
			-->
				<section id="banner" data-video="/resources/video/UEFA">
					<div class="inner">
					<form>
					<input type="hidden" id="requestPageToken" name="requestPageToken" value="${requestPageToken }"/>
					<input type="hidden" id="searchCondition" name="searchCondition" 
					placeholder="searchCondition" value="${!empty search.searchCondition? search.searchCondition : ''}"/>
					<input type="hidden"  id="searchKeyword" name="searchKeyword"  
					placeholder="searchKeyword" value="${!empty search.searchKeyword? search.searchKeyword : ''}" >
					
							<div class="input-group">		    
							    <input type="text" class="form-control" width="100%"  placeholder="이벤트/아티스트/팀">
							    <div class="input-group-append">
							    	<a class="input-group-text" href="#">검색</a>
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
						<a href="#main" class="button big alt scrolly">추천 이벤트</a>
						<a href="#popular" class="button big alt scrolly">인기 이벤트</a>
					</div>

				</section>

		<!-- Main -->
			<div id="main">

			<!-- One -->
				<section class="wrapper style1">
					<div class="inner">
						<header class="align-center">
							<h2>추천 이벤트</h2>
							<p>T-GET이 추천하는 이달의 이벤트 Top 3</p>
						</header>
						<!-- 2 Column Video Section -->
							<div class="flex flex-3">
								<div class="video col">
									<div class="image fit">
										<img src="/resources/images/pic07.jpg" alt="" />
										<div class="arrow">
											<div class="icon fa-play"></div>
										</div>
									</div>
									<p class="caption">
										이벤트 설명
									</p>
									<a href="generic.html" class="link"><span>Click Me</span></a>
								</div>
								<div class="video col">
									<div class="image fit">
										<img src="/resources/images/pic08.jpg" alt="" />
										<div class="arrow">
											<div class="icon fa-play"></div>
										</div>
									</div>
									<p class="caption">
										이벤트 설명
									</p>
									<a href="generic.html" class="link"><span>Click Me</span></a>
								</div>
								<div class="video col">
									<div class="image fit">
										<img src="/resources/images/pic02.jpg" alt="" />
										<div class="arrow">
											<div class="icon fa-play"></div>
										</div>
									</div>
									<p class="caption">
										이벤트 설명
									</p>
									<a href="generic.html" class="link"><span>Click Me</span></a>
								</div>
							</div>
					</div>
				</section>

			<!-- Two -->
				<section id="popular" class="wrapper style2">
					<div class="inner">
						<header>
							<h2>인기 이벤트</h2>
							<p>카테고리 별 조회수 Top 4</p>
						</header>
						
						<!-- Tabbed Video Section -->
							<div class="flex flex-tabs">
								<ul class="tab-list">
									<li><a href="#" data-tab="tab-1" class="active">음악 공연</a></li>
									<li><a href="#" data-tab="tab-2">스포츠</a></li>
									<li><a href="#" data-tab="tab-3">기타 예술공연</a></li>
								</ul>
								<div class="tabs">

									<!-- Tab 1 -->
										<div class="tab tab-1 flex flex-3 active">
											<div class="row mb-2">											    
											    <div class="col-md-6">
											      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
											        <div class="col p-4 d-flex flex-column position-static">
											          <strong class="d-inline-block mb-2 text-primary">음악공연</strong>
											          <h3 class="mb-0">EXO Seoul</h3>
											          <div class="mb-1 text-muted">2019-07-27</div>
											          <a href="#" class="">상세보기</a>
											        </div>
											        <div class="col-auto d-none d-lg-block">
											          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
											          <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
											        </div>
											      </div>
											    </div>
											    
											    <div class="col-md-6">
											      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
											        <div class="col p-4 d-flex flex-column position-static">
											          <strong class="d-inline-block mb-2 text-primary">음악공연</strong>
											          <h3 class="mb-0">EXO Seoul</h3>
											          <div class="mb-1 text-muted">2019-07-27</div>
											          <a href="#" class="">상세보기</a>
											        </div>
											        <div class="col-auto d-none d-lg-block">
											          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
											          <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
											        </div>
											      </div>
											    </div>
											    
											    <div class="col-md-6">
											      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
											        <div class="col p-4 d-flex flex-column position-static">
											          <strong class="d-inline-block mb-2 text-primary">음악공연</strong>
											          <h3 class="mb-0">EXO Seoul</h3>
											          <div class="mb-1 text-muted">2019-07-27</div>
											          <a href="#" class="">상세보기</a>
											        </div>
											        <div class="col-auto d-none d-lg-block">
											          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
											          <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
											        </div>
											      </div>
											    </div>
											    
											    <div class="col-md-6">
											      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
											        <div class="col p-4 d-flex flex-column position-static">
											          <strong class="d-inline-block mb-2 text-primary">음악공연</strong>
											          <h3 class="mb-0">EXO Seoul</h3>
											          <div class="mb-1 text-muted">2019-07-27</div>
											          <a href="#" class="">상세보기</a>
											        </div>
											        <div class="col-auto d-none d-lg-block">
											          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
											          <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
											        </div>
											      </div>
											    </div>
											</div>
										</div>

									<!-- Tab 2 -->
										<div class="tab tab-2 flex flex-3">
											<div class="thumbnails">
												<div class="box">
														<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="/resources/images/pic01.jpg" alt="" /></a>
														<div class="inner">
															<h3>Nascetur nunc varius commodo</h3>
															<p>Interdum amet accumsan placerat commodo ut amet aliquam blandit nunc tempor lobortis nunc non. Mi accumsan.</p>
															<a href="https://youtu.be/s6zR2T9vn2c" class="button fit" data-poptrox="youtube,800x400">Watch</a>
														</div>
												</div>
												<div class="box">
														<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="/resources/images/pic01.jpg" alt="" /></a>
														<div class="inner">
															<h3>Nascetur nunc varius commodo</h3>
															<p>Interdum amet accumsan placerat commodo ut amet aliquam blandit nunc tempor lobortis nunc non. Mi accumsan.</p>
															<a href="https://youtu.be/s6zR2T9vn2c" class="button fit" data-poptrox="youtube,800x400">Watch</a>
														</div>
												</div>
												<div class="box">
														<a href="https://youtu.be/s6zR2T9vn2c" class="image fit"><img src="/resources/images/pic01.jpg" alt="" /></a>
														<div class="inner">
															<h3>Nascetur nunc varius commodo</h3>
															<p>Interdum amet accumsan placerat commodo ut amet aliquam blandit nunc tempor lobortis nunc non. Mi accumsan.</p>
															<a href="https://youtu.be/s6zR2T9vn2c" class="button fit" data-poptrox="youtube,800x400">Watch</a>
														</div>
												</div>												
											</div>
										</div>

									<!-- Tab 3 -->
										<div class="tab tab-3 flex flex-3">
											
										</div>

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
								<li><a href="#">link</a></li>
								<li><a href="#">link</a></li>
								<li><a href="#">link</a></li>
								<li><a href="#">link</a></li>
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
		
		
	</body>
</html>
