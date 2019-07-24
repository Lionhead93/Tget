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
	<link rel="stylesheet" href="/resources/css/toolbar.css" />
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<script src="/resources/javascript/common.js" ></script>
	<script src="/resources/javascript/alarm.js" ></script>
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<style>
	body {
            margin-top: 70px;
            
       }	
    </style>
    
 
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
           <c:if test="${sessionScope.user.userId !=null }">
           <input type="text" class="form-control" id="userNickname" name="userNickname" value="${sessionScope.user.nickName}" readonly>
		   <input type="hidden" name="userId" value="${sessionScope.user.userId}">
		    </c:if>
		    
<%-- 		    <div id="contentNo">${reply.contentNo}</div> --%>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 1100px" rows="3" cols="30" id="replyBody" name="replyBody" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <a href='#' onClick="fn_comment('${result.code}')" class="btn pull-right btn-success" >등&nbsp;록</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div><!-- onClick="fn_comment('${result.code }')"  -->
  
        <input type="hidden" id="contentNo" name="contentNo" value="${result.code}" />        
    </form>
</div>

<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>
 
 <script type="text/javascript">


			/*
			 * 댓글 등록하기(Ajax)
			 */
			function fn_comment(code){
			    alert("찍히나");
			    $.ajax({
			        type:'POST',
			        url : "/community/rest/addReply/",
			        data:$("#replyForm").serialize(),
			        success : function(data){
			            if(data=="success")
			            {
			                getCommentList();
			                $("#replyBody").val("");
			            }
			        },
			        error:function(request,status,error){
			            
			       }
			        
			    });
			}
			 
			/**
			 * 초기 페이지 로딩시 댓글 불러오기
			 */
			$(function(){
			    
			    getCommentList();
			    
			});
			 
			/**
			 * 댓글 불러오기(Ajax)
			 */
			function getCommentList(){
			    
			    $.ajax({
			        type:'GET',
			        url : "/community/rest/getReplyList/"+replyNo,
			        dataType : "json",
			        data : $("#replyForm").serialize(),
			        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			        success : function(data){
			            
			            var html = "";
			            var cCnt = data.length;
			            
			            if(data.length > 0){
			                
			                for(i=0; i<data.length; i++){
			                    html += "<div>";
			                    html += "<div><table class='table'><h6><strong>"+data[i].userId+"</strong></h6>";
			                    html += data[i].replyBody + "<tr><td></td></tr>";
			                    html += "</table></div>";
			                    html += "</div>";
			                }
			                
			            } else {
			                
			                html += "<div>";
			                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
			                html += "</table></div>";
			                html += "</div>";
			                
			            }
			            
			            $("#cCnt").html(cCnt);
			            $("#commentList").html(html);
			            
			        },
			        error:function(request,status,error){
			            
			       }
			        
			    });
			}
 
</script>
 
</body>
</html>
