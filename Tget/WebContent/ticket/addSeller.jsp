<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
	
	$(function(){
				
		$("#addSellerSubmit").on("click",function(){	
			var userAccountBank = $("#accountBank option:selected").val();
			var userAccountNo = $("input[name='accountNo']").val();
			if(userAccountBank == null || userAccountBank.length<1){
				swal("은행을 선택해주세요.","","warning");
				return;
			}
			if(userAccountNo == null || userAccountNo.length<11 || isNaN(userAccountNo)==true){
				swal("계좌번호는 10자 이상 숫자만 입력하셔야 합니다.","","warning");
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
							swal("등록성공!","","success")
							.then(function(r){
								history.go(0);	
							});
							
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
									</h3></div><br/>
									<form name="addSeller">
									<input type="hidden" name="userId" id="userId" value="${user.userId}">
									<div class="form-group row">	
									  <div class="col-3 text-center">아이디 </div>		    
									    <div class="col-6">
									         <strong>${user.userId}</strong>    	
									    </div>	
									    <div class="col-3"></div>	    		    
									  </div>
									 <div class="form-group row">	
									  <div class="col-3 text-center" style="margin-top: 8px;">은행 </div>		    
									    <div class="col-6">
									         <select class="custom-select" id="accountBank" name="accountBank" >
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
									    <div class="col-3"></div>	    		    
									  </div> 	
									  <div class="form-group row">	
									  <div class="col-3 text-center" style="margin-top: 8px;">계좌 번호 </div>		    
									    <div class="col-6">
									         <input type="text" class="form-control" name="accountNo" value="" placeholder="(-) 제외 입력" maxlength="15">     	
									    </div>	
									    <div class="col-3"></div>	    		    
									  </div>
									  <div class="text-danger" style="padding-left: 10px;">
									  <small>*해당 정보는 티켓 판매 후 판매대금 입금 시 활용하는 정보이며<br/>
										 		다른 목적으로는 사용되지 않습니다.
										  </small>
									  </div>
										 <br/>
									<div align="center">
											<a class="btn btn-light btn" href="#" role="button" id="addSellerSubmit">등록</a>
											<a class="btn btn-light btn" href="#" role="button" id="addSellerCancle" data-dismiss="modal">취소</a>						
									</div>
									</form>
								</div>			      	      
					      </div>
					    </div>
	 </div>

