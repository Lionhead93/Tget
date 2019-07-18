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
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<style>
		
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
	
	/*
	 * 댓글 등록하기
	*/
	$(function() {
		
		alert("제발 되라......");
		$("a[href='#']:contains('등&nbsp;록')").on("click" , function() {
			
			alert("제발제발제발");
			
			var reportBody = $(this).children('a[type="hidden"]').serialize();
	    
			$.ajax(
	    		{
	    
	        method:"POST",
	        url : "/community/json/addReply/"+replyNo,
	        data: JSON.stringify({
	        	userId: $("#userId").text().trim(),
	        	userNickName: $("#userNickName").text().trim(),
	        	contentNo: $("#contentNo").text().trim(),
	        	replyBody: $("#replyBody").val()
	        }),
	        dataType: "json",
	        header:{
	        	"Accept" : "application/json",
				"Content-Type" : "application/json"	
	        },
	        success : function(data, status){
	            
	        	if(data=="success")
	            {
	                getReplyList();
	                $("#reply").val("");
	            }
	        },
	        error:function(request,status,error){
	 
	       } 
	        
	    });
	});
	 
	/**
	 * 초기 페이지 로딩시 댓글 불러오기
	 */
/* 	$(function(){
	    
		getReplyList();
	    
	}); */
	 
	/**
	 * 댓글 불러오기(Ajax)
	 */
/* 	function getReplyList(){
	    
		var html = "";
	    var cCnt = data.length
		
	    $.ajax({
	        type:'GET',
	        url : "/community/json/getReplyList/"+replyNo,
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
	  */
	</script>

	
</head>

<body>
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		
		 <form id="replyForm" name="replyForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>댓글 등록</strong></span> <span id="cCnt"></span>
            </div>
           
		    <div id="userId">manager</div><!-- ${user.userId} -->
		    <div id="userNickName">관리자</div><!-- ${user.userNickName} -->
		    <div id="contentNo">${reply.contentNo}</div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 1100px" rows="3" cols="30" id="reply" name="reply" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <a href='#' class="btn pull-right btn-success" >등&nbsp;록</a>
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
