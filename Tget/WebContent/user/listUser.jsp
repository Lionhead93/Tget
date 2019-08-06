 <%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>


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
		<style>
		
body {
			  background-color: #EBF7FF;
			  font-family: 'Nanum Gothic', sans-serif;
		}

			a{
			color: #041625;
		}

		hr{
			border: 1px groove white;
		}
		.list-group-item{
			  margin-left:50px;	
			  color: #FBFCFE ;
			  border: 1px groove white;		  
			  background-color: #062038;
		}
	
	
		.col-md-2{
			padding-left: 50px;
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
			margin-left: 100px;
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
				</head>
			<body>
			
<script type="text/javascript">

	window.onload = function(){
		
		if(${user.role==0}){
			
			document.getElementById("cc").style.display = "none" ;
			document.getElementById("cc2").style.display = "none" ;
			
		}
	}




$(function() {
	
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button:contains('회원정보 수정')").on("click" , function() {

		var popOption = "left=500, top=100, width=800, height=600, resizable=no, location=no;"		
		window.open("/user/updateUser.jsp","회원정보 수정",popOption);
				
	});
});	


function fncUpdateUser() {
	var name=$("input[name='userName']").val();
	
	if(name == null || name.length <1){
		alert("이름은  반드시 입력하셔야 합니다.");
		return;
	}
		
	$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
}


$(function() {
	
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("button:contains('판매내역 조회')").on("click" , function() {

				
		window.open("/ticket/getTicketList?menu=seller");
				
	});
});	









				</script>
			
	<jsp:include page="/layout/tgetToolbar.jsp" />
	<jsp:include page="/layout/tgetHeader.jsp" />
	
			
	<!-- <div class="text-right" style="margin-right: 130px; margin-top: 30px;">	  
	
	</div> -->
		   <!--  table Start /////////////////////////////////////-->
			 <div class="col-md-10 text-center" >	
			<section>
				<br/>
				<div class="tabs tabs-style-topline">
			
					<nav>
						<ul>
							<li><a href="#section-topline-1"><h6><strong style="color:black;">회원목록 보기</strong></h6></a></li>
							<li><a href="#section-topline-2"><h6><strong style="color:black;">블랙리스트 보기</strong></h6></a></li>
						</ul>
					</nav>
				
			<div class="content-wrap">
				<section id="section-topline-1">
						<div class= "text-center">
						         <div class="card text-center shadow rounded" >
	
	    
	    <div class="row">
	    
		
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				
	    
	    	
		</div>
		
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
         
            <th align="left" >회원 ID</th>
            <th align="left">이름</th>
            <th align="left">　닉네임</th>
            <th align="left">휴대전화</th>
            <th align="left">주소</th>
            
            
          </tr>
        </thead>
       
		<tbody>
		
		
		  <c:forEach var="user" items="${list}">
		
			<tr>
			
			  <td align="left">
			  
			  <c:choose>
			  
			  <c:when test="${user.blacklistCode ne null }">
			  
			   <span style="color: red;">
${user.userId}
</span>
			  
			  </c:when>
	
			<c:otherwise>
			
			 ${user.userId}
			
		</c:otherwise>
		</c:choose>
		
			  </td>
			  <td align="left">${user.userName}</td>
			  <td align="left">${user.nickName}</td>
			  <td align="left">${user.phone}</td>
			  <td align="left">${user.address}
			  	<input type="hidden" value="${user.userId}">
			
			  </td>
			
			  	
			</tr>
          </c:forEach>
        </tbody>
      
      </table>
	  
 	</div>
						</div>		
										
						</section>
				
				
				<section id="section-topline-2">
					<div class= "text-center">
						          <div class="card text-center shadow rounded" >
	
	    
	    <div class="row">
	    
		
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				
	    
	    	
		</div>
		
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
         	
            <th align="left" >회원 ID</th>
            <th align="left">블랙리스트 누적 횟수</th>
           
            <th align="left">블랙리스트시작일</th>
            <th align="left">블랙리스트종료일</th>
            
            
          </tr>
        </thead>
       
		<tbody>
		
		
		  <c:forEach var="user" items="${list}">
		
			<c:if test="${user.blacklistCode ne null }">
				<tr>
			  <td align="left"  title="Click : 회원정보 확인">   <span style="color: red;">${user.userId}</span></td>
			 <td align="left">${user.blacklistCode}</td>
			
			  <td align="left">${user.blacklistStartDate.toLocaleString()}</td>
			  <td align="left">${user.blacklistEndDate.toLocaleString()}
			  	<input type="hidden" value="${user.userId}">
			
			  </td>
			
			  	
			</tr>
			</c:if>
          </c:forEach>
        </tbody>
      
      </table>
	  
 	</div>
						</div>		
				</section>
						
						
								
								
								
								
								
								
								</div><!-- /content -->
								</div><!-- /tabs -->
								
								 		</section>
				
				</div>	
				
 
<script src="/resources/javascript/cbpFWTabs.js"></script>
<script type="text/javascript"> src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
			(function() {

				[].slice.call( document.querySelectorAll( '.tabs' ) ).forEach( function( el ) {
					new CBPFWTabs( el );
				});

			})();
</script>	
	 
<jsp:include page="/layout/footer.jsp" />
</body>


</html> 