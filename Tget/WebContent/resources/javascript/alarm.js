	
function getAlarmModal() {	
	$(".modal-body").html("<ul class='list-group'>"+
					        "</ul>");
	$.ajax(
			{
				url : "/alarm/rest/getAlarmList/admin" ,
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
						    "<button id='"+alarm.alarmCode+"' type='button' class='btn btn-outline-primary'><i class='fas fa-check'></i></button>"+						    
						    "</li>";							   
							
						    $(".modal-body").append(displayValue);
							
						})	
						$(".modal-body button").on("click",function(){
							self.location = "/ticket/getTicketList?menu=seller";
						});
				}	
	});   
}

function getNoReadAlarmCount() {	
	$.ajax(
			{
				url : "/alarm/rest/getNoReadAlarm/admin" ,
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
