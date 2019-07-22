<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<link href="/css/myPage.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body{
    background: #eee;
}
span{
    font-size:15px;
}
a{
  text-decoration:none; 
  color: #0062cc;
  border-bottom:2px solid #0062cc;
}
.box{
    padding:60px 0px;
}

.box-part{
    background:#FFF;
    border-radius:0;
    padding:60px 10px;
    margin:30px 0px;
}
.text{
    margin:20px 0px;
}

.fa{
     color:#4183D7;
}
</style>


			</head>
			<body>
			
			
			
			
			
			
			<div class="box">
			
			    <div class="container">
			     	<div class="row">
			
			    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
         		
					<div class="box-part">
                        
                      
                        	 <h4>${user.nickName}님 프로필</h4>
							
						
	  		<div class="col-xs-8 col-md-4"><strong>아이디</strong></div>
			<div class="col-xs-8 col-md-8">${user.userId}</div><hr/>
			<div class="col-xs-8 col-md-4 "><strong>닉네임</strong></div>
			<div class="col-xs-8 col-md-8">${user.nickName}</div>	<hr/>
            <div class="col-xs-8 col-md-4 "><strong>이 름</strong></div>
			<div class="col-xs-8 col-md-8">${user.userName}</div>  <hr/>
			<div class="col-xs-8 col-md-4 "><strong>주소</strong></div>
			<div class="col-xs-8 col-md-50">${user.address}</div>   <hr/> 
			
			<div class="col-xs-8 col-md-4"><strong>전화번호</strong></div>
			<div class="col-xs-8 col-md-40">${ !empty user.phone ? user.phone : ''}	</div> <hr/> 
			
						
	  		<div class="col-xs-8 col-md-4">
	  			<button type="button" class="btn btn-primary">회원정보 수정</button>
	  		</div>
                        
					 
				</div>	 
				</div>
				
				
				 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               
					<div class="box-part">
                        
                      
                        
						<div class="title">
							<h4>${user.nickName}님 계좌정보</h4>
						</div>
             <div class="col-xs-8 col-md-4 "><strong>이 름</strong></div>
			<div class="col-xs-8 col-md-8">${user.userName}</div>  <hr/>          
	  		<div class="col-xs-8 col-md-4"><strong>은행명</strong></div><hr/>
			<div class="col-xs-8 col-md-8">${user.accountBank}</div><hr/>
			<div class="col-xs-8 col-md-4 "><strong>계좌번호</strong></div> <hr/>
			<div class="col-xs-8 col-md-8">${user.accountNo}</div>	<hr/>
      
	<div class="col-xs-8 col-md-4">
	  			<button type="button" id ="btn" class="btn btn-primary" >계좌정보 수정</button>
	  		</div> 
					 
				</div>	 
				</div>
				
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               
					<div class="box-part">
                        
                      
                        
						<div class="title">
							<h4>${user.nickName}님 판매자정보</h4>
						</div>
             <div class="col-xs-8 col-md-8 "><strong>판매자등급</strong></div>
			<div class="col-xs-8 col-md-8">
			
		
			<c:set var="sc" value ="${user.sellerCode}"/>
			
			<c:choose>
			<c:when test="${sc eq '1' }"> 새싹 </c:when>
			<c:when test="${sc eq '2' }"> 우수 </c:when>
			<c:when test="${sc eq '3' }"> V.I.P </c:when>
			
			<c:otherwise>
				판매자 등록 후 조회.
				<button id= "add" type="button" class="btn btn-primary">등록</button>
				</c:otherwise>		
			</c:choose>

			</div> 
			 <hr/>          
	  		<div class="col-xs-8 col-md-8"><strong>총 판매금액</strong></div><hr/>
			<div class="col-xs-8 col-md-8">${user.salesAmount}</div><hr/>
			<div class="col-xs-8 col-md-8 "><strong>총 판매횟수</strong></div> <hr/>
			<div class="col-xs-8 col-md-8">${user.salesCount}</div>	<hr/>
				</div>	 
				</div>
				 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               
					<div class="box-part text-center">
					    
					    <i class="fa fa-google-plus fa-3x" aria-hidden="true"></i>
                    
						<div class="title">
							<h4>Google</h4>
						</div>
                        
						<div class="text">
							<span>Lorem ipsum dolor sit amet, id quo eruditi eloquentiam. Assum decore te sed. Elitr scripta ocurreret qui ad.</span>
						</div>
                        
						<a href="#">Learn More</a>
                        
					 </div>
				</div>	 
				
				 <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
               
					<div class="box-part text-center">
                        
                        <i class="fa fa-github fa-3x" aria-hidden="true"></i>
                        
						<div class="title">
							<h4>Github</h4>
						</div>
                        
						<div class="text">
							<span>Lorem ipsum dolor sit amet, id quo eruditi eloquentiam. Assum decore te sed. Elitr scripta ocurreret qui ad.</span>
						</div>
                        
						<a href="#">Learn More</a>
                        
					 </div>
				</div>
		
		</div>		
    </div>
</div>
</body>
</html>