<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
 <meta http-equiv="X-UA-Compatible" content="ie=edge" />
 <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
   <title>문자 인증</title> 
  </head> 
  <body> 
  <input type="text" name="phone" id="phone" 
  placeholder="받는 사람 번호" />
   <button onclick="sendSms();">전송</button>
    <br />
     <br /> 
   <input type="text" name="sms" id="sms" 
   placeholder="인증 번호 입력" /> 
   <button onclick="phoneCheck();">인증</button> 
   
   <script> 
   function sendSms(){ 
	   alert("좀 떠라ㅠㅠ");
	   
	   <%-- <%=request.getContextPath()%>/sendSms" --%>
	   $.ajax({ 
		   url: "<%=request.getContextPath()%>/user/sendSms",
		   data: { 
			   receiver: $("#phone").val() 
			   }, 
			   type: "post", 
			
   success: function(result) { 
	
	   if (result == "true") { 
		   console.log(result);
		   }  else { 
			   alert("인증번호 전송 실패");
			   } 
	   }
		 });
	   }
   function phoneCheck() {
	   $.ajax({ 
		   url: "<%=request.getContextPath()%>/user/smsCheck", 
	   type: "post", 
	   data: { 
		   code: $("#sms").val() 
		   }, 
		   
	   success: function(result)
	   { if (result == "ok") { 
		   alert("번호 인증 성공"); 
	   } else { 
		   alert("번호 인증 실패"); 
	  	 	} 
	 	  } 
	   }); 
	   } 
   </script> 
   </body> 
   </html>


