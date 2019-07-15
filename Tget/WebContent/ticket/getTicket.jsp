<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


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
   
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
	   body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">	
		
	
	$(function(){
	    		
	    $("a[href='#']").on("click",function(){
	    	
	    	self.location = "/";
	    	
	    });
		$("button").on("click",function(){	    	

		    $('.alert').alert('close');		    
	    	
	    });
	    
	});
	</script>		
    
</head>

<body>	
	<div class="container">
	<br/>
		<h1 class="text-center">티켓 상세</h1>
		<br/>	
		
		<form class="form-horizontal">				  
		<br/>		
		  ${ticket}  
		  <div class="form-group text-center">
		      <button type="button" class="btn btn-primary"  >요 &nbsp;청</button>
			  <a class="btn btn-danger btn" href="#" role="button">취&nbsp;소</a>
		  </div>
		</form>
		
		
 	<div class="alert alert-success" role="alert">
		 <h4 class="alert-heading">Well done!</h4>
	</div>
		
 	</div>
</body>

</html>