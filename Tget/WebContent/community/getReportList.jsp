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
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form[name='detailForm']").attr("method" , "POST").attr("action" , "/community/getReportList").submit();
		}
		
		
		//============= "검색"  Event  처리 =============	
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 //$( "button.btn.btn-default" ).on("click" , function() {
			//	fncGetUserList(1);
			//});
		 });
		
		
	
		 $(function() {
			
			
				
/* 			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "td:nth-child(3)" ).on("click" , function() {
// 				alert($(this).children('input[type="hidden"]').val());
				self.location ="/community/getContent?contentNo="+$(this).children('input[type="hidden"]').val();
			});
			 */
						
			 $( "button.btn.btn-primary:contains('검증 확인')" ).on("click" , function() {
					 $("form[name='reportCheck']").attr("method" , "POST").attr("action" , "/community/addBlack").submit();	
				});
			 
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
			 
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("#contentModalButton").on("click" , function() {
						
						var contentNo = $(this).children('input[type="hidden"]').val();
						var reportNo = $(this).children('div').text().trim();
						$('input[name="reportNo"]').val(reportNo);
						$.ajax( 
								{
									url : "/community/json/getContent/"+contentNo ,
									method : "GET" ,
									dataType : "json" ,
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {

										var displayValue ="게시글 제목 : "+JSONData.content.contentName+"<br/>"
														+"게시글 내용 : "+JSONData.content.contentBody+"<br/>";
										
										$(".modal-body").html(displayValue);
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
	       <h3>신고 리스트</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${Page.totalCount } 건수, 현재 ${Page.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>신고글 명</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
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
            <th align="left" >신고자</th>
            <th align="left">신고 사유</th>
            <th align="left">신고 일자</th>
            <th align="left">검증 여부</th>
            
			
			
			
          </tr>
        </thead>
       
		<tbody>
		<form name="reportCheck">
			<input type="hidden" name="reportNo" value=""/>
		</form>
		  <c:set var="i" value="0" />
		  <c:forEach var="report" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left">${report.whiteId }</td>
			  <td align="left">			  	
			  <c:if test="${report.reportReasonCode==0}">
			     부적절한 홍보 게시물
			  </c:if>
			  <c:if test="${report.reportReasonCode==1}">
			     음란성 또는 청소년에게 부적합한 내용
			  </c:if>
			  <c:if test="${report.reportReasonCode==2}">
			     특정인 대상의 비방/욕설
			  </c:if>
			  <c:if test="${report.reportReasonCode==3}">
			     명예훼손/사생활 침해 및 저작권침해 등
			  </c:if></td>
			  <td align="left">${report.regDate}</td>
			  
			  <td align="left">
			  <button type="button" id="contentModalButton" class="btn btn-info"  data-toggle="modal" data-target="#contentModal">
			  <input type="hidden" value="${report.contentNo}"/>
			  <div style="display: none;">${report.reportNo}</div>
			  상세보기 </button>
			  </td>
			  <td align="left">
			  
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
	<!-- PageNavigation End... -->
	<div class="modal fade" id="contentModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-md" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="modalCenterTitle">게시글 내용</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-primary">검증 확인</button>
					      </div>
					    </div>
					  </div>
	</div>
</body>

</html>