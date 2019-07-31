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
	
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/css/toolbar.css" />
	
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
   
	<style>
	body{	
		      color: #FBFCFE ;		  
			  background-color: #062038;
			  margin-top: 50px;				
			  font-family: 'Nanum Gothic', sans-serif;
		}
		a{
			color: #FBFCFE ;	
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
			margin-left: 100px;
		}
		#inputGroupSelect01, nav{
			background: rgba(4, 22, 37, 0.75);
			color: #c0c5c9;
		} 
		
       #footer{
			background-color: #1B1B1F;
		}
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
	
	// 댓글 등록하기
	$(function() {
		
		$("button.btn.pull-right.btn-success:contains('등&nbsp;록')").on("click" , function() {
			
			alert("181818181818181818");
			
			var reportBody = $(this).children('a[type="hidden"]').serialize();
	    
			$.ajax(
	    		{
	    
	        method:"POST",
	        url : "/community/rest/addReply/",
	        data: JSON.stringify({
	        	
	        	userId : $("#userId").text().trim(),
	        	nickName : $("#userNickname").text().trim(),
	        	contentNo : $("#contentNo").text().trim(),
	        	replyBody : $("#replyBody").val()
	        
	        }),
	        //dataType: "json",
	        header:{
	        	"Accept" : "application/json",
				"Content-Type" : "application/json"	
	        },
	        success : function(data, status){
	            
	        	if(data=="success")
	            {
	                
	                $("#reply").val("");
	                getReplyList();
	            }
	        },
	        error:function(request,status,error){
	 
	       } 
	        
	    });
	});

	 //초기 페이지 로딩시 댓글 불러오기
	 
  	$(function(){
	    
 	getReplyList();
	    
 	}); 
	 
	// 댓글 불러오기(Ajax)
	
	function getReplyList(){
	    
		var html = "";
	    var cCnt = data.length
		
	    $.ajax({
	        type:'GET',
	        url : "/community/rest/getReplyList/"+replyNo,
	        dataType : "json",
	        data: $("#replyForm").serialize(),
	        headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			}, 
			success : function(JSONData , status) {
	            
	            ;
	            
	            var displayValue =+JSONData.reply.replyBody+"<br/>";
								
	            $("#cCnt").html(cCnt);
	            $("#commentList").html(html);
	            
	        },
	        error:function(request,status,error){
	            
	       }
	        
	    });
	});
	 
	</script>

	
</head>

<body>
<jsp:include page="/layout/tgetToolbar.jsp" />
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		 <form id="replyForm" name="replyForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>댓글 등록</strong></span> <span id="cCnt"></span>
            </div>
           <c:if test="${sessionScope.user.userId !=null }">
           <input type="text" class="form-control" id="userNickname" name="userNickname" value="${sessionScope.user.nickName}" readonly>
		   <input type="hidden" name="userId" value="${sessionScope.user.userId}">
		    </c:if>
		    
<%-- 		    <div id="contentNo">${reply.contentNo}</div> --%>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 1100px" rows="3" cols="30" id="reply" name="reply" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <button class="btn pull-right btn-success" >등&nbsp;록</button>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div><!-- onClick="fn_comment('${result.code }')"  -->
  
        <input type="hidden" id="replyBody" name=replyBody value="${reply.replyBody}" />        
    </form>
</div>

<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>
 

 
</body>

</html>
