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
	<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
	<script src="/resources/javascript/common.js" ></script>
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   <script src="http://192.168.0.16:82/socket.io/socket.io.js"></script>
	<style>
       body > div.container{
            margin-top: 10px;
       }
       #chat_box {
		    width: 450px;
		    height: 380px;
		    border: 3px solid #D6CDB7;
		}
		#msg {
		    width: 390px;
		}
		#msg_process {
		    width: 50px;
		} 
		#chat_box{
     	font-family: 'Sunflower', sans-serif;
     	font-size: 20px;
     	}
    </style>
    
    
</head>

<body>
	<div class="container">
			<div class="alert alert-primary" role="alert">
			 	<div class="text-center">${chatOpponent.nickName} 님과의 채팅</div>
			</div>
		    <div id="chat_box" style="overflow:auto">
		    <br/>
		    </div>
		    <input type="text" id="msg">
		    <button class="btn btn-outline-info" id="msg_process"><i class="far fa-paper-plane"></i></button>
		 
	</div>
	<script>
      var socket = io("http://192.168.0.16:82/");
      
      socket.emit("send_msg", "server" , '${chatUser.nickName}님이 입장하셨습니다.'); //1
      
      $("#msg_process").on('click', function(e){ //2
        socket.emit("send_msg", "${chatUser.nickName}" , $("#msg").val());
        $('#msg').val('');
        $('#msg').focus();
        e.preventDefault();
      });
      $("#msg").keydown(function(key){ 
          if(key.keyCode == 13){                   
        	  socket.emit("send_msg", "${chatUser.nickName}" , $("#msg").val());            
              $("#msg").val("");
              $('#msg').focus();
          }
      });
      socket.on('receive_message', function(re , msg){ //3
    	  if(re=="${chatUser.nickName}"){
    		  $('#chat_box').append("<div class='text-right'><button class='btn btn-primary' style='pointer-events: none;' type='button' disabled>"+msg+"</button></div><br/>");
    	  }else if(re=="server"){
    		  $('#chat_box').append("<div class='text-center'><button class='btn btn-secondary' style='pointer-events: none;' type='button' disabled>"+msg+"</button></div><br/>");
    	  }else{
    		  $('#chat_box').append("<div class='text-left'>"+re+" : <button class='btn btn-success' style='pointer-events: none;' type='button' disabled>"+msg+"</button></div><br/>");
    	  }
        $('#chat_box').scrollTop($('#chat_box')[0].scrollHeight);
      });      
    </script>
	<!-- <script>	
	 
	 $(function(){ 
		           		
     		var socket = io("http://192.168.0.16:82/");
     		
     		socket.emit("send_msg", '${chatUser.nickName}님이 입장하셨습니다.');
     		            
     		 $("#msg").keydown(function(key){ 
                 if(key.keyCode == 13){                   
                	 socket.emit("send_msg", '${chatUser.nickName} : '+$("#msg").val());                 
                     $("#msg").val("");
                 }
             });
             
             $("#msg_process").click(function(){                 
                  socket.emit("send_msg", '${chatUser.nickName} : '+$("#msg").val());                 
                 $("#msg").val("");
             });
             
             socket.on('send_msg', function(msg) {
                 $('<div></div>').text(msg).appendTo("#chat_box");
                 chatbox.scrollTop(chatbox[0].scrollHeight);
             });            
         
     	});	
	</script> -->
	
</body>

</html>