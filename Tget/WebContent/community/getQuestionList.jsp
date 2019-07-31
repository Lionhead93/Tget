<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
		<title>T-GET</title>
		<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    	<meta name="description" content="Tab Styles Inspiration: A small collection of styles for tabs" />
		<meta name="keywords" content="tabs, inspiration, web design, css, modern, effects, svg" />
		<meta name="author" content="Codrops" />
    	

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/css/toolbar.css" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="/resources/css/tabs.css" />
		<link rel="stylesheet" type="text/css" href="/resources/css/tabstyles.css" />
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
		
		
	

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	body{	
		      color: #FBFCFE ;		  
			  background-color: #062038;
			  margin-top: 50px;				
			  font-family: 'Nanum Gothic', sans-serif;
		}
		a, hr{
			color: #FBFCFE ;	
		}
		.list-group-item{
			  margin-left:50px;	
			  color: #FBFCFE ;
			  border: 1px groove white;		  
			  background-color: #062038;
		}
		table{
			background-color: #193147;
		}
		td, th{
			border: 1px solid white;
			color: #FBFCFE ;
		}
		.col-md-2{
			padding-left: 50px;
		}	
		.col-lg-3{			
			margin-bottom: 20px;
		}
		.col-md-10{
			padding-left: 100px;
			padding-right: 100px;
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
			margin-left: 40px;
		}
		#inputGroupSelect01, nav{
			background: rgba(4, 22, 37, 0.75);
			color: #c0c5c9;
		}
		#cyberWidget{
       		background-color: white;
       }  
       #footer{
			background-color: #1B1B1F;
		}
		
		
	/* 	게시글 등록 Modal */
		.modal-dialog.modal-80size {
		  width: 300%;
		  height: 100%;
		  margin: 0;
		  padding: 0;
		}
		
		.modal-content.modal-80size {
		  color: black;
		  height: auto;  
		  min-height: 150%;
		  border-radius: 0;
		}
		
		.modal.modal-center {
		  text-align: center;
		}
		
		@media screen and (min-width: 768px) {
		  .modal.modal-center:before {
		    display: inline-block;
		    vertical-align: middle;
		    content: " ";
		    height: 100%;
		   
		  }
		}
		
		.modal-dialog.modal-center {
		  display: inline-block;
		  text-align: left;
		  vertical-align: middle;
		}

    </style>
    
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
		<script src="//cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
		<script src="/resources/javascript/modernizr.custom.js"></script>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
			
		 $(function() {
			
 			 $( "button.btn.btn-info:contains('등록')" ).on("click" , function() {
 					//self.location="/community/addContent"	
	 				var contentName= $("input[name='contentName']").val();
					var contentBody= $("textarea[name='contentBody']").val();
					
					if(contentName == null || contentName.length<1){
						alert("제목을 입력해 주세요.");
						return;
					}
					
					alert("등록 되었습니다.")
					$("form[name='addContent']").attr("enctype","multipart/form-data").attr("method" , "POST").attr("action" , "/community/addContent").submit();
 				});
			 
			 $( "a[href='#']:contains('티켓 거래 공지')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=0";	
				
				});
			 
			 $( "a[href='#']:contains('자유게시판 이용 공지')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=1";	
				
				});
			 
			 $( "a[href='#']:contains('자주 묻는 질문')" ).on("click" , function() {
					self.location="/community/getQuestionList";	
				
				});
			 
			 $( "a[href='#']:contains('삽니다')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=3";	
				
				});
			 
			 $( "a[href='#']:contains('팝니다')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=4";	
				
				});
			 
			 $( "a[href='#']:contains('수다방')" ).on("click" , function() {
					self.location="/community/getContentList?searchCondition=2&searchKeyword=5";	
				
				});
			 
			 $( "a[href='#']:contains('환불 게시판')" ).on("click" , function() {
					self.location="/community/getRefundList";	

				});
			 
