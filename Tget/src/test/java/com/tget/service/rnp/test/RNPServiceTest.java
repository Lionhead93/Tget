package com.tget.service.rnp.test;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tget.common.domain.Search;
import com.tget.service.event.EventService;
import com.tget.service.event.domain.Category;
import com.tget.service.event.domain.Event;
import com.tget.service.event.domain.RecommEvent;
import com.tget.service.rnp.RNPService;
import com.tget.service.rnp.domain.PointHistory;
import com.tget.service.rnp.domain.Review;
import com.tget.service.user.domain.User;



/*
 *	FileName :  EventServiceTest.java
 * ㅇ JUnit4 (Test Framework) 과 Spring Framework 통합 Test( Unit Test)
 * ㅇ Spring 은 JUnit 4를 위한 지원 클래스를 통해 스프링 기반 통합 테스트 코드를 작성 할 수 있다.
 * ㅇ @RunWith : Meta-data 를 통한 wiring(생성,DI) 할 객체 구현체 지정
 * ㅇ @ContextConfiguration : Meta-data location 지정
 * ㅇ @Test : 테스트 실행 소스 지정
 */
@RunWith(SpringJUnit4ClassRunner.class)

//==> Meta-Data 를 다양하게 Wiring 하자...
//@ContextConfiguration(locations = { "classpath:config/context-*.xml" })
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })
//@ContextConfiguration(locations = { "classpath:config/context-common.xml" })
public class RNPServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("rNPServiceImpl")
	private RNPService rNPService;

	
	@Test
	public void addReview() throws Exception {

		User user = new User();
		user.setUserId("buyer");
		user.setPoint(500000);
		rNPService.updatePoint(user);
		
	}
	
	//@Test
	public void addPoint() throws Exception {
		PointHistory pointHistory = new PointHistory();
		pointHistory.setPointUpdateCode("1");
		pointHistory.setTotalPoint(500);
		pointHistory.setTranNo(10003);
		pointHistory.setUpdatePoint(1000);
		pointHistory.setUserId("buyer");
		rNPService.addPoint(pointHistory);

	}
	
	//@Test
	public void getPointHistory() throws Exception {
			
		System.out.println(rNPService.getPointHistory("buyer"));		
	}
		
	//@Test
	public void getReviewList() throws Exception {
			
		System.out.println(rNPService.getReviewList("buyer"));		
			
	}
		
	//@Test
	public void getSellerEstimationList() throws Exception {
			
		System.out.println(rNPService.getSellerEstimationList("seller"));		

	}
		
	//@Test
	public void updateReview() throws Exception {
		Review review = new Review();
		review.setReviewBody("리뷰 변경이용!!");
		review.setScore(4);
		review.setTranNo(10000);
		rNPService.updateReview(review);		
	}
				
	//@Test
	public void getReview() throws Exception {
			
		System.out.println(rNPService.getReview(10000));
	
	}
		
}