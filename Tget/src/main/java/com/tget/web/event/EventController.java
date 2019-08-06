package com.tget.web.event;


import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.tget.common.domain.Search;
import com.tget.service.event.EventService;
import com.tget.service.event.domain.Category;
import com.tget.service.event.domain.Event;
import com.tget.service.event.domain.RecommEvent;
import com.tget.service.event.domain.StubhubEvent;
import com.tget.service.event.domain.YoutubeVideo;
import com.tget.service.event.domain.YoutubeVideoList;
import com.tget.service.ticket.TicketService;
import com.tget.service.ticket.domain.SellProb;
import com.tget.service.ticket.domain.Ticket;
import com.tget.service.user.domain.User;


//==> 회원관리 Controller
@Controller
@RequestMapping("/event/*")
public class EventController {
	
	///Field
	@Autowired
	@Qualifier("eventServiceImpl")
	private EventService eventService;
	
	@Autowired
	@Qualifier("ticketServiceImpl")
	private TicketService ticketService;
	
	
	@Value("#{apiKeyProperties['youtubeKey']}")
	String youtubeKey;
	
	@Value("#{apiKeyProperties['stubhubKey']}")
	String stubhubKey;
	
	@Value("#{commonProperties['uploadPath']}")
	String uploadPath;
	
	@Value("#{commonProperties['videoPath']}")
	String videoPath;
	
	///Constructor
	public EventController(){
		System.out.println(this.getClass());
	}
	
	///Method
	
	@RequestMapping(value="getEventList")
	public String getEventList(@ModelAttribute("search") Search search,@RequestParam String requestPageToken,HttpSession session,Model model) throws Exception {
		System.out.println("===============getEventList===============");
		System.out.println("search:"+search);
		Map<String,Object> map = null;
		List<StubhubEvent> list = null;
		if (search.getSearchCondition().equals("0")) {
			model.addAttribute("category", search.getSearchKeyword());
			
			List<StubhubEvent> tempList = (List<StubhubEvent>)session.getAttribute(search.getSearchKeyword()+requestPageToken);
			
			if (tempList != null) {				
				list = tempList;				
				model.addAttribute("totalResults",(Integer)session.getAttribute(search.getSearchKeyword()+"TotalResults"));
				model.addAttribute("isTheLast",(String)session.getAttribute(search.getSearchKeyword()+"IsTheLast"));
			}else {
				map = eventService.getEventList(search, requestPageToken, stubhubKey);
				list = (List<StubhubEvent>)map.get("eventList");
				int totalResult = (Integer)map.get("totalResults");
				if (totalResult != 0 && list != null) {
					list = (List<StubhubEvent>)(eventService.translate("en", "ko", null,list)).get("result");	
					session.setAttribute( search.getSearchKeyword()+requestPageToken, list);
					session.setAttribute( search.getSearchKeyword()+requestPageToken+"TotalResults", (Integer)map.get("totalResults"));
					model.addAttribute("totalResults",(Integer)map.get("totalResults"));
				}			
			}
		}else {
			search.setSearchKeyword(((String)eventService.translate("ko", "en", search.getSearchKeyword(),null).get("result")));
			map = eventService.getEventList(search, requestPageToken, stubhubKey);
			list = (List<StubhubEvent>)map.get("eventList");
			int totalResult = (Integer)map.get("totalResults");
			if (totalResult != 0 && list != null) {
				list = (List<StubhubEvent>)(eventService.translate("en", "ko", null,list)).get("result");	
				model.addAttribute("totalResults",(Integer)map.get("totalResults"));
			}			
		}
		
		if (map != null) {
			if(((String)map.get("isTheLast")).equals("true")) {
				System.out.println("*****************map.get(\"isTheLast\") => true");
				model.addAttribute("isTheLast", "true");
				session.setAttribute(search.getSearchKeyword()+"IsTheLast", "true");
			}else {
				model.addAttribute("isTheLast", "false");
				session.setAttribute(search.getSearchKeyword()+"IsTheLast", "false");
			}
		}
		model.addAttribute("eventList",list);
		model.addAttribute("search", search);
		model.addAttribute("requestPageToken",1);				
 
		return "forward:/event/listEvent.jsp";
	}
	
