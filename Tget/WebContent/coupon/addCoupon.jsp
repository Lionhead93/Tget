<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
$(function(){
	$("#getCouponUserList").on("click",function(){
		$("#listUserRow").html("");
		$.ajax({
			url:"/coupon/rest/getCouponUserList/",
			method : "GET" ,
            dataType : "json",
            headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json"
			},            
            success:function(data){
            	$.each(data.list, function( index, user){
            		var display = "";
            		
            		display += "<div class='col-3'>";
            		display +=  "<div class='text-center'><button id='"+user.userId+"' class='btn btn-outline-info addCoupon'>"+user.nickName+"</button></div><br/>";
            		display += "</div>";
            		
            		$("#listUserRow").append(display);
            	});
            	$(".addCoupon").on("click",function(){
            		var userId = $(this).attr("id").trim();
            		var content = $(this).closest(".col-3");
            		var conResult = confirm(userId+"님에게 쿠폰을 발급하시겠습니까?");
            		if(conResult){            			
            			$.ajax({
            				url:"/coupon/rest/addCoupon/"+userId+"/",
            				method : "GET" ,
            	            dataType : "json",
            	            headers : {
            					"Accept" : "application/json",
            					"Content-Type" : "application/json"
            				},            
            	            success:function(data){
            	            	alert("발급완료");
            	            	content.remove();
            	            }
            	    	});
            		}
            	});
            }
    	});
		
	});	
});

</script>

<!-- 쿠폰발급 모달창 -->
				<div class="modal fade" id="addCouponModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					    <div class="modal-wrap">
     					 <div class="modal-html">
					      <div id="addCouponModalBody" class="modal-body">
					      	<div class="text-center"><h3>쿠폰 발급<a href="#" class="close" data-dismiss="modal">&times;</a></h3></div>
					        <hr/>
					        <div id="listUserRow" class="row">
					        
					        </div>
					        
					      
					      </div>
					     
					      </div>
					     </div>
					    </div>
					  </div>
				 </div>
				 