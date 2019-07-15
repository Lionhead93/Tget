package com.tget.web.event;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.tget.common.domain.Search;
import com.tget.service.ticket.TicketService;
import com.tget.service.ticket.domain.SellProb;
import com.tget.service.ticket.domain.Ticket;
import com.tget.service.user.UserService;
import com.tget.service.user.domain.User;
import com.tget.service.event.EventService;
import com.tget.service.event.domain.Category;
import com.tget.service.event.domain.Event;
import com.tget.service.event.domain.RecommEvent;


//==> 회원관리 Controller
@RestController
@RequestMapping("/event/*")
public class EventRestController {
	
	///Field
	@Autowired
	@Qualifier("eventServiceImpl")
	private EventService eventService;
	
	@Autowired
	@Qualifier("ticketServiceImpl")
	private TicketService ticketService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
	@Value("#{apiKeyProperties['youtubeKey']}")
	String youtubeKey;
	
	@Value("#{apiKeyProperties['stubhubKey']}")
	String stubhubKey;
	
	
	///Constructor
	public EventRestController(){
		System.out.println(this.getClass());
	}
	
	///Method
	@RequestMapping(value="rest/addInterestedEvent/{eventId}")
	public Map<String,Object> addInterestedEvent(@PathVariable String eventId, HttpSession session) throws Exception {
		System.out.println("===============rest/addInterestedEvent/{eventId}===============");
		
//		User user = (User)session.getAttribute("user");
//		String userId = user.getUserId();
		String userId = "admin";
		System.out.println("userId : "+userId);
		
		eventService.addInterestedEvent(eventId, userId);
		
		List<Event> interestedEventList = eventService.getInterestedEventList(userId);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("interestedEventList", interestedEventList);
		
		return map;
	}
	
	@RequestMapping(value="rest/getYoutubeList")
	public List<String> getYoutubeList( @RequestBody String eventName) throws Exception {
		System.out.println("===============rest/getYoutubeList===============");
		
		return eventService.getYoutubeIdList(eventName);
	}
	
	@RequestMapping(value="rest/addYoutubeVideo/{requestPageToken}", method=RequestMethod.GET)
	public Map<String,Object> addYoutubeVideo(@PathVariable String requestPageToken, @ModelAttribute Search search) throws Exception {
		System.out.println("===============rest/addYoutubeVideo/{requestPageToken}===============");
		//youtube테이블에 add하기위해 창을 요청하는 떄 -> youtube를 search하고 그 결과를 보여줄 화면
		return eventService.getYoutubeList(search, requestPageToken, youtubeKey);
	}
	
	@RequestMapping(value="rest/addYoutubeVideo/{youtubeId}", method=RequestMethod.POST)
	public Map<String,Object> addYoutubeVideo(@PathVariable String youtubeId,@RequestBody String eventName) throws Exception {
		System.out.println("===============rest/addYoutubeVideo/{youtubeId}===============");
		
		eventService.addYoutubeVideo(youtubeId, eventName);
		List<String> list = eventService.getYoutubeIdList(eventName);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("youtubeListByName", list);
		
		return map;
	}
	
//	@RequestMapping(value="rest/shareUrl")
//	public Map<String,Object> shareUrl(@RequestBody Review review) throws Exception {
//		System.out.println("===============shareUrl===============");
//		
//		eventService.shareUrl
//		
//		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("review", review);
//		
//		return map;
//	}
	
	@RequestMapping(value="rest/deleteInterestedEvent/{eventId}")
	public Map<String,Object> deleteInterestedEvent(@PathVariable String eventId, HttpSession session) throws Exception {
		System.out.println("===============rest/deleteInterestedEvent/{eventId}===============");
		
//		User user = (User)session.getAttribute("user");
//		String userId = user.getUserId();
		String userId = "admin";
		eventService.deleteInterestedEvent(eventId, userId);
		
		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("interestedEventList", eventService.getInterestedEventList(userId));
		
		return map;
	}
	
