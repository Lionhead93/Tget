<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="UTF-8"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">	
	<link href="https://fonts.googleapis.com/css?family=Cute+Font|Gurajada|Jua|Nanum+Brush+Script|Nanum+Pen+Script|Shadows+Into+Light|Sunflower:300&display=swap&subset=korean" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Acme|Bungee+Shade|Fredericka+the+Great&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	

<script>
$(function(){
	var countDownDate = new Date("2019-07-22 11:49").getTime();
	var x = setInterval(function() {
	
	    var now = new Date().getTime();
	    var distance = countDownDate - now;
	    
	    if (distance >= 60*60*48*1000 ) {
			$("div").attr("style","visibility:hidden;");
		}
	    else if( distance <=0) {
			clearInterval(x);
			$("div").attr("style","visibility:hidden;");
		    $("#expire").text("");
		} 
	    else {
			$("div").attr("style","visibility:visible;");
		}
	    var days = Math.floor(distance / (1000 * 60 * 60 * 24)); 
 
	    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))+days*24; 
	    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	    var seconds = Math.floor((distance % (1000 * 60)) / 1000);

	    $("#hour").text(hours) ;
	    $("#minute").text(minutes) ;
	    $("#second").text(seconds);

	}, 1000);
	
	});
	
</script>

<style>

ul {overflow:hidden;} 
li { 
	margin: 5px 5px 5px 5px;
	 float:left; 
	list-style:none;
	text-align:center; margin-top:20px;  
	font-size:20px;
} 
li:first-child { margin-left:20px;  } 
#hour {}
#minute {}
#second {}
</style>
</head>
<body>
<h2>Today Only</h2>

	<div>
		<ul>
			<li id="hour"></li>
			<li class="colon">:</li>
			<li id="minute"></li>
			<li class="colon">:</li>
			<li id="second"></li>
		</ul>
		
	</div>
<p id="expire"></p>
</body>
</html>
