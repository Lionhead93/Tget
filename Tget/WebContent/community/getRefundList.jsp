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
			$("form").attr("method" , "POST").attr("action" , "/community/getRefundList").submit();
		}
		
		 $(function() {
			 
		 });
		
		 $(function() {
					
			 $( "button.btn.btn-primary:contains('확인')" ).on("click" , function() {
				 alert("확인");
				 $("form[name='refundCheck']").attr("method" , "POST").attr("action" , "/community/updateRefund").submit();	
			});
			 
			 $( "button.btn.btn-info:contains('검증')" ).on("click" , function() {
			 	 alert("검증");
				 var contentNo = $(this).children("div").text().trim();
			 	 alert(contentNo);
			 	 $("input[name='contentNo']").val(contentNo);
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
						backgroundColor: "",
						fontWeight:""
				};
				$(this).css(style);
			});
	
	});	
	</script>
	
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>환불 게시판</h3>
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
				  
				  </div> 
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
            <th align="left" >글 제목</th>
            <th align="left">작성자</th>
            <th align="left">작성일</th>
            <th align="left">검증 여부</th>	
          </tr>
        </thead>
       
		<tbody>
		
		<form name="refundCheck">
			<input type="hidden" name="contentNo" value=""/>
		</form>
		  <c:set var="i" value="0" />
		  <c:forEach var="content" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center">${ i }</td>
			  <td align="left">${content.contentName}</td>
			  <td align="left">${content.userId}</td>
			  <td align="left">${content.regDate}</td>
			  <td align="left">
			  
			  <button type="button" id="contentModalButton" class="btn btn-info"  data-toggle="modal" data-target="#contentModal">
				<div style="display: none;">${content.contentNo}</div>검증</button>
			  
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
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">환불 처리 하시겠습니까?</div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-primary">확인</button>
					        
					      </div>
					    </div>
					  </div> 
	</div>
</body>

</html>