	@RequestMapping(value="rest/getPopularEventList")
	public Map<String,Object> getPopularEventList() throws Exception {
		System.out.println("===============rest/getPopularEventList===============");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("popularEventList", eventService.getPopularEventList());
		
		return map;
	}
	
	@RequestMapping(value="rest/getRecommendedEvent")
	public Map<String,Object> getRecommendedEvent(@RequestBody int recommEventNo) throws Exception {
		System.out.println("===============rest/getRecommendedEvent===============");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("recommendedEvent", eventService.getRecommendedEvent(recommEventNo));
		
		return map;
	}
	
	@RequestMapping(value="rest/addRecommendedEvent", method=RequestMethod.POST)
	public Map<String,Object> addRecommendedEvent(@RequestBody RecommEvent recommEvent) throws Exception {
		System.out.println("===============rest/addRecommendedEvent===============");
		
		eventService.addRecommendedEvent(recommEvent);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("recommendedEvent", eventService.getRecommendedEvent(recommEvent.getRecommEventNo()));
		
		return map;
	}
	
	@RequestMapping(value="rest/updateRecommendedEvent", method=RequestMethod.POST)
	public Map<String,Object> updateRecommendedEvent(@RequestBody RecommEvent recommEvent) throws Exception {
		System.out.println("===============rest/updateRecommendedEvent===============");
		
		eventService.updateRecommendedEvent(recommEvent);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("recommendedEvent", eventService.getRecommendedEvent(recommEvent.getRecommEventNo()));
		
		return map;
	}
	
	@RequestMapping(value="rest/deleteRecommendedEvent")
	public Map<String,Object> deleteRecommendedEvent(@RequestBody int recommEventNo) throws Exception {
		System.out.println("===============deleteRecommendedEvent===============");
		
		eventService.deleteRecommendedEvent(recommEventNo);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("recommendedEventList", eventService.getRecommendedEventList());
		
		return map;
	}
	
	@RequestMapping(value="rest/addCategoryTwo", method=RequestMethod.POST)
	public Map<String,Object> addCategoryTwo(@RequestBody Category category) throws Exception {
		System.out.println("===============rest/addCategoryTwo===============");
		
		eventService.addCategoryTwo(category);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("category", eventService.getCategory(category.getCategoryTwoEng()));
		
		return map;
	}
	
	@RequestMapping(value="rest/updateCategoryTwo", method=RequestMethod.GET)
	public Map<String,Object> updateCategoryTwo(@RequestParam String categoryTwoEng) throws Exception {
		System.out.println("===============rest/updateCategoryTwo===============");

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("category", eventService.getCategory(categoryTwoEng));
		
		return map;
	}
	
	@RequestMapping(value="rest/updateCategoryTwo", method=RequestMethod.POST)
	public Map<String,Object> updateCategoryTwo(@RequestBody Category category) throws Exception {
		System.out.println("===============rest/updateCategoryTwo===============");
		
		eventService.updateCategoryTwo(category);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("category", eventService.getCategory(category.getCategoryTwoEng()));
		
		return map;
	}
	
	@RequestMapping(value="rest/deleteCategoryTwo")
	public Map<String,Object> deleteCategoryTwo(@RequestBody String categoryTwoEng) throws Exception {
		System.out.println("===============rest/deleteCategoryTwo===============");
		
		eventService.deleteCategoryTwo(categoryTwoEng);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("categoryList", eventService.getCategoryList());
		
		return map;
	}
	
//	@RequestMapping(value="rest/getEventList/{requestPageToken}")
//	public Map<String,Object> getEventList(@PathVariable String requestPageToken, @RequestBody Search search) throws Exception {
//		System.out.println("===============getEventList===============");
//				
////		"youtubeList"
////		"nextPageToken"
////		"prevPageToken"
////		"totalResults"
//		
//		return eventService.getEventList(search, requestPageToken, stubhubKey);
//	}
	
