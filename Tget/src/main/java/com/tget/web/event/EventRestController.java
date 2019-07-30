package com.tget.web.event;


import java.io.BufferedReader;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
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
import com.tget.service.event.domain.StubhubEvent;
import com.tget.service.event.domain.YoutubeVideo;


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
	@RequestMapping(value="rest/getEventList")
	public Map<String,Object> getEventList(@ModelAttribute("search") Search search,@RequestParam String requestPageToken,HttpSession session,Model model) throws Exception {
		System.out.println("===============rest/getEventList===============");
		System.out.println("search:"+search);
		
		Map<String,Object> map = null;
		Map<String,Object> map2 = new HashMap<String,Object>();
		List<StubhubEvent> list = null;
		if (search.getSearchCondition().equals("0")) {
//			model.addAttribute("category", search.getSearchKeyword());
			map2.put("category", search.getSearchKeyword());
			
			List<StubhubEvent> tempList = (List<StubhubEvent>)session.getAttribute(search.getSearchKeyword()+requestPageToken);
			
			if (tempList != null) {
				
				list = tempList;				
				map2.put("totalResults",(Integer)session.getAttribute(search.getSearchKeyword()+"TotalResults"));
//				model.addAttribute("totalResults",(Integer)session.getAttribute(search.getSearchKeyword()+"TotalResults"));
			}else {
				map = eventService.getEventList(search, requestPageToken, stubhubKey);
				list = (List<StubhubEvent>)map.get("eventList");
				int totalResult = (Integer)map.get("totalResults");
				if (totalResult != 0 && list != null) {
					list = (List<StubhubEvent>)(eventService.translate("en", "ko", null,list)).get("result");	
					session.setAttribute( search.getSearchKeyword()+requestPageToken, list);
					session.setAttribute( search.getSearchKeyword()+requestPageToken+"TotalResults", (Integer)map.get("totalResults"));
					map2.put("totalResults",(Integer)map.get("totalResults"));
				}			
//				list = (List<StubhubEvent>)map.get("eventList");
//				list = (List<StubhubEvent>)(eventService.translate("en", "ko", null, (List<StubhubEvent>)map.get("eventList"))).get("result");
				
			}
		}else {
			search.setSearchKeyword(((String)eventService.translate("ko", "en", search.getSearchKeyword(),null).get("result")));
			map = eventService.getEventList(search, requestPageToken, stubhubKey);
			list = (List<StubhubEvent>)map.get("eventList");
			int totalResult = (Integer)map.get("totalResults");
			if (totalResult != 0 && list != null) {
				list = (List<StubhubEvent>)(eventService.translate("en", "ko", null,list)).get("result");	
//				model.addAttribute("totalResults",(Integer)map.get("totalResults"));
				map2.put("totalResults",(Integer)map.get("totalResults"));
			}			
		}
		
//		model.addAttribute("eventList",list);
//		model.addAttribute("search", search);
//		model.addAttribute("requestPageToken",requestPageToken);				

		
		map2.put("eventList",list);
		map2.put("search", search);
		map2.put("requestPageToken", requestPageToken);
		
		return map2;
	}
	
	
	
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
	public Map<String,Object> getPopularEventList() throws Exception {
		System.out.println("===============rest/getPopularEventList===============");
		
		Map<String,Object> map = new HashMap<String,Object>();
		List<Event> list =  eventService.getPopularEventList();
		List<String> eventNameList = new ArrayList<String>();
		List<String> eventImageList = new ArrayList<String>();
		List<String> koNameList = new ArrayList<String>();
		
		for (Event event : list) {
			if (eventNameList.size()==0) {
				eventNameList.add(event.getEventName());
				eventImageList.add(event.getEventImage());
				koNameList.add(event.getKoName());
			}else if(eventNameList.size()<3){
				for (int i = 0; i < eventNameList.size(); i++) {
					if (eventNameList.get(i).equals(event.getEventName())) {
						break;
					} else if ((i==eventNameList.size()-1) &&( ! eventNameList.get(i).equals(event.getEventName()))) {
						eventNameList.add(event.getEventName());
						eventImageList.add(event.getEventImage());
						koNameList.add(event.getKoName());
					}
				}
			}else if(eventNameList.size()==3){
				break;
			}
		}
		
//		map.put("popularEventList", eventService.getPopularEventList());
		map.put("eventNameList",eventNameList);
		map.put("eventImageList",eventImageList);
		map.put("koNameList",koNameList);
		return map;
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
			List<String> eventTimeList = new ArrayList<String>();
			
			for (Event event : list) {
				if (eventIdList.size()==0) {
					eventIdList.add(event.getEventId());
					eventTimeList.add(event.getEventDate()+" "+event.getEventTimeStr());
				}else {
					for (int i = 0; i < eventIdList.size(); i++) {
						if (eventIdList.get(i).equals(event.getEventId())) {
							break;
						} else if ((i==eventIdList.size()-1) &&( ! eventIdList.get(i).equals(event.getEventId()))) {
							eventIdList.add(event.getEventId());
							eventTimeList.add(event.getEventDate()+" "+event.getEventTimeStr());
						}
					}
				}
			}
			System.out.println(eventIdList);
			map.put("interestedEventList", eventIdList);
			map.put("interestedEventTimeList", eventTimeList);
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
	
	@RequestMapping(value="rest/addEventImage")
	public Map<String,Object> addEventImage(@RequestParam(value = "file", required = false) MultipartFile multipartFile,@ModelAttribute("event") Event event) throws Exception {
		System.out.println("===============rest/addEventImage===============");
		System.out.println(event);
		System.out.println(multipartFile.getOriginalFilename( ));
		File file = null;
		
		if(!multipartFile.isEmpty()) {
			event.setEventImage(multipartFile.getOriginalFilename( ));
					
			file = new File(uploadPath,multipartFile.getOriginalFilename());
			FileCopyUtils.copy(multipartFile.getBytes(), file);
			
		}
		eventService.addEventImage(event.getEventImage(), event.getEventName());
		
		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("eventListByName", eventService.getEventByName(event.getEventName()));
		map.put("eventImage", event.getEventImage());
		map.put("msg", "OK");
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
	
	@RequestMapping(value="rest/getRecommendedEventCount")
	public Map<String,Object> getRecommendedEventCount() throws Exception {
		System.out.println("===============rest/getRecommendedEventCount===============");
		
		Map<String,Object> map = new HashMap<String,Object>();
		List<RecommEvent> list = eventService.getRecommendedEventList();
		
		map.put("recommendedEventCount", list.size());
		
		System.out.println("rest/getRecommendedEventCount map - "+map);
		return map;		
	}
	
	@RequestMapping( value="rest/kakaoSendToMe")
//	public Map<String,Object> kakaoSendToMe(@ModelAttribute("user") User user) throws Exception{		
	public Map<String,Object> kakaoSendToMe(HttpServletRequest request,HttpSession session) throws Exception{			
		System.out.println("===========rest/kakaoSendToMe=============");
		String requestUrl = null;
		
		User user = (User)session.getAttribute("user");
		System.out.println((requestUrl = (String)request.getParameter("requestUrl"))+"\n");
		System.out.println(user);
		Event event = eventService.getEvent((String)request.getParameter("eventId"));
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String url= 	"https://kapi.kakao.com/v2/api/talk/memo/default/send";
//		String url= 	"https://kapi.kakao.com/v2/api/talk/memo/scrap/send";
				
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		httpPost.setHeader("Authorization", "Bearer "+user.getKakaoToken());
		
		JSONObject content = new JSONObject();
		content.put("title",	event.getKoName());
		content.put("description",	event.getEventDate()+", "+event.getEventTimeStr()+"\n"+event.getKoLocation());
		content.put("image_url",	"https://postfiles.pstatic.net/MjAxOTA3MjVfMTc5/MDAxNTY0MDIyNDI1MDAy.JrJIonZVX34tFj-Wu6EjNou_gYtFjwhhVbUTOVr9xUMg.88hG1dy_KjkoiSrxYar_nWFUOKu2gPZVcza-InffitEg.PNG.youree1226/logo.png?type=w580");
//		if (event.getEventImage() != null) {
//			content.put("image_url",	"http://192.168.0.82:8080/resources/images/uploadFiles/"+event.getEventImage());
//		}else {
//			content.put("image_url",	"http://192.168.0.82:8080/resources/images/logo.png");
//		}		
		content.put("image_width",	400);
		content.put("image_height",	200);
		
		JSONObject link = new JSONObject();
		link.put("web_url",	requestUrl);
		link.put("mobile_web_url",	requestUrl);
		link.put("android_execution_params",	requestUrl);
		link.put("ios_execution_params",requestUrl);
		
		content.put("link", link);
		
		JSONObject social = new JSONObject();
//		social.put("like_count", event.getInterestedNum());
		social.put("view_count", event.getViewCount());
		
		JSONObject json = new JSONObject();
		json.put("object_type", "feed");
		json.put("content", content);
		json.put("social", social);

		String parameter = "template_object="+json;		
		//http://192.168.0.82:8080/resources/images/uploadFiles/EXO-LOVE%20SHOT%20TEASER00.jpg

//		String parameter = "request_url=http://192.168.0.82:8080";
//		String parameter = "request_url=http://127.0.0.1:8080";
		System.out.println("parameter : "+parameter);

		HttpEntity httpEntity01 = new StringEntity(parameter,"utf-8");
		
		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		System.out.println(httpResponse);
		System.out.println();

		HttpEntity httpEntity = httpResponse.getEntity();

		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
	
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		System.out.println(jsonobj);

		
		return null;
	}
	
	@RequestMapping(value="rest/addRecommendedEvent")
	public Map<String,Object> addRecommendedEvent(@RequestParam(value = "file", required = false) MultipartFile multipartFile,@ModelAttribute("recommEvent") RecommEvent recommEvent) throws Exception {
		System.out.println("===============rest/addRecommendedEvent POST===============");
		Map<String,Object> map = new HashMap<String,Object>();
		
		System.out.println(multipartFile.getOriginalFilename( ));
		File file = null;
				
		if(!multipartFile.isEmpty()) {
			recommEvent.setVideoName(multipartFile.getOriginalFilename( ));
					
			file = new File(videoPath,multipartFile.getOriginalFilename());
			FileCopyUtils.copy(multipartFile.getBytes(), file);
			
		}
		List<RecommEvent> list = eventService.getRecommendedEventList();
		if (list != null && list.size() !=0) {
			for (int i=0; i<list.size(); i++) {
				if(list.get(i).getEventName().equals(recommEvent.getEventName())) {
					break;
				}else if( i == (list.size()-1) && ! list.get(i).getEventName().equals(recommEvent.getEventName())) {
					eventService.addRecommendedEvent(recommEvent);
				}
			}	
		}else {
			eventService.addRecommendedEvent(recommEvent);
		}
		
		System.out.println("recommEventNo - "+recommEvent.getRecommEventNo());
		
//		eventService.addRecommendedEvent(recommEvent);
		System.out.println(recommEvent);
		map.put("recommEvent", recommEvent);
		map.put("videoName", recommEvent.getVideoName());
//		model.addAttribute("recommEvent",recommEvent);
//		model.addAttribute("videoName",recommEvent.getVideoName());
//		model.addAttribute("file",file);
		return map;
	}
	
//	@RequestMapping(value="rest/updateRecommendedEvent", method=RequestMethod.GET)
//	public String updateRecommendedEvent(@RequestParam int recommEventNo, Model model) throws Exception {
//		System.out.println("===============rest/updateRecommendedEvent GET===============");
//		System.out.println(recommEventNo);
////		eventService.getRecommendedEvent(recommEventNo);
//		model.addAttribute("recommEvent",eventService.getRecommendedEvent(recommEventNo));
//		return "forward:/event/addRecommVideoGET.jsp";
//	}	
	
	@RequestMapping(value="rest/updateRecommendedEvent")
	public Map<String,Object> updateRecommendedEvent(@RequestParam(value = "file", required = false) MultipartFile multipartFile,@ModelAttribute("recommEvent") RecommEvent recommEvent) throws Exception {
		System.out.println("===============rest/updateRecommendedEvent===============");
		Map<String,Object> map = new HashMap<String,Object>();
		System.out.println(multipartFile.getOriginalFilename( ));
		File file = null;
				
		if(!multipartFile.isEmpty()) {
			recommEvent.setVideoName(multipartFile.getOriginalFilename( ));
					
			file = new File(videoPath,multipartFile.getOriginalFilename());
			FileCopyUtils.copy(multipartFile.getBytes(), file);
			
		}
		eventService.updateRecommendedEvent(recommEvent);
		
		System.out.println(recommEvent);
		map.put("recommEvent", eventService.getRecommendedEvent(recommEvent.getRecommEventNo()));
//		map.put("recommEventlist", eventService.getRecommendedEventList());
		map.put("videoName", recommEvent.getVideoName());

		return map;
	}
	
	
	@RequestMapping(value="rest/addYoutubeVideo")
	public Map<String,Object> addYoutubeVideo(@RequestParam String requestPageToken,@RequestParam String eventName,@ModelAttribute("search") Search search,Model model) throws Exception {
		System.out.println("===============rest/addYoutubeVideo===============");
		
		Map<String,Object> map = eventService.getYoutubeList(search, requestPageToken, youtubeKey);

		model.addAttribute("youtubeList", (List<YoutubeVideo>)map.get("youtubeList"));
		model.addAttribute("nextPageToken",  (String)map.get("nextPageToken"));
		model.addAttribute("prevPageToken",  (String)map.get("prevPageToken"));
		model.addAttribute("totalResults",  (Integer)map.get("totalResults"));
		model.addAttribute("eventName",  eventName);
		model.addAttribute("requestPageToken",  requestPageToken);
		
		
		return null;
	}
}