<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript">
	
	$(function(){
				
		$("#addSellerSubmit").on("click",function(){	
			var accountBank = $("#accountBank option:selected").val();
			var accountNo = $("input[name='accountNo']").val();
			if(accountBank == null || accountBank.length<1){
				alert("은행을 선택해주세요.");
				return;
			}
			if(accountNo == null || accountNo.length<1){
				alert("계좌번호는 반드시 입력하셔야 합니다.");
				return;
			}
			var form = $("form[name='addSeller']")[0];
	    	var formData = new FormData(form);
			$.ajax(
					{
						url : "/ticket/rest/addSeller/" ,
						processData: false,
	                    contentType: false,
						method : "POST" ,						
						data : formData ,
						success : function(data) {	
							alert(data);
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
										판매자 정보 등록
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
											<button class="button_black"  id="addSellerSubmit">등록</button>
											<button class="button_black" data-dismiss="modal"  id="cancel">취소</button>											
										</div>
									</form>
								</div>			      	      
					      </div>
					    </div>
	 </div>

