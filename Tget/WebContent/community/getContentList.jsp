<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>T-GET</title>

	<link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/blog/">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<!-- 	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->
    <script src="https://unpkg.com/ionicons@4.5.10-0/dist/ionicons.js"></script>	
	

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/community/getContentList").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 //$( "button.btn.btn-default" ).on("click" , function() {
			//	fncGetUserList(1);
			//});
		 });
		
		
	
		 $(function() {
			
			 $( "button.btn.btn-danger:contains('글 등록하기')" ).on("click" , function() {
					self.location="/community/addContent"	
				});
			 
			 $( "button.btn.btn-primary:contains('티켓 거래 공지')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=0";	
				
				});
			 
			 $( "button.btn.btn-info:contains('자유게시판 이용 공지')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=1";	
				
				});
			 
			 $( "button.btn.btn-danger:contains('자주 찾는 질문')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=2";	
				
				});
			 
			 $( "button.btn.btn-secondary:contains('삽니다')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=3";	
				
				});
			 
			 $( "button.btn.btn-success:contains('팝니다')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=4";	
				
				});
			 
			 $( "button.btn.btn-dark:contains('수다방')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=5";	
				
				});
			 
			 $( "button.btn.btn-warning:contains('신고')" ).on("click" , function() {	
				 	//alert($(this).val())
				 	self.location="/community/addReport?contentNo="+$(this).val();
				});
				
			 $( "button.btn.btn-warning:contains('환불게시판')" ).on("click" , function() {
					self.location="/community/updateRefund?contentNo="+$(this).val();	
				
				});
			 
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(2)" ).on("click" , function() {
				self.location ="/community/getContent?contentNo="+$(this).children('#contentNo').text().trim();
			});
			
						
			//==> userId LINK Event End User 에게 보일수 있도록 
			$( "td:nth-child(2)" ).css("color" , "black");
			$("h7").css("color" , "red");
			
			$(".ct_list_pop:nth-child(n)").on("mouseenter", function(){
				$(this).css({
					"background-color":"#808080",
					"font-weight":"bolder"
				});
			})
			.on("mouseleave", function(){
				var style = {
						backgroundColor: "",//#ddd
						fontWeight:""
				};
				$(this).css(style);
			});
	
	});	
		 
		 $(function() {
				
				$("ion-icon.btn.btn-info:contains('공감')").on("click" , function() {
					
					//div:contains("contentNo")
					//'div[name="contentNo"]'
					//'div[id="contentNo"]'
					var contentNo = $(this).attr("id").trim();
					var goodCount = $('span').closest("#"+contentNo+"").text().trim();
					//alert(goodCount);
					var result = parseInt(goodCount)+1;
					$.ajax(
			    		{
			    	
			        method:"GET",
			        url : "/community/rest/updateGoodCount/"+contentNo,
			        dataType: "json",
			        header:{
			        	"Accept" : "application/json",
						"Content-Type" : "application/json"	
			        },
			        success : function(data){
			        	//alert(data.result);
			        	
 			        	if($.trim(data.result)=="good"){
 			        		$('span').closest("#"+contentNo+"").text(result);
 			        	}
			        	
			        }
			        
			    	});
					//alert("ok");
				});
		 });
		 
 		  $(function() {
				
				$("ion-icon.btn.btn-danger:contains('비공감')").on("click" , function() {
				
					var contentNo = $(this).attr("id").trim();
					var badCount = $('a').closest("#"+contentNo+"").text().trim();
					var result1 = parseInt(badCount)+1;
					
					$.ajax(
			    		{
			    	
			        method:"GET",
			        url : "/community/rest/updateBadCount/"+contentNo,
			        dataType: "json",
			        header:{
			        	"Accept" : "application/json",
						"Content-Type" : "application/json"	
			        },
			        success : function(data){
			        	
			        	if($.trim(data.result)=="bad"){
 			        	$('a').closest("#"+contentNo+"").text(result1);
			        	} 
			        } 
			        
			    	});
				});
		 });
	</script>
	
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<!-- ToolBar Start /////////////////////////////////////-->
	
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>전체 게시글 목록 조회</h3>
	       
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${totalCount } 건수
		    	</p>
		    </div>	
		    	
		    
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
			    
			    <button type="button" class="btn btn-primary">티켓 거래 공지</button>
			    <button type="button" class="btn btn-info">자유게시판 이용 공지</button>
			    <button type="button" class="btn btn-danger">자주 찾는 질문</button>
			    <button type="button" class="btn btn-secondary">삽니다</button>
			    <button type="button" class="btn btn-success">팝니다</button>
			    <button type="button" class="btn btn-dark">수다방</button>
			    <button type="button" class="btn btn-warning">환불게시판</button>
			    
			    <button type="button" class="btn btn-danger">글 등록하기</button>
			    
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
				    <option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>게시글 명</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어">
				  </div>
				  
				  <button type="button" class="btn btn-info">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left">글 제목</th>
<!--              <th align="left">글 내용</th>  -->
            <th align="left">작성자</th>
            <th align="left">작성일</th>
            <th align="left">신고하기</th>
            <th align="left">공감/비공감</th>
            
            
			
			
			
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="content" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left" class="btn btn-link">${content.contentName}
			  <div id="contentNo" name="contentNo">${content.contentNo}</div>
			  <!--  <div id="contentNo" style="display:none;">${content.contentNo}</div></td>-->
			 <!-- <input type="hidden" id="contentNo" name=contentNo value="${content.contentNo}" /> --> 
			   
<%--  			  <td align="left">${content.contentBody}</td> --%>
			  <td align="left">${content.userId}</td>
			  <!-- <div id="userId" style="display:none;">${content.userId}</div></td> -->
			  <td align="left">${content.regDate}</td> 
			  <td align="left"><button type="button" value="${content.contentNo}" class="btn btn-warning">신고</button>
		   	  <td align="left">
		   	  <ion-icon name="thumbs-up" class="btn btn-info" id="${content.contentNo}">공감</ion-icon>
		   	  <span id="${content.contentNo}">${content.goodCount}</span>
		   	 <ion-icon name="thumbs-down" class="btn btn-danger" id="${content.contentNo}">비공감</ion-icon>
		   	 <a id="${content.contentNo}">${content.badCount}</a> 
				</td>
  					 
			
			</tr>
          <tr>
		</tr>
          </c:forEach>
		
        </tbody>
      
      </table>
      
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
<%-- 	<jsp:include page="../common/pageNavigator_new.jsp"/> --%>
	<!-- PageNavigation End... -->
	
</body>

</html>