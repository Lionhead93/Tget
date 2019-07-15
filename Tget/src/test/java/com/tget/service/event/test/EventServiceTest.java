package com.tget.service.event.test;

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
public class EventServiceTest {

	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("eventServiceImpl")
	private EventService eventService;

	
	//@Test
	public void addEvent() throws Exception {
		
		
		Event event = new Event();
		event.setEventId("testEvent");
//		event.setCategoryTwoNo(10000);
		event.setEventDate(new Date(2012-1900, 4-1, 8));
		event.setEventLocation("서울");
		event.setEventName("EXO");
		event.setEventTime(1248);
		//event.setViewCount(viewCount);
		
//		Event event2 = new Event();
//		event2.setEventId("testEvent2");
//		event2.setCategoryTwoNo(10000);
//		event2.setEventDate(new Date(2012-1900, 4-1, 8));
//		event2.setEventLocation("서울");
//		event2.setEventName("EXO");
//		event2.setEventTime(1248);

//		eventService.addEvent(event);
		//==> API 확인
		
	}
	
		//@Test
		public void getEvent() throws Exception {
			
			Event event = eventService.getEvent("testEvent");
			System.out.println(event);
			Assert.assertNotNull(eventService.getEvent("testEvent"));
			Assert.assertEquals("testEvent", event.getEventId());			
		}
		
		//@Test
		public void getEventByName() throws Exception {
			
			List<Event> eventList = eventService.getEventByName("EXO");

			System.out.println(eventList);
			
		}
		
		//@Test
		public void updateEventViewCount() throws Exception {
			
			List<Event> eventList = eventService.getEventByName("EXO");
			System.out.println("eventList : "+eventList);
			int view = 0;
			for (Event event : eventList) {
				view = event.getViewCount();
				System.out.println(view);
			}
			eventService.updateEventViewCount((view+1), "EXO");

			//System.out.println(event);			
			eventList = eventService.getEventByName("EXO");
			System.out.println("=================eventList : \n"+eventList);

		}
		
		//@Test
		public void updateEventImage() throws Exception {
			

			List<Event> eventList = eventService.getEventByName("EXO");
			System.out.println(eventList);
			eventService.updateEventImage("testEXOImage", "EXO");
			//==> API 확인
			eventList = eventService.getEventByName("EXO");
			Assert.assertEquals("testEXOImage", eventList.get(0).getEventImage());
		}
		
		//@Test
		public void addInterestedEvent() throws Exception {

			eventService.addInterestedEvent("testId", "admin");

		}
				
		//@Test
		public void getInterestedEventList() throws Exception {
			
			System.out.println(eventService.getInterestedEventList("admin"));
		
		}
		
		
		//@Test
		public void deleteInterestedEvent() throws Exception {

			eventService.deleteInterestedEvent("testId", "admin");

		}
		
		//@Test
		public void addYoutubeVideo() throws Exception {
			
			eventService.addYoutubeVideo("testYId", "EXO");
		
		}
		
		//@Test
		public void getPopularEventList() throws Exception {
			List<Event> list = null;
			System.out.println((list=eventService.getPopularEventList()));
			System.out.println("list.size() - "+list.size());
		}
		
		//@Test
		public void getCategoryList() throws Exception {

			System.out.println(eventService.getCategoryList());
					
		}
		
		//@Test
		public void addCategoryTwo() throws Exception {
					
			Category category = new Category();
			category.setCategoryOneCode("0");
			category.setCategoryTwoName("오페라");
			category.setCategoryTwoEng("opera");
			eventService.addCategoryTwo(category);			
		}
		
		//@Test
		public void getCategory() throws Exception {
			eventService.getCategory("테스트");			
			//System.out.println(eventService.getCategory("musical"));

		}
		
		//@Test
		public void updateCategoryTwo() throws Exception {
			Category category = new Category();
			category.setCategoryOneCode("0");
			category.setCategoryTwoName("뮤지컬");
			category.setCategoryTwoEng("musical");
			category.setCategoryTwoNo(10001);
			eventService.updateCategoryTwo(category);
		}
		
		//@Test
		public void deleteCategoryTwo() throws Exception {
					
			eventService.deleteCategoryTwo("opera");
			
		}
		
		//@Test
		public void addRecommendedEvent() throws Exception {
			
			RecommEvent recommEvent = new RecommEvent();
			recommEvent.setEventName("EXO");
			recommEvent.setRecommEventName("EXO의 콘서트");
			recommEvent.setRecommEventDetail("EXO 콘서트 가고싶다");
			recommEvent.setVideoName("EXO_TEMPO_MV");
			recommEvent.setRecommEventNo(1);
			eventService.addRecommendedEvent(recommEvent);

		}
		
		//@Test
		public void getRecommendedEventList() throws Exception {
			List<RecommEvent> list = eventService.getRecommendedEventList();
			System.out.println(list.get(0));
			System.out.println(list.get(1));
		}
		
		//@Test
		public void getRecommendedEvent() throws Exception {
			
			 System.out.println(eventService.getRecommendedEvent(0));
		}
				
		//@Test
		public void updateRecommendedEvent() throws Exception {
			RecommEvent recommEvent = new RecommEvent();
			recommEvent.setEventName("EXO");
			recommEvent.setRecommEventName("EXO의 콘서트");
			recommEvent.setRecommEventDetail("EXO 콘서트 가고싶다...날 보내줘.....");
			recommEvent.setVideoName("EXO_TEMPO_MV");
			recommEvent.setRecommEventNo(1);
			eventService.updateRecommendedEvent(recommEvent);
		}
		
		//@Test
		public void deleteRecommendedEvent() throws Exception {
			
			eventService.deleteRecommendedEvent(0);
			
		}
		
		//@Test
		public void selectInterestedByUser() throws Exception {
			Search search = new Search();
			search.setSearchCondition("0");
//			search.setSearchKeyno(10000);
			search.setSearchKeyword("10000");
//			search.setSearchCondition("1");
//			search.setSearchKeyword("testEvent");
			System.out.println(eventService.getInterestedByUser(search));
					
		}
				
		
		
}