// 			 $( "a[href='#section-topline-1']:contains('회원')" ).on("click" , function() {
// 					self.location="/community/getContentList?searchCondition=2&searchKeyword=8";	

// 				});
			 
// 			 $( "a[href='#section-topline-2']:contains('판매/구매')" ).on("click" , function() {
// 					self.location="/community/getContentList?searchCondition=2&searchKeyword=9";	

// 				});
			 
// 			 $( "a[href='#section-topline-3']:contains('취소/환불')" ).on("click" , function() {
// 					self.location="/community/getContentList?searchCondition=2&searchKeyword=10";	

// 				});
			 
// 			 $( "a[href='#section-topline-4']:contains('이벤트/혜택')" ).on("click" , function() {
// 					self.location="/community/getContentList?searchCondition=2&searchKeyword=11";	

// 				});
			 
			 // 상세 조회
			$( "td:nth-child(2)" ).on("click" , function() {
				self.location ="/community/getContent?contentNo="+$(this).children('#contentNo').text().trim();
			});

			$( "td:nth-child(2)" ).css("color" , "black");
			
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
				
				$(".good").on("click" , function() {
					
					var contentNo = $(this).attr("id").trim();
					var goodCount = $("span[name='"+contentNo+"']").text().trim();
					var result = parseInt(goodCount)+1;
					var content = $("span[name='"+contentNo+"']");
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
 			        		content.text(result);
 			        
			        }
			        
			    	});
				});
		 });
		 
 		  $(function() {
				
				$(".bad").on("click" , function() {
				
					var contentNo = $(this).attr("id").trim();
					var badCount = $('a').closest("#"+contentNo+"").text().trim();
					alert(badCount);
					var result1 = parseInt(badCount)+1;
					var content1 = $('a').closest("#"+contentNo+"");
					
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
			        		content1.text(result1);
			        	} 
			        } 
			        
			    	});
				});
		 });

	</script>
