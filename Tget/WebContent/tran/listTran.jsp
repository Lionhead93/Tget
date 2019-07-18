<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="/resources/javascript/common.js" ></script>
   	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    	.img_wrap {
			width: 300px;
			margin: auto;
		}
		.img_wrap img {
			max-width: 100%;
		} 
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">	
	
	function fncAddDelivery(){
		//Form 유효성 검증
	 	var deliveryCompany = $("#deliveryCompany option:selected").val();
	 	var deliveryNo = $("input[name='deliveryNo']").val();
	 	/* 
		if(deliveryNo == null || deliveryNo.length<1){
			alert("운송장번호는 반드시 입력하여야 합니다.");
			return;
		}
		if(deliveryCompany == null || deliveryCompany.length<1){
			alert("배송사를 선택해주세요.");
			return;
		} */
		alert("등록 완료!");
		$("form").attr("method" , "POST").attr("action" , "/tran/addDelivery").submit();
	}	
	
	
	$(function(){
		
		var key = "CbHyQ5hk2Mf9jPrkBc5Gcg";
		var tranNo = "";
		
	    $("a.getEvent").on("click", function(){
	    	var eventId = $(this).closest("div").attr("id").trim();
	    	
	    	self.location = "/event/getEventTicketList?eventId="+eventId;	    	
	    });
	    
	    $("#addDelivery").on("click", function(){
	    	
	    	$("#tranNo").val(tranNo);
	    	var deliveryCompany = $("#deliveryCompany option:selected").val();
		 	var deliveryNo = $("input[name='deliveryNo']").val();
		 	var result = "0";
		 	
	    	$.ajax({
	            type:"GET",
	            dataType : "json",
	            url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+key+"&t_code="+deliveryCompany+"&t_invoice="+deliveryNo,
	            success:function(data){
	            	console.log(data);                
	                
                    if(data.status == false){
                    	alert(data.msg);
                    }else{
                    	fncAddDelivery();
                    }
	            }
	    	});
	    });
	    
	    $("a.getReview").on("click", function(){	    	
	    });
	    $("a.endDelivery").on("click", function(){	    	
	    });
	    $("a.searchDelivery").on("click", function(){
	    	tranNo = $(this).attr("id").trim();	    	
	    	
	    	var deliveryCompany = ""+$(this).children("#tranDeliveryCompany").text().trim()+"";
	    	var deliveryNo = ""+$(this).children("#tranDeliveryNo").text().trim()+"";
	    		    	
	    	$.ajax({
	            type:"GET",
	            dataType : "json",
	            url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+key+"&t_code="+deliveryCompany+"&t_invoice="+deliveryNo,
	            success:function(data){
	            	console.log(data);   
	                var myInvoiceData = "";
	                
                    if(data.status == false){
                        myInvoiceData += ('<p class="text-danger">'+data.msg+'<p>');
                    }else{
                    	myInvoiceData += ('<table class="table">');      
                        myInvoiceData += ('<tr>');                
                        myInvoiceData += ('<th>'+"송장번호"+'</td>');                     
                        myInvoiceData += ('<th>'+data.invoiceNo+'</td>');                     
                        myInvoiceData += ('</tr>');     
                        myInvoiceData += ('</table>');
                    }                
                    
                    $("#searchResult").html(myInvoiceData)
                    
                    var trackingDetails = data.trackingDetails;
                    
                    
                    var myTracking="";
                    var header ="";
                    header += ('<table class="table">');
                    header += ('<thead>');  
                    header += ('<tr>');                
                    header += ('<th>'+"시간"+'</th>');
                    header += ('<th>'+"장소"+'</th>');
                    header += ('<th>'+"유형"+'</th>');
                    header += ('<th>'+"전화번호"+'</th>');                     
                    header += ('</tr>');     
                    header += ('</thead>'); 
                    header += ('<tbody>');
                    $.each(trackingDetails,function(key,value) {
                        myTracking += ('<tr>');                
                        myTracking += ('<td>'+value.timeString+'</td>');
                        myTracking += ('<td>'+value.where+'</td>');
                        myTracking += ('<td>'+value.kind+'</td>');
                        myTracking += ('<td>'+value.telno+'</td>');                     
                        myTracking += ('</tr>');                                    
                    });
                    myTracking += ('</tbody>');
                    myTracking += ('</table>');
                    $("#searchTracking").html(header+myTracking);
	            }
	        });
	    	
	    });
	    $("a.startDelivery").on("click", function(){
	    	tranNo = $(this).closest("div").attr("id").trim();
	    });
	    $("#file").change(function(){
	    	readURL(this);
	    	var form = $("form")[0];
	    	var formData = new FormData(form);
	    	$.ajax(
					{
						url : "/tran/rest/getDeliveryInfo/" ,
						processData: false,
	                    contentType: false,
						method : "POST" ,						
						data : formData ,
						beforeSend : function(){
				            $('#loading').html("<div class='spinner-border text-primary' role='status'>"+
				            "<span class='sr-only'>Loading...</span>"+
				            "</div>");
				        },
						success : function(data) {	
							$('#loading').html("");
							var deliveryCompany = $.trim(data.deliveryCompany);
							
							if(deliveryCompany=="CJ")
								$("#deliveryCompany").val("04").prop("selected", true);							
							if(deliveryCompany=="우체국")
								$("#deliveryCompany").val("01").prop("selected", true);							
							if(deliveryCompany=="KGB")
								$("#deliveryCompany").val("56").prop("selected", true);							
							if(deliveryCompany=="한진")
								$("#deliveryCompany").val("05").prop("selected", true);							
							if(deliveryCompany=="로젠")
								$("#deliveryCompany").val("06").prop("selected", true);							
							if(deliveryCompany=="롯데")
								$("#deliveryCompany").val("08").prop("selected", true);							
							if(deliveryCompany=="CU")
								$("#deliveryCompany").val("46").prop("selected", true);							
							if(deliveryCompany=="경동")
								$("#deliveryCompany").val("23").prop("selected", true);							
							if(deliveryCompany=="농협")
								$("#deliveryCompany").val("53").prop("selected", true);							
							
							$('#deliveryNo').val(data.deilveryNo);
						}							 
			});
	    });
	   
	});
		
	</script>		
    
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
	<br/>
		
		<div class="text-center">
		 <table class="table">
			  <thead>
			    <tr class="table-info">
			      <th scope="col">#</th>
			      <th scope="col">종류</th>
			      <th scope="col">이벤트명</th>
			      <th scope="col">수량</th>
			      <th scope="col">구매/판매일자</th>
			      <th scope="col">거래상대</th>
			      <th scope="col">진행상태</th>
			      <th scope="col">-</th>
			    </tr>
			  </thead>
			  <tbody>
			  <c:forEach var="tran" items="${list}" varStatus="j">
			    <tr>
			      <th scope="row">${j.index+1}</th>
			      <td>
			      <c:if test="${user.userId==tran.seller.userId}">판매</c:if>
			      <c:if test="${user.userId==tran.buyer.userId}">구매</c:if>
			      </td>
			      <td>
			      <div id="${tran.event.eventId}">
			      <a class="getEvent" href="#">${tran.event.eventName}</a>
			      </div>
			      </td>
			      <td>${tran.orderAmount}</td>
			      <td>${tran.orderDate}</td>
			      <td>			      
			      <c:if test="${user.userId==tran.seller.userId}">${tran.buyer.userId}</c:if>
			      <c:if test="${user.userId==tran.buyer.userId}">${tran.seller.userId}</c:if>
			      </td>
			      <td class="text-secondary">
			      <c:if test="${tran.tranCode==0}">무통장 입금대기</c:if>
			      <c:if test="${tran.tranCode==1}">결제완료</c:if>
			      <c:if test="${tran.tranCode==2}">배송 중 
			      <a class="searchDelivery" id="${tran.tranNo}" href="#" data-toggle="modal" data-target="#searchDeliveryModal">
			      <i class="fas fa-truck"></i>
			      <div id="tranDeliveryNo" style="display: none;">${tran.deliveryNo}</div>
			      <div id="tranDeliveryCompany" style="display: none;">${tran.deliveryCompany}</div></a>
			      </c:if>
			      <c:if test="${tran.tranCode==3}">배송 완료</c:if>
			      <c:if test="${tran.tranCode==4}">환불 및 취소</c:if>
				  </td>
			      <td>
			      <div id="${tran.tranNo}">
			      <c:if test="${user.userId==tran.seller.userId}">
				      <c:if test="${tran.tranCode==0}">-</c:if>
				      <c:if test="${tran.tranCode==1}"><a class="startDelivery" href="#" data-toggle="modal" data-target="#deliveryModal">배송시작</a></c:if>
				      <c:if test="${tran.tranCode==2}">-</c:if>
				      <c:if test="${tran.tranCode==3}"><a class="getReview" href="#">후기 확인</a></c:if>
				      <c:if test="${tran.tranCode==4}">-</c:if>
			      </c:if>
			      <c:if test="${user.userId==tran.buyer.userId}">
				      <c:if test="${tran.tranCode==0}">-</c:if>
				      <c:if test="${tran.tranCode==1}">-</c:if>
				      <c:if test="${tran.tranCode==2}"><a class="endDelivery" href="#">배송도착</a></c:if>
				      <c:if test="${tran.tranCode==3}">-</c:if>
				      <c:if test="${tran.tranCode==4}">-</c:if>
			      </c:if>
			      </div>
			      </td>
			    </tr>
			  </c:forEach> 
			  </tbody>
		</table>
		 
		</div>
			
 	</div>
	
	<!-- 배송정보입력 모달창  -->
					<div class="modal fade" id="deliveryModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-md" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="modalCenterTitle">배송정보를 등록해주세요.</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					      <form enctype="multipart/form-data"> 
					      	<input type="hidden" id="tranNo" name="tranNo" value=""/>
					      	<div class="form-group" >
							     <br/>
							     <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;배송 사 : </strong> 	
							        <select id="deliveryCompany" name="deliveryCompany">
									    <option value="">선택</option>
									    <option value="04">CJ대한통운</option>									    
									    <option value="01">우체국택배</option>
									    <option value="56">KGB택배</option>
									    <option value="05">한진택배</option>
									    <option value="06">로젠택배</option>
									    <option value="08">롯데택배</option>
									    <option value="46">CU편의점택배</option>
									    <option value="23">경동택배</option>
									    <option value="53">농협택배</option>
									</select><br/><br/>
							      <strong>운송장 번호 : </strong><input type="text" id="deliveryNo" name="deliveryNo" value="" placeholder="(-) 제외 입력" style="width: 300px !important"/>
							      <br/><br/>
							      <div class="text-center" id="loading"></div>
							      <br/><br/>
								  <div class="img_wrap">
									<img id="preview" />	
							      </div>
							      <strong>이미지로 등록</strong>
							      
							      <input type="file" class="form-control" id="file" name="file" value="" placeholder="file input...">
							</div>
					      </form>			      
					      </div>
					      <div class="modal-footer">
					        <button type="button" id="addDelivery" class="btn btn-primary">등록</button>
					      </div>
					    </div>
					  </div>
					</div>
	<!-- 배송 조회 모달 -->
					<div class="modal fade" id="searchDeliveryModal" tabindex="-1" role="dialog" aria-labelledby="modalCenterTitle" aria-hidden="true">
					  <div class="modal-dialog modal-lg" role="document">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="modalCenterTitle">배송조회 결과입니다.</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					      	<div id="searchResult">
					      	</div>
					      	<div id="searchTracking">
					      	</div>					      	      
					      </div>
					    </div>
					  </div>
					</div>
	
</body>

</html>