	@RequestMapping(value="rest/getEventTicketList")
	public Map<String,Object> getEventTicketList(@RequestBody String eventId) throws Exception {
		System.out.println("===============rest/getEventTicketList===============");
		
		Search search = new Search();
		search.setSearchCondition("0");
		search.setSearchKeyword(eventId);
		
		Map<String, Object> map = ticketService.getTicketList(search);
		//eventId에 따른 티켓 리스트
		
		List<Ticket> ticketList = (List<Ticket>)map.get("list");
		SellProb sellProb = (SellProb)map.get("sellProb");
		
		Event event = eventService.getEvent(eventId);
		
		map = new HashMap<String,Object>();
		map.put("event", event);
		map.put("ticketList", ticketList);
		map.put("lowPrice", sellProb.getLowPrice());
		map.put("totalTicketCount", sellProb.getTotalCount());
		
		return map;
	}
	
	@RequestMapping(value="rest/getInterestedEventList")
	public Map<String,Object> getInterestedEventList(HttpSession session) throws Exception {
		System.out.println("===============rest/getInterestedEventList===============");
		
//		User user = (User)session.getAttribute("user");
//		String userId = user.getUserId();
		String userId = "admin";
		
		List<Event> list = eventService.getInterestedEventList(userId);
		List<String> eventIdList = new ArrayList<String>();
		
		for (Event event : list) {
			if (eventIdList.size()==0) {
				eventIdList.add(event.getEventId());
			}else {
				for (int i = 0; i < eventIdList.size(); i++) {
					if (eventIdList.get(i).equals(event.getEventId())) {
						break;
					} else if ((i==eventIdList.size()-1) &&( ! eventIdList.get(i).equals(event.getEventId()))) {
						eventIdList.add(event.getEventId());
					}
				}
			}
		}
		System.out.println(eventIdList);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("interestedEventList", eventIdList);
		
		return map;
	}
	
	@RequestMapping(value="rest/addEventImage")
	public Map<String,Object> addEventImage(@RequestBody Event event) throws Exception {
		System.out.println("===============addEventImage===============");
		
		eventService.addEventImage(event.getEventImage(), event.getEventName());
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("eventListByName", eventService.getEventByName(event.getEventName()));
		
		return map;
	}
	
	@RequestMapping(value="rest/updateEventImage")
	public Map<String,Object> updateEventImage(@RequestBody Event event) throws Exception {
		System.out.println("===============rest/updateEventImage===============");
		
		eventService.updateEventImage(event.getEventImage(), event.getEventName());
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("eventListByName", eventService.getEventByName(event.getEventName()));
		
		return map;
	}
	
	@RequestMapping(value="rest/deleteEventImage")
	public Map<String,Object> deleteEventImage(@RequestBody String eventName) throws Exception {
		System.out.println("===============rest/deleteEventImage===============");
		
		eventService.deleteEventImage(eventName);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("eventListByName", eventService.getEventByName(eventName));
		
		return map;
	}
	
	@RequestMapping(value="rest/getCategoryList")
	public Map<String,Object> getCategoryList() throws Exception {
		System.out.println("===============rest/getCategoryList===============");
		
		List<Category> categorylist = eventService.getCategoryList();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("categorylist", categorylist);
			
		
		return map;		
	}
	
	@RequestMapping(value="rest/getCategory")
	public Map<String,Object> getCategory(String categoryTwoName) throws Exception {
		System.out.println("===============rest/getCategory===============");
		
		Map<String,Object> map = new HashMap<String,Object>();
		List<Category> categorylist = eventService.getCategoryList();
		
		for (Category category : categorylist) {
			if (category.getCategoryTwoName().equals(categoryTwoName)) {
				map.put("categoryTwoEng", category.getCategoryTwoEng());
			}
		}	
		System.out.println("rest/getCategory map - "+map);
		return map;		
	}
}