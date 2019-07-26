 <%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Footer -->
			<br/><br/><br/><br/>
			<footer>
				
				<div id="footer" class="jumbotron">
				<div class="text-center">
					<div class="row">
						<div class="col">
							<h3>공지사항</h3>
							<hr/>
							<br/>
								<a href="#">티켓거래 공지</a><br/><br/>
								<a href="#">자유게시판 이용공지</a><br/><br/>
								<a href="#">자주묻는질문</a>
							
						</div>
						<div class="col">
							<h3>자유게시판</h3>
							<hr/>
							<br/>
								<a href="#">삽니다</a><br/><br/>
								<a href="#">팝니다</a><br/><br/>
								<a href="#">수다방</a>
						</div>
						<div class="col">
							<h3>고객센터</h3>
							<hr/>
							<br/>
								<a href="#">link</a><br/><br/>
								<a href="#">link</a><br/><br/>
								<div id="plusfriend-chat-button"></div><br/>
								<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
								<script type='text/javascript'>
										    Kakao.init('b5e745a340ec3959a1b015bdb9699746');
										    Kakao.PlusFriend.createChatButton({
										    	  container: '#plusfriend-chat-button',
										    	  plusFriendId: '_xajLCT' 
										    });										  
								</script>
							
						</div>
					</div>
					<br/><hr/>
				<div class="copyright">
						<a href="#" >Back to Top</a><br/><br/>
					&copy; T-GET. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Coverr</a>. Video: <a href="https://coverr.co">Coverr</a>.
				<br/><br/>
				</div>
				
				</div>
			</div>
			</footer>	