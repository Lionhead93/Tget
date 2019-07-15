	
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
						    "<button type='button' class='btn btn-outline-primary'><i class='fas fa-check'></i></button>"+
						    
						    "</li>";
							
							/*<li class="list-group-item d-flex justify-content-between align-items-center">
						    Cras justo odio
						    <span class="badge badge-primary badge-pill">14</span>
						  </li>*/
						    	
						    $(".modal-body").append(displayValue);
							
						})	
				}	
	});   
}
