<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
	
	$(function(){
				
		$("#addSellerSubmit").on("click",function(){	
			var userAccountBank = $("#accountBank option:selected").val();
			var userAccountNo = $("input[name='accountNo']").val();
			if(userAccountBank == null || userAccountBank.length<1){
				alert("은행을 선택해주세요.");
				return;
			}
			if(userAccountNo == null || userAccountNo.length<11 || isNaN(userAccountNo)==true){
				alert("계좌번호는 10자 이상 숫자만 입력하셔야 합니다.");
				return;
			}
	    	$.ajax(
					{
						url : "/ticket/rest/addSeller/" ,
						method : "POST" ,
						data : JSON.stringify({
							userId : "${user.userId}",
							accountBank : userAccountBank,
							accountNo : userAccountNo
						}) ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(data) {	
							alert("등록성공!");
							history.go(0);
						}							 
			});
			
		});
	});
	</script>


	<div class="modal fade" id="addSellerModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered" role="document">
					    <div class="modal-content">
					       <div class="modal-body">
					      		
									<div align="center"><h3 style="font-weight: bold;">
										판매자 정보 입력
									</h3></div>
									<form name="addSeller">	
									<input type="hidden" name="userId" id="userId" value="${user.userId}">
										 <div>
								    		ID&nbsp; : &nbsp;${user.userId}    			
								 		 </div>
								 		 <br/>
								 		 <div>
								 		 은행&nbsp; : &nbsp;&nbsp;&nbsp; 
								 		 	<select id="accountBank" name="accountBank" >
								 		 		<option value="">선택</option>
								 		 		<option value="039">경남은행 </option>
								 		 		<option value="004">국민은행 </option>
								 		 		<option value="034">광주은행 </option>
								 		 		<option value="003">기업은행 </option>
								 		 		<option value="031">대구은행 </option>
								 		 		<option value="045">새마을금고 </option>
								 		 		<option value="088">신한은행 </option>
								 		 		<option value="048">신협은행 </option>
								 		 		<option value="027">씨티은행 </option>
								 		 		<option value="020">우리은행 </option>
								 		 		<option value="071">우체국</option>
								 		 		<option value="005">외환은행 </option>
								 		 		<option value="081">하나은행 </option>
								 		 	</select>
										 </div>
										 <br/>
										 <div>
										 	계좌 번호&nbsp; : &nbsp;<input type="text" name="accountNo" value="" placeholder="(-) 제외 입력" style="width: 300px !important"> 
										 </div>
										 <br/>
										 <div class="text-danger">
										 <small>*해당 정보는 티켓 판매 후 판매대금 입금 시 활용하는 정보이며<br/>
										 		다른 목적으로는 사용되지 않습니다.
										  </small>
										 
										 </div>
										 <br/>
										<div align="center">
											<a class="btn btn-outline-light btn" href="#" role="button" id="addSellerSubmit">등록</a>
											<a class="btn btn-outline-light btn" href="#" role="button" id="addSellerCancle" data-dismiss="modal">취소</a>						
										</div>
									</form>
								</div>			      	      
					      </div>
					    </div>
	 </div>