	@RequestMapping(value="getEvent")
	public String getEvent(@RequestParam String category, @ModelAttribute("event") Event event, Model model) throws Exception {
		System.out.println("===============getEvent===============");
		System.out.println("category : "+category+","+event);
		int viewCount = 0;
		Search search = new Search();
		String eventName = event.getEventName();
		List<Event> eventListByName = eventService.getEventByName(eventName);
		System.out.println(eventListByName);
		
		if (eventListByName.isEmpty()) {
			System.out.println("================eventListByName.isEmpty()================");
			search.setSearchCondition("2");
			search.setSearchKeyword(eventName);
			List<StubhubEvent> list = (List<StubhubEvent>)eventService.getEvent(search, "0", stubhubKey).get("eventList");
			System.out.println("#################list size : "+list.size());
			for (StubhubEvent stubhubEvent : list) {
				System.out.println("============for문============");
				System.out.println("stubhubEvent : "+stubhubEvent);
				stubhubEvent.setCategoryTwoEng(category.toLowerCase());
				stubhubEvent.setKoLocation(event.getKoLocation());
				stubhubEvent.setKoName(event.getKoName());
				eventService.addEvent(stubhubEvent);
			}
			eventListByName = eventService.getEventByName(eventName);
			model.addAttribute("totalResults", eventListByName.size());	
		}else {

			for (Event e : eventListByName) {
				category = e.getCategoryTwoEng();
				search.setSearchCondition("0");
				search.setSearchKeyword(e.getEventId());
				e.setTicketLowestPrice(((SellProb)ticketService.getTicketList(search).get("sellProb")).getLowPrice());
				e.setTotalTicketCount(((SellProb)ticketService.getTicketList(search).get("sellProb")).getTotalCount());
				viewCount = e.getViewCount();
				event.setKoName(e.getKoName());
				event.setKoLocation(e.getKoLocation());
			}						
			model.addAttribute("eventImage", eventListByName.get(0).getEventImage());
			model.addAttribute("totalResults", eventListByName.size());	
		}
		eventService.updateEventViewCount(viewCount+1, eventName);
		
		model.addAttribute("eventListByName", eventListByName);
		model.addAttribute("eventName", eventName);
		model.addAttribute("event", event);
		model.addAttribute("category", category);
		model.addAttribute("viewCount", viewCount);
		
		return "forward:/event/getEvent.jsp";
	}
	
	@RequestMapping(value="getEventTicketList")
	public String getEventTicketList(@RequestParam String eventIds, @ModelAttribute("event") Event e, Model model) throws Exception {
		System.out.println("===============getEventTicketList===============");
		
		Search search = new Search();
		search.setSearchCondition("0");
		search.setSearchKeyword(eventIds);
		
		Map<String, Object> map = ticketService.getTicketList(search);
		
		List<Ticket> ticketList = (List<Ticket>)map.get("list");
		SellProb sellProb = (SellProb)map.get("sellProb");
		
		List<String> list = null;
		Event event = eventService.getEvent(eventIds);
		
		if (event != null) {
			list = eventService.getYoutubeIdList(event.getEventName());
		}
		
		List<String> youtubeList = eventService.getYoutubeIdList(event.getEventName());
		if (youtubeList != null && youtubeList.size() != 0 ) {
			model.addAttribute("videoId", youtubeList.get(0));
			model.addAttribute("videoIdList", youtubeList);
		}else {
			model.addAttribute("videoId", "ZfRaUS9cixo");//기본동영상
		}
		search.setSearchCondition("1");
		
		model.addAttribute("interestedCount",  eventService.getInterestedByUserCount(search));
		model.addAttribute("event", event);
		model.addAttribute("ticketList", ticketList);
		model.addAttribute("lowPrice", sellProb.getLowPrice());
		model.addAttribute("totalTicketCount",sellProb.getTotalCount());		
		model.addAttribute("youtubeIdList",list);
		
		return "forward:/event/listEventTicket.jsp";		
	}
	
	@RequestMapping(value="getInterestedEventList")
	public String getInterestedEventList(HttpSession session, Model model) throws Exception {
		System.out.println("===============getInterestedEventList===============");
		
		User user = (User)session.getAttribute("user");
		String userId = user.getUserId();
		List<Event> list = eventService.getInterestedEventList(userId);
		
		for (Event event : list) {
			Search search = new Search();
			search.setSearchCondition("0");
			search.setSearchKeyword(event.getEventId());
			event.setTicketLowestPrice(((SellProb)ticketService.getTicketList(search).get("sellProb")).getLowPrice());
			event.setTotalTicketCount(((SellProb)ticketService.getTicketList(search).get("sellProb")).getTotalCount());
		}				
		
		model.addAttribute("interestedEventList", list);
		if (list != null) {
			model.addAttribute("interestedEventListCount", list.size());
		}		
		
		return "forward:/event/listInterestedEvent.jsp";		
	}
	
