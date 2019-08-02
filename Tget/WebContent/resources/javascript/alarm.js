	
function getAlarmModal(userId) {	
	$("#alarmModalBody").html("<ul class='list-group'>"+
					        "</ul>");
	$.ajax(
			{
				url : "/alarm/rest/getAlarmList/"+userId+"/" ,
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
							
							displayValue = "<li class='list-group-item d-flex justify-content-between align-items-center'>";
							displayValue +=	"<h6><span class='text-dark'><i class='fab fa-twitter'></i>";
							if(alarm.alarmCode==9){
								displayValue +=	alarm.alarmKeyword
							}
							displayValue += "&nbsp;"+alarm.alarmBody+"</span></h6>";						    
							displayValue += "<div id='"+alarm.alarmNo+"'><p id='"+alarm.alarmKeyword+"'><a href='#' name='check' id='"+alarm.alarmCode+"' class='btn btn-outline-primary'>";
							displayValue +=	"<i class='fas fa-check'></i></a>";
							displayValue += "<a name='delete' href='#' class='btn btn-outline-danger'>";
							displayValue +=	"<i class='fas fa-trash-alt'></i></a></p></div></li>";	
							
						    $("#alarmModalBody").append(displayValue);
							
						});	
						$("a[name='check']").on("click",function(){
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
												self.location="/event/getEventTicketList?eventIds="+alarmKeyword;							
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
												window.open("/tran/goChat?userId="+userId+"&opponentId="+alarmKeyword+"&re=res", "T-GET Ã¤ÆÃ" ,"width = 500, height = 500, top = 100, left = 200, location = no");
												$("#"+alarmNo+"").closest("li").remove();
												getNoReadAlarmCount(userId);
										}
							})
							
													
						});
						$("a[name='delete']").on("click",function(){
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
				url : "/alarm/rest/getNoReadAlarm/"+userId+"/" ,
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(data) {
					if(data.NoReadAlarmCount != "0"){					
						$("#noReadAlarmCount").html(data.NoReadAlarmCount);
					}
				}					
	});
}
