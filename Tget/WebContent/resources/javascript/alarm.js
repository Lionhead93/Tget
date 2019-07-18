	
function getAlarmModal(userId) {	
	$(".modal-body").html("<ul class='list-group'>"+
					        "</ul>");
	$.ajax(
			{
				url : "/alarm/rest/getAlarmList/"+userId ,
				method : "GET" ,
				dataType : "json" ,
				async: false,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(data) {
						var displayValue = "";					
						$.each(data.list,function(index, alarm){
							
							displayValue = "<li class='list-group-item d-flex justify-content-between align-items-center'>" +
									"<small><i class='fab fa-twitter'></i>&nbsp;"+
						    alarm.alarmBody+
						    "</small>"+
						    "<div id='"+alarm.alarmNo+"'><p id='"+alarm.alarmKeyword+"'><button id='"+alarm.alarmCode+"' type='button' class='btn btn-outline-primary'>" +
						    		"<i class='fas fa-check'></i></button>"+
						    "<a href='#' class='btn btn-outline-danger'>" +
						    		"<i class='fas fa-trash-alt'></i></a>"+		
						    "</p></div></li>";							   
							
						    $(".modal-body").append(displayValue);
							
						});	
						$(".modal-body button").on("click",function(){
							var alarmCode = $(this).attr("id").trim();
							var alarmNo = $(this).closest("div").attr("id").trim();
							var alarmKeyword = $(this).closest("p").attr("id").trim();
							
							$.ajax(
									{
										url : "/alarm/rest/deleteAlarm/"+alarmNo ,
										method : "GET" ,
										dataType : "json" ,
										async: false,
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										success : function(){
											if(alarmCode==0)
												self.location="/tran/getTranList?menu=user";
											if(alarmCode==1)
												self.location="/event/getEventTicketList?eventId="+alarmKeyword;							
											if(alarmCode==2)
												self.location="/tran/getTranList?menu=user";							
											if(alarmCode==3)
												self.location="/tran/getTranList?menu=user";
											if(alarmCode==4)
												self.location="/user/getUser?userId="+userId;
											if(alarmCode==5)
												self.location="/community/getReportList";
											if(alarmCode==6)
												self.location="/";
											if(alarmCode==7)
												self.location="/";
											if(alarmCode==8)
												self.location="/";
											if(alarmCode==9)
												self.location="/";
										}
							})
							
													
						});
						$(".modal-body a").on("click",function(){
							var alarmNo = $(this).closest("div").attr("id").trim();
							$.ajax(
									{
										url : "/alarm/rest/deleteAlarm/"+alarmNo ,
										method : "GET" ,
										dataType : "json" ,
										async: false,
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										success : function(){
											$("#"+alarmNo+"").closest("li").remove();
											getNoReadAlarmCount(userId);
										}
							})					
						});
				}	
	});
	
}

function getNoReadAlarmCount(userId) {	
	$.ajax(
			{
				url : "/alarm/rest/getNoReadAlarm/"+userId ,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(data) {
					$("#noReadAlarmCount").html(data.NoReadAlarmCount);
				}					
	});
}