	@RequestMapping(value="getEventManage")
	public String getEventManage(Model model) throws Exception {
		System.out.println("===============getEventManage===============");
		
		List<RecommEvent> recommEventlist = eventService.getRecommendedEventList();
		List<Category> categorylist = eventService.getCategoryList();
		
		model.addAttribute("recommEventlist", recommEventlist);
		model.addAttribute("recommEventlistSize", recommEventlist.size());
		model.addAttribute("categorylist", categorylist);
		
		return "forward:/event/getEventManage.jsp";		
	}
	
//	@RequestMapping(value="addYoutubeVideo", method=RequestMethod.GET)
//	public String addYoutubeVideo(@RequestParam String eventName,Model model) throws Exception {
//		System.out.println("===============addYoutubeVideo===============");		
//		Map<String,Object> map = eventService.getYoutubeList(new Search(), null, youtubeKey);
//
//		model.addAttribute("youtubeList", (List<YoutubeVideo>)map.get("youtubeList"));
//		model.addAttribute("nextPageToken",  (String)map.get("nextPageToken"));
//		model.addAttribute("prevPageToken",  (String)map.get("prevPageToken"));
//		model.addAttribute("totalResults",  (Integer)map.get("totalResults"));
//		model.addAttribute("eventName",  eventName);
//		
//		return "forward:/event/addYoutubeVideoGET.jsp";
//	}
	
//	@RequestMapping(value="addYoutubeVideo", method=RequestMethod.POST)
//	public String addYoutubeVideo(@RequestParam String requestPageToken,@RequestParam String eventName,@ModelAttribute("search") Search search,Model model) throws Exception {
//		System.out.println("===============addYoutubeVideo===============");
//		Map<String,Object> map = eventService.getYoutubeList(search, requestPageToken, youtubeKey);
//
//		model.addAttribute("youtubeList", (List<YoutubeVideo>)map.get("youtubeList"));
//		model.addAttribute("nextPageToken",  (String)map.get("nextPageToken"));
//		model.addAttribute("prevPageToken",  (String)map.get("prevPageToken"));
//		model.addAttribute("totalResults",  (Integer)map.get("totalResults"));
//		model.addAttribute("eventName",  eventName);
//		model.addAttribute("requestPageToken",  requestPageToken);
//		
//		return "forward:/event/addYoutubeVideoGET.jsp";
//	}
	
//	@RequestMapping(value="getYoutubePlayer")
//	public String getYoutubePlayer( @ModelAttribute("youtubeVideo") YoutubeVideo youtubeVideo,@RequestParam String requestPageToken,
//			@RequestParam String eventName,@RequestParam String searchKeyword,Model model) throws Exception {
//		System.out.println("===============getYoutubePlayer===============");
//		System.out.println(youtubeVideo);
//		
//		System.out.println("eventName ; "+eventName);
//		model.addAttribute("youtubeVideo", youtubeVideo);
//		model.addAttribute("requestPageToken", requestPageToken);
//		model.addAttribute("eventName", eventName);
//		model.addAttribute("searchKeyword", searchKeyword);
//		
//		return "forward:/event/getYoutubePlayer.jsp";
//	}
	
//	@RequestMapping(value="deleteInterestedEventAll")
//	public String deleteInterestedEventAll(HttpSession session) throws Exception {
//		System.out.println("===============deleteInterestedEventAll===============");
//		
//		User user = (User)session.getAttribute("user");
//		String userId = user.getUserId();
//		eventService.deleteInterestedEventAll(userId);
//	
//		return "forward:/event/listInterestedEvent.jsp";
//	}
	
//	@RequestMapping(value="deleteInterestedEvent")
//	public String deleteInterestedEvent(@RequestParam String eventId, HttpSession session,Model model) throws Exception {
//		System.out.println("===============deleteInterestedEvent===============");
//		System.out.println(eventId);
//		User user = (User)session.getAttribute("user");
//		String userId = user.getUserId();
//		String[] arr = null;
//		
//		if(eventId.contains(",")) {
//			arr = eventId.split(",");
//			for (String string : arr) {
//				eventService.deleteInterestedEvent(string, userId);
//			} 
//		}		
//		List<Event> list = eventService.getInterestedEventList(userId);		
//		for (Event event : list) {
//			Search search = new Search();
//			search.setSearchCondition("0");
//			search.setSearchKeyword(event.getEventId());
//			event.setTicketLowestPrice(((SellProb)ticketService.getTicketList(search).get("sellProb")).getLowPrice());
//			event.setTotalTicketCount(((SellProb)ticketService.getTicketList(search).get("sellProb")).getTotalCount());
//		}				
//		
//		model.addAttribute("interestedEventList", list);
//		if (list != null) {
//			model.addAttribute("interestedEventListCount", list.size());
//		}
//		
//		return "forward:/event/listInterestedEvent.jsp";
//	}
}