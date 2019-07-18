	
function getAlarmModal(userId) {	
	$(".modal-body").html("<ul class='list-group'>"+
					        "</ul>");
	$.ajax(
			{
				url : "/alarm/rest/getAlarmList/"+userId ,
				method : "GET" ,
				dataType : "json" ,
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
						    "<button id='"+alarm.alarmCode+"' type='button' class='btn btn-outline-primary'>" +
						    		"<i class='fas fa-check'></i></button>"+
						    "<a href='#' id='"+alarm.alarmNo+"' class='btn btn-outline-danger'>" +
						    		"<i class='fas fa-trash-alt'></i></a>"+		
						    "</li>";							   
							
						    $(".modal-body").append(displayValue);
							
						})	
						$(".modal-body button").on("click",function(){
							var alarmCode = $(this).attr("id").trim();
							if(alarmCode==0)
								self.location="/tran/getTranList?menu=user";
							if(alarmCode==1)
								self.location="/event/getEventTicketList?eventId="+alarm.alarmKeyword;							
							if(alarmCode==2)
								self.location="/tran/getTranList?menu=user";							
							if(alarmCode==3)
								self.location="/tran/getTranList?menu=user";
							if(alarmCode==4)
								self.location="/";
							if(alarmCode==5)
								self.location="/";
							if(alarmCode==6)
								self.location="/";
							if(alarmCode==7)
								self.location="/";
							if(alarmCode==8)
								self.location="/";							
						});	
						$(".modal-body a").on("click",function(){
							var alarmNo = $(this).attr("id").trim();
							alert("11");
							ajax({
								url : "/alarm/rest/deleteAlarm/"+alarmNo ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(data){
									
									alert(data);
								}
							});						
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
