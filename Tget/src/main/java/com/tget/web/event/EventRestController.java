package com.tget.web.event;


import java.io.File;
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
import org.springframework.util.FileCopyUtils;
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
	
	@Value("#{commonProperties['uploadPath']}")
	String uploadPath;
	
	@Value("#{commonProperties['videoPath']}")
	String videoPath;
	
	///Constructor
	public EventRestController(){
		System.out.println(this.getClass());
	}
	
	///Method
	@RequestMapping(value="rest/addInterestedEvent/{eventId}")
	public Map<String,Object> addInterestedEvent(@PathVariable String eventId, HttpSession session) throws Exception {
		System.out.println("===============rest/addInterestedEvent/{eventId}===============");
		
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
//		String userId = "admin";
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
	
//	@RequestMapping(value="rest/addYoutubeVideo", method=RequestMethod.GET)
//	public Map<String,Object> addYoutubeVideo(@RequestParam String requestPageToken, @ModelAttribute Search search) throws Exception {
//		System.out.println("===============rest/addYoutubeVideo===============");
//		//youtube테이블에 add하기위해 창을 요청하는 떄 -> youtube를 search하고 그 결과를 보여줄 화면
//		return eventService.getYoutubeList(search, requestPageToken.trim(), youtubeKey);
//	}
	
	@RequestMapping(value="rest/addYoutubeVideo/{videoId}", method=RequestMethod.POST)
	public Map<String,Object> addYoutubeVideo(@PathVariable String videoId,@ModelAttribute("event") Event event) throws Exception {
		System.out.println("===============rest/addYoutubeVideo/{videoId}===============");
		System.out.println("eventName : "+event.getEventName());
		eventService.addYoutubeVideo(videoId, event.getEventName());
		List<String> list = eventService.getYoutubeIdList(event.getEventName());
		
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
		
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
//		String userId = "admin";
		eventService.deleteInterestedEvent(eventId, userId);
		
		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("interestedEventList", eventService.getInterestedEventList(userId));
		
		return map;
	}
	
	@RequestMapping(value="rest/getPopularEventList")
	public List<String> getPopularEventList() throws Exception {
		System.out.println("===============rest/getPopularEventList===============");
		
//		Map<String,Object> map = new HashMap<String,Object>();
		List<Event> list =  eventService.getPopularEventList();
		List<String> eventNameList = new ArrayList<String>();
		
		for (Event event : list) {
			if (eventNameList.size()==0) {
				eventNameList.add(event.getEventName());
			}else if(eventNameList.size()<10){
				for (int i = 0; i < eventNameList.size(); i++) {
					if (eventNameList.get(i).equals(event.getEventName())) {
						break;
					} else if ((i==eventNameList.size()-1) &&( ! eventNameList.get(i).equals(event.getEventName()))) {
						eventNameList.add(event.getEventName());
					}
				}
			}else if(eventNameList.size()==10){
				break;
			}
		}
		
//		map.put("popularEventList", eventService.getPopularEventList());
		
		return eventNameList;
	}
	
	@RequestMapping(value="rest/getRecommendedEventList")
	public Map<String,Object> getRecommendedEventList() throws Exception {
		System.out.println("===============rest/getRecommendedEventList===============");
		List<RecommEvent> recommEventlist = eventService.getRecommendedEventList();
		List<String> eventNameList = new ArrayList<String>();
		List<String> videoNameList = new ArrayList<String>();
		List<String> recommEventNameList = new ArrayList<String>();
		List<String> recommEventDetailList = new ArrayList<String>();
		for (RecommEvent recommEvent : recommEventlist) {
			eventNameList.add(recommEvent.getEventName());
			videoNameList.add(recommEvent.getVideoName());
			recommEventNameList.add(recommEvent.getRecommEventName());
			recommEventDetailList.add(recommEvent.getRecommEventDetail());
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("eventNameList", eventNameList);
		map.put("videoNameList", videoNameList);
		map.put("recommEventNameList", recommEventNameList);
		map.put("recommEventDetailList", recommEventDetailList);
		map.put("recommEventlistSize",recommEventlist.size());
		return map;
	}
	
	@RequestMapping(value="rest/getRecommendedEvent")
	public Map<String,Object> getRecommendedEvent(@RequestBody int recommEventNo) throws Exception {
		System.out.println("===============rest/getRecommendedEvent===============");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("recommendedEvent", eventService.getRecommendedEvent(recommEventNo));
		
		return map;
	}
	
//	@RequestMapping(value="rest/addRecommendedEvent", method=RequestMethod.POST)
//	public Map<String,Object> addRecommendedEvent(@RequestBody RecommEvent recommEvent) throws Exception {
//		System.out.println("===============rest/addRecommendedEvent===============");
//		
//		eventService.addRecommendedEvent(recommEvent);
//		
//		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("recommendedEvent", eventService.getRecommendedEvent(recommEvent.getRecommEventNo()));
//		
//		return map;
//	}
	
//	@RequestMapping(value="rest/updateRecommendedEvent", method=RequestMethod.POST)
//	public Map<String,Object> updateRecommendedEvent(@RequestBody RecommEvent recommEvent) throws Exception {
//		System.out.println("===============rest/updateRecommendedEvent===============");
//		
//		eventService.updateRecommendedEvent(recommEvent);
//		
//		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("recommendedEvent", eventService.getRecommendedEvent(recommEvent.getRecommEventNo()));
//		map.put("recommEventlist", eventService.getRecommendedEventList());
//		return map;
//	}
	
	@RequestMapping(value="rest/deleteRecommendedEvent")
	public Map<String,Object> deleteRecommendedEvent(@ModelAttribute("recommEventNo") int recommEventNo) throws Exception {
		System.out.println("===============deleteRecommendedEvent===============");
	
		eventService.deleteRecommendedEvent(recommEventNo);

		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("recommEventlist", eventService.getRecommendedEventList());
		
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
		String userId = null;
		User user = (User)session.getAttribute("user");
		Map<String,Object> map = new HashMap<String,Object>();
		
		if (user != null) {
			userId = user.getUserId();
//			String userId = "admin";
			
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
			map.put("interestedEventList", eventIdList);
		}else {
			return null;
		}
	
		return map;
	}
	
	@RequestMapping(value="rest/getInterestedEventList/{eventId}")
	public Map<String,Object> isInterestedEvent(@PathVariable String eventId,HttpSession session) throws Exception {
		System.out.println("===============rest/getInterestedEventList/{eventId}===============");

		Map<String,Object> map = this.getInterestedEventList(session);
		List<String> eventIdList = (List<String>)map.get("interestedEventList");
		boolean isInterestedEvent = false;
		
		for (String string : eventIdList) {
			if (eventId.equals(string)) {
				isInterestedEvent = true;
			}
		}
		System.out.println("isInterestedEvent : "+isInterestedEvent);
		map.put("isInterestedEvent", isInterestedEvent);
		
		return map;
	}
	
//	@RequestMapping(value="rest/addEventImage")
//	public Map<String,Object> addEventImage(@RequestParam(value = "file", required = false) MultipartFile multipartFile,@ModelAttribute("event") Event event) throws Exception {
//		System.out.println("===============addEventImage===============");
//		System.out.println(event);
//		System.out.println(multipartFile);
//		
//		if(!multipartFile.isEmpty()) {
//			event.setEventImage(multipartFile.getOriginalFilename( ));
//					
//			File file = new File(uploadPath,multipartFile.getOriginalFilename());
//			FileCopyUtils.copy(multipartFile.getBytes(), file);
//			
//			//multipartFile.transferTo(file);		
//		}
////		eventService.addEventImage(event.getEventImage(), event.getEventName());
//		
//		Map<String,Object> map = new HashMap<String,Object>();
////		map.put("eventListByName", eventService.getEventByName(event.getEventName()));
//		map.put("eventImage", event.getEventImage());
//		return map;
//	}
	
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