</head>
<body>
	
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<jsp:include page="/layout/tgetHeader.jsp" />

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="text-center">	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->	    	
		    	<c:if test="${sessionScope.user.role == '2'}">
		    	<button type="button" id="addContent" class="btn btn-danger" data-toggle="modal" data-target="#addContentModal">글 쓰기</button>
				</c:if>
				<p class="text-primary">
		    		전체  ${totalCount } 건수
		    	</p>	
	</div>
	
	 <div class="row">
	  <div class="col-md-2 text-center">	  
	      <div class="sticky-top">
		  <br/>
			 <div>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='0'}">
		       		<h5>Community > 공지사항</h5>
		       </c:if>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='1'}">
		       		<h5>Community > 공지사항</h5>
		       </c:if>
		       <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='2'}">
		       		<h5>Community > 공지사항</h5>
		       </c:if>   
		   	 </div>
		   	 
			<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='0'||search.searchCondition=='2'&&search.searchKeyword=='1'||search.searchCondition=='2'&&search.searchKeyword=='2'}">
				<ul class="list-group list-group-flush">
				<li class="list-group-item"><a href="#">티켓 거래 공지</a></li>
				<li class="list-group-item"><a href="#">자유게시판 이용공지</a></li>
				<li class="list-group-item"><a href="#">자주 묻는 질문</a></li>
				</ul>
			</c:if>
			</div>
		</div>		
      <!--  table Start /////////////////////////////////////-->
     <div class="col-md-10 text-center">	
	      <table class="table" >
			<thead>
			<section>
				<br/>
				<div class="tabs tabs-style-topline">
					<nav>
						<ul>
							<li><a href="#section-topline-1"><h6><strong>회원</strong></h6></a></li>
							<li><a href="#section-topline-2"><h6><strong>판매/구매</strong></h6></a></li>
							<li><a href="#section-topline-3"><h6><strong>취소/환불</strong></h6></a></li>
							<li><a href="#section-topline-4"><h6><strong>이벤트/혜택</strong></h6></a></li>
						</ul>
					</nav>
					<div class="content-wrap">
						<section id="section-topline-1">
						<c:forEach var="content" items="${list}">
							<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='8'}">
							<tr>	
							<td>${content.contentName}
							  <div id="contentNo" style="display:none;">${content.contentNo}</div></td>
							  <td>${content.userNickname}
							  <div id="userId" style="display:none;">${user.userId}</div></td>
							  <td>${content.regDate}</td> 
				   	  
						   	  <!-- 공감 -->
						   	  <td><a href="#" class="good" id="${content.contentNo}"><i class="fas fa-thumbs-up"></i></a>
						   	  <span name="${content.contentNo}">${content.goodCount}</span>
						   	  
						   	  <!-- 비공감 -->
						   	  <a href="#" class="bad" id="${content.contentNo}"><i class="fas fa-thumbs-down"></i></a>
						   	  <a id="${content.contentNo}">${content.badCount}</a> 
						   	  </td>		  	
						</tr>
			          <tr>
					</tr>
					</c:if>
			          </c:forEach>
						</section>
						
						<section id="section-topline-2">
						<c:forEach var="content" items="${list}">
							<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='9'}">
							<tr>	
							<td>${content.contentName}
							  <div id="contentNo" style="display:none;">${content.contentNo}</div></td>
							  <td>${content.userNickname}
							  <div id="userId" style="display:none;">${user.userId}</div></td>
							  <td>${content.regDate}</td> 
				   	  
						   	  <!-- 공감 -->
						   	  <td><a href="#" class="good" id="${content.contentNo}"><i class="fas fa-thumbs-up"></i></a>
						   	  <span name="${content.contentNo}">${content.goodCount}</span>
						   	  
						   	  <!-- 비공감 -->
						   	  <a href="#" class="bad" id="${content.contentNo}"><i class="fas fa-thumbs-down"></i></a>
						   	  <a id="${content.contentNo}">${content.badCount}</a> 
						   	  </td>		  	
						</tr>
			          <tr>
					</tr>
					</c:if>
			          </c:forEach>			
						</section>
						<section id="section-topline-3">
						<c:forEach var="content" items="${list}">
							<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='10'}">
							<tr>	
							<td>${content.contentName}
							  <div id="contentNo" style="display:none;">${content.contentNo}</div></td>
							  <td>${content.userNickname}
							  <div id="userId" style="display:none;">${user.userId}</div></td>
							  <td>${content.regDate}</td> 
				   	  
						   	  <!-- 공감 -->
						   	  <td><a href="#" class="good" id="${content.contentNo}"><i class="fas fa-thumbs-up"></i></a>
						   	  <span name="${content.contentNo}">${content.goodCount}</span>
						   	  
						   	  <!-- 비공감 -->
						   	  <a href="#" class="bad" id="${content.contentNo}"><i class="fas fa-thumbs-down"></i></a>
						   	  <a id="${content.contentNo}">${content.badCount}</a> 
						   	  </td>		  	
						</tr>
			          <tr>
					</tr>
					</c:if>
			          </c:forEach>	
						</section>
						<section id="section-topline-4">
						<c:forEach var="content" items="${list}">
							<c:if test="${search.searchCondition=='2'&&search.searchKeyword=='11'}">
							<tr>	
							<td>${content.contentName}
							  <div id="contentNo" style="display:none;">${content.contentNo}</div></td>
							  <td>${content.userNickname}
							  <div id="userId" style="display:none;">${user.userId}</div></td>
							  <td>${content.regDate}</td> 
				   	  
						   	  <!-- 공감 -->
						   	  <td><a href="#" class="good" id="${content.contentNo}"><i class="fas fa-thumbs-up"></i></a>
						   	  <span name="${content.contentNo}">${content.goodCount}</span>
						   	  
						   	  <!-- 비공감 -->
						   	  <a href="#" class="bad" id="${content.contentNo}"><i class="fas fa-thumbs-down"></i></a>
						   	  <a id="${content.contentNo}">${content.badCount}</a> 
						   	  </td>		  	
						</tr>
			          <tr>
					</tr>
					</c:if>
			          </c:forEach>	
						</section>
					</div><!-- /content -->
				</div><!-- /tabs -->
			</section>      
	          <tr>   	
	            <th>글 제목</th>
	            <th>작성자</th>
	            <th>작성일</th>				
	            <th>공감/비공감</th>	
	            <c:if test="${search.searchCondition=='2'&&search.searchKeyword=='3'||search.searchCondition=='2'&&search.searchKeyword=='4'||search.searchCondition=='2'&&search.searchKeyword=='5'}">
	            <th>신고</th>
	            </c:if>	
	          </tr>
	        </thead>
	       
			<tbody>
			
			  <c:forEach var="content" items="${list}">
				<tr>
				<td>${content.contentName}
				  <div id="contentNo" style="display:none;">${content.contentNo}</div></td>
				  <td>${content.userNickname}
				  <div id="userId" style="display:none;">${user.userId}</div></td>
				  <td>${content.regDate}</td> 
				   
			   	  <!-- 공감 -->
			   	  <td><a href="#" class="good" id="${content.contentNo}"><i class="fas fa-thumbs-up"></i></a>
			   	  <span name="${content.contentNo}">${content.goodCount}</span>
			   	  
			   	  <!-- 비공감 -->
			   	  <a href="#" class="bad" id="${content.contentNo}"><i class="fas fa-thumbs-down"></i></a>
			   	  <a id="${content.contentNo}">${content.badCount}</a> 
			   	  </td>		  	
			</tr>
          <tr>
		</tr>
          </c:forEach>
			
	        </tbody>
	      
	      </table>
      </div>
	  <!--  table End /////////////////////////////////////-->
	</div>  
 	<!--  화면구성 div End /////////////////////////////////////--> 
	<!-- 게시글 등록 Modal -->		  
		<form name='addContent'>
		<div class="modal modal-center fade" id="addContentModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel">
	  <div class="modal-dialog modal-lg modal-center" role="document">
	    <div class="modal-content modal-80size">

	      <div class="modal-body" id="addContentModalBody">
	      <select id="boardCode" name="boardCode">
	   			 	<option value="2">고객센터</option>
   			 	</select> 
   			 	
   			 <select id="contentCode" name="contentCode">
			   		<option value="8">회원</option>
			   		<option value="9">판매/구매</option>
			   		<option value="10">취소/환불</option>
			   		<option value="11">이벤트/혜택</option>  		
   			 	</select>
   			 	
   			 <select id="open" name="open">
				<option value="">공개 여부</option>
					<option value="0">공개</option>
					<option value="1">비공개</option>
			</select>	
			
			<div class="form-group">
		    <label for="userNickname" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userNickname" name="userNickname" value="${sessionScope.user.nickName}" readonly>
		      <input type="hidden" name="userId" value="${sessionScope.user.userId}">
		    </div>
		  </div>
 
		  <div class="form-group">
		    <label for="contentName" class="col-sm-offset-1 col-sm-3 control-label">글 제목</label>
		    
		      <input type="text" class="form-control" id="contentName" name="contentName">
		    
		  </div>
		
		  <label for="contentBody" class="col-sm-offset-1 col-sm-3 control-label">글 내용</label>
	
		<textarea class="form-control" id="contentBody" name="contentBody"></textarea>
		<script type="text/javascript">
		CKEDITOR.replace('contentBody'
				, {height: 200});
		</script>
		<br/>  		
	      </div>
      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-info" data-dismiss="modal">등록</button>
	        <button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>			  
	</form>
</body>
<jsp:include page="/layout/footer.jsp" />
</html>