<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html lang="ko">
  <head>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>T-GET</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/blog/">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet">
	<!-- 타이틀용 글씨 -->
	<link href="https://fonts.googleapis.com/css?family=Acme|Bungee+Shade|Fredericka+the+Great&display=swap" rel="stylesheet">
	
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script type="text/javascript">
	var str = "";
	$(function(){
		$("input[type='text']").on("keyup",function(){
			$("#searchKeyword").val($("input[type='text']").val());
// 			alert("keyup : "+$("#searchKeyword").val());
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
// 								str = JSONData.categoryTwoEng;
								$("#searchKeyword").val(JSONData.categoryTwoEng);
// 								alert(JSONData.categoryTwoEng);
								$("form").attr("method" , "POST").attr("action" , "/event/getEventList").submit();
							}
				});
		});	
		
	});	
	</script>
	
    <style>
    
        .p-2, .display-4 {
       	 font-family: 'Shadows Into Light', 'Nanum pen Script', cursive;
       	 font-size: 30px;
       }
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .row{
		font-family: 'Sunflower', sans-serif;
	 	font-size: 20px;           
      }
      .col-4{
      	font-family: 'Acme', sans-serif; 
 		font-size: 50px;
      }
    </style>
  </head>
  <body>
  <form>
  <jsp:include page="/layout/toolbar.jsp" />
  
    <input type="hidden" id="requestPageToken" name="requestPageToken" value="${requestPageToken }"/><br/>
	<input type="hidden" id="searchCondition" name="searchCondition" 
	placeholder="searchCondition" value="${!empty search.searchCondition? search.searchCondition : ''}"/><br/>
	<input type="hidden"  id="searchKeyword" name="searchKeyword"  
	placeholder="searchKeyword" value="${!empty search.searchKeyword? search.searchKeyword : ''}" ><br/>
	
	
  <div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-4 pt-1">        
      </div>
      <div class="col-4 text-center">
        <h1>T-GET</h1>
      </div>
      <div class="col-4 d-flex justify-content-end align-items-center">        
      </div>
    </div>
  </header>

  <div class="nav-scroller py-1 mb-2">
    <nav class="nav d-flex justify-content-between">
      <a href="#" class="p-2 text-muted"  >콘서트</a>
      <a href="#" class="p-2 text-muted" >페스티벌</a>
      <a href="#" class="p-2 text-muted"  >뮤지컬</a>
      <a href="#" class="p-2 text-muted"  >클래식/오페라</a>
      <a href="#" class="p-2 text-muted"  >축구</a>
      <a href="#" class="p-2 text-muted"  >야구</a>
      <a href="#" class="p-2 text-muted"  >골프</a>
    </nav>
  </div>

  <div class="jumbotron p-4 p-md-5 text-white rounded bg-dark">
  <div>
      <h1 class="display-4 font-italic text-center">티켓 판매와 구매는 ? T-GET !</h1>
      <br/>
      <br/>
      <div class="row">
	      <div class="col-sm">
	      </div>
	      <div class="col-sm-8">
	      <div class="input-group">		    
		    <input type="text" class="form-control"  placeholder="이벤트/아티스트/팀">
		    <div class="input-group-append">
		    	<a class="input-group-text" href="#">검색</a>
		    </div>
		  </div>
		  <small class="form-text">판매 및 구매하고 싶은 이벤트를 검색 해보세요.</small>		
	      </div>
	      <div class="col-sm">
	      </div>      		
    	</div>
  </div>
</div>
	<h3 class="pb-4 mb-4 text-center border-bottom">
        인기 이벤트
    </h3>
  <div class="row mb-2">
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary">음악공연</strong>
          <h3 class="mb-0">EXO Seoul</h3>
          <div class="mb-1 text-muted">2019-07-27</div>
          <p class="card-text mb-auto">추천추천추천추천추천추천추천추천추천추천</p>
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
          <p class="card-text mb-auto">추천추천추천추천추천추천추천추천추천추천</p>
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
          <p class="card-text mb-auto">추천추천추천추천추천추천추천추천추천추천</p>
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
          <p class="card-text mb-auto">추천추천추천추천추천추천추천추천추천추천</p>
          <a href="#" class="">상세보기</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
          <title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
        </div>
      </div>
    </div>
</div>

<main role="main" class="container">
  <div class="row">
    <div class="col-md-8">
      <h3 class="pb-4 mb-4 border-bottom">
        추천 이벤트
      </h3>
       
      
    </div>

    <aside class="col-md-4 blog-sidebar">

      <div class="p-4">
        <h4 class="font-italic">Community</h4>
        <ol class="list-unstyled mb-0">
          <li><a href="#">링크</a></li>
          <li><a href="#">링크</a></li>
          <li><a href="#">링크</a></li>
          <li><a href="#">링크</a></li>
          <li><a href="#">링크</a></li>
          <li><a href="#">링크</a></li>
        </ol>
      </div>

      <div class="p-4">
        <h4 class="font-italic">Notice</h4>
        <ol class="list-unstyled">
          <li><a href="#">링크</a></li>
          <li><a href="#">링크</a></li>
          <li><a href="#">링크</a></li>
        </ol>
      </div>
    </aside><!-- /.blog-sidebar -->

  </div><!-- /.row -->

</main><!-- /.container -->

<footer class="blog-footer">
  <p class="text-center">
    <a href="#">Back to top</a>
  </p>
</footer>
</form>
</body>
</html>
