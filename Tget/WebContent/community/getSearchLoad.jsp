<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    	<meta name="description" content="Tab Styles Inspiration: A small collection of styles for tabs" />
		<meta name="keywords" content="tabs, inspiration, web design, css, modern, effects, svg" />
		<meta name="author" content="Codrops" />
    	<title>T-GET</title>

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link rel="stylesheet" href="/resources/css/toolbar.css" />
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="/resources/css/tabs.css" />
		<link rel="stylesheet" type="text/css" href="/resources/css/tabstyles.css" />
		<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
		
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
		<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
				
		<script src="/resources/javascript/common.js" ></script>
		<script src="/resources/javascript/alarm.js" ></script>
		<script src="/resources/javascript/jquery.min.js"></script>
		<script src="/resources/javascript/jquery.scrolly.min.js"></script>
		<script src="/resources/javascript/skel.min.js"></script>
		<script src="/resources/javascript/util.js"></script>
		<script src="/resources/javascript/main.js"></script>	
		<script src="//cdn.ckeditor.com/4.12.1/standard/ckeditor.js"></script>
		<script src="/resources/javascript/modernizr.custom.js"></script>
		
    <title>Map service</title>
    <style type="text/css">
        html, body {
          height: 100%;
          margin: 0;
          padding: 0;
        }
 
        #map-canvas, #map_canvas {
          height: 100%;
        }
 
        @media print {
          html, body {
            height: auto;
          }
 
          #map_canvas {
            height: 650px;
          }
        }
 
        #panel {
          position: absolute;
          top: -20px;
          left: 50%;
          margin-left: -180px;
          z-index: 5;
          background-color: #fff;
          padding: 5px;
          border: 1px solid #999;
        }
        /* 	게시글 등록 Modal */
		.modal-dialog.modal-80size {
		  width: 300%;
		  height: 100%;
		  margin: 0;
		  padding: 0;
		}
		
		.modal-content.modal-80size {
		  color: black;
		  background-color: #D9E5FF;
		  height: auto;  
		  min-height: 150%;
		  border-radius: 0;
		}
		
		.modal.modal-center {
		  text-align: center;
		}
		
		@media screen and (min-width: 768px) {
		  .modal.modal-center:before {
		    display: inline-block;
		    vertical-align: middle;
		    content: " ";
		    height: 100%;
		   
		  }
		}
		
		.modal-dialog.modal-center {
		  display: inline-block;
		  text-align: left;
		  vertical-align: middle;
		}
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyA_L7YCMev735YseqFdkMfkmFz49H-a7To" ></script> 
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
    <script>
    var directionsDisplay;
    var directionsService = new google.maps.DirectionsService();
    var map;
 
    function initialize() {
      
    directionsDisplay = new google.maps.DirectionsRenderer();
      var seoul = new google.maps.LatLng(37.498036, 127.027578);
      
      var mapOptions = {
        zoom:14,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        center: seoul
      }
      
      map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
      directionsDisplay.setMap(map);
      
    }
 
    function calcRoute() {
      var start = document.getElementById('start').value;
      var end = document.getElementById('end').value;
      var mode = document.getElementById('mode').value;
 
      var request = {
          origin:start,
          destination:end,
          travelMode: eval("google.maps.DirectionsTravelMode."+mode)
          
      };
      directionsService.route(request, function(response, status) {
    	//alert(status);  
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
        }
      });
    }
 
    google.maps.event.addDomListener(window, 'load', initialize);
 
    </script>
    </head>
    <body>
  	
		<div style="display:none">
                <select id="mode">
                <option value="TRANSIT">대중 교통 정보</option>
                </select>
            </div>
            <br/>
        <div class="input-group" style="padding-bottom:20px">		    
							    
							    <span><font size="3">&ensp;<strong>기존 주소  :&ensp; </strong></font></span>
							    <input type="text" id="start" class="form-control" value="${user.address}" style="height:25px;max-width: 490px;">
		</div>
		<div class="input-group">					    
							    <br/><br/><span><font size="3">&ensp;<strong>공연장/경기장 찾기 :&ensp; </strong></font></span>
							   <select class="btn btn-outline-light custom-select" id="end" name="end" style="height:30px;font-size:13px;">
								<option selected>목적지 선택&ensp;</option>
			    					<c:forEach var="event" items="${list}"><!-- 리스트에 담긴 것을 location에 저장하고 출력 -->
			    				<option value="${event.eventLocation}">${event.koLocation}</option>
			    				</c:forEach>
			    	   			</select>
			    	   			
<!-- 							   <select id="end" class="form-control"> -->
<%-- 							   		<c:forEach var="location" items="${list}"><!-- 리스트에 담긴 것을 location에 저장하고 출력 --> --%>
<%-- 							   		<option value="${location}">${location}</option> --%>
<%-- 							   		</c:forEach> --%>
<!-- 							   	</select> -->
							   	
							    	<input type="button" class="btn btn-info" value="찾기" style="font-size:15px;height:30px;margin-left:10px;padding-top:3px;" onclick="Javascript:calcRoute();" >							
						     </div>
        <div id="map-canvas"></div>
      
    </body>
</html>