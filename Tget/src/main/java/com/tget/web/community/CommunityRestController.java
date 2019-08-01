package com.tget.web.community;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.tget.common.domain.Search;
import com.tget.service.community.CommunityService;
import com.tget.service.community.domain.Content;
import com.tget.service.community.domain.Reply;
import com.tget.service.community.domain.Report;
import com.tget.service.community.domain.Weather;
import com.tget.service.event.EventService;
import com.tget.service.event.domain.Event;
import com.tget.service.transaction.TranService;
import com.tget.service.user.domain.User;

@RestController
@RequestMapping("/community/*")
public class CommunityRestController {
	
	///Field
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	//setter Method 구현 않음
	@Autowired
	@Qualifier("eventServiceImpl")
	private EventService eventService;
	
	public CommunityRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping( value="rest/getContent/{contentNo}", method=RequestMethod.GET ) //GET방식은 {prodNo}처럼 명시를 해줘야하지만
	public Content getContent( @PathVariable int contentNo ) throws Exception{//       POST방식의 경우 Body로 바로 가므로 명시하지않고 바로 접근이 가능
		
		System.out.println("/community/rest/getContent : GET");
				
		return communityService.getContent(contentNo);
	}

	
	@RequestMapping( value="rest/getRefund/{contentNo}", method=RequestMethod.GET ) 
	public Map getRefund( @PathVariable int contentNo ) throws Exception{
		
		System.out.println("/community/rest/getRefund : GET");
		
		Content content = communityService.getContent(contentNo);
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("content", content);
		
		return map;
	}
	
	@RequestMapping( value="rest/updateContent/{contentNo}", method=RequestMethod.GET ) 
	public Map<String,Object> updateRefund( @RequestBody Content content, @PathVariable int contentNo  ) throws Exception{
		
		System.out.println("/community/rest/updateContent : POST");
		
		communityService.getContent(contentNo);
		
		communityService.updateContent(content);
	
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("content", content);
		
		return map;
	}
	
	@RequestMapping(value="rest/updateGoodCount/{contentNo}", method=RequestMethod.GET)
	public Map<String, Object> updateGoodCount( @PathVariable("contentNo") int contentNo) throws Exception {

		System.out.println("community/updateGoodCount: GET");
		communityService.updateGoodCount(contentNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "good");
		
		return map;
	}
	
	@RequestMapping(value="rest/updateBadCount/{contentNo}", method=RequestMethod.GET)
	public Map<String, Object> updateBadCount( @PathVariable("contentNo") int contentNo) throws Exception {

		System.out.println("community/updateBadCount: GET");
		communityService.updateBadCount(contentNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "bad");
		
		return map;
	}
	// 날씨 안내
	@RequestMapping( value="rest/getSearchWeather/") 
	public Weather getSearchWeather( @RequestBody Weather weather ) throws Exception{
		
		System.out.println("/community/rest/getSearchWeather : ");
		//Event event = eventService.getEvent(eventId);
		
		weather = GetSearchWeather.getSearchweather(weather);
		
		//List<String> list = eventService.getAllLocation();
		
		return weather;
	}
	
//	@RequestMapping(value="rest/getSearchLoad/")
//	public List<String> getSearchLoad() throws Exception{
//		System.out.println("/community/rest/getSearchLoad: ");
//		
//		List<String> loadList = eventService.getAllLocation();
//		
//		return loadList;
//	}
	
	@RequestMapping(value="rest/addReply/", method=RequestMethod.POST)
	public Reply addReply(@RequestBody Reply reply, HttpSession session) throws Exception {

		System.out.println(" ============================== rest addReply ==================================");

		User user = (User) session.getAttribute("user");
		
		// Set User
		reply.setUserId(user.getUserId());
		reply.setUserNickName(user.getNickName());
		//reply.setProfile(user.getProfile());
		
		// Set Code
		//reply.setBoardCode(boardCode);
		communityService.addReply(reply);
		
		reply = communityService.getReply(reply.getReplyNo());
		
		return reply;
	}
	
	@RequestMapping("rest/getReply/{replyNo}")
	public Reply getReply(@PathVariable("replyNo") int replyNo) throws Exception {

		System.out.println(" ============================== rest getReply ==================================");

		Reply reply = communityService.getReply(replyNo);

		return reply;
	}
	
	@RequestMapping( value="rest/updateReply/", method=RequestMethod.POST)
	public Reply updateReply(@RequestBody Reply reply, HttpSession session) throws Exception {

		System.out.println(" ============================== rest updateComment ==================================");
		
		User user = (User)session.getAttribute("user");
		
		reply.setUserId(user.getUserId());
		reply.setUserNickName(user.getNickName());
		//reply.setBoardCode(boardCode);
		
		System.out.println(" reply : " + reply );
		
		communityService.updateReply(reply);
		
		reply = communityService.getReply(reply.getReplyNo());
		
		return reply;
	}
	
	@RequestMapping( value="rest/deleteReply/{replyNo}", method=RequestMethod.POST)
	public int deleteReply(@PathVariable int replyNo) throws Exception {

		System.out.println(" ============================== rest deleteReply ==================================");
		
		System.out.println(" replyNo : " + replyNo );
		communityService.deleteReply(replyNo);
		
		return replyNo;
	}
	
	
//	@RequestMapping( value="json/updateLikeCnt/{commentNo}/{check}", method=RequestMethod.POST)
//	public Comment updateLikeCnt(@PathVariable("commentNo") int commentNo, @PathVariable("check") String check, HttpSession session) throws Exception {
//
//		System.out.println(" ============================== rest updateLikeCnt ==================================");
//		
//		System.out.println("commentNo : " + commentNo);
//		System.out.println("check : " + check);
//		
//		User user = (User) session.getAttribute("user");
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		map.put("commentNo", commentNo);
//		
//		if(check.equals("plus")) {
//			map.put("check", check);
//		} else {
//			map.put("check", check);
//		}
//
//		commentService.updateLikeCnt(map);
//		
//		Comment comment = new Comment();
//		comment.setCommentNo(commentNo);
//		
//		Interest interest = new Interest();
//		interest.setBoardCode(boardCode);
//		interest.setInterestComment(comment);
//		interest.setInterestId(user);
//
//		interestService.addInterest(interest);
//		
//		comment = commentService.getComment(commentNo);
//		
//		return comment;
//	}
//	
//	@RequestMapping( value="json/check/{commentNo}/{id}", method=RequestMethod.POST)
//	public int check(@PathVariable("commentNo") int commentNo, @PathVariable("id") String checkId) throws Exception {
//
//		System.out.println(" ============================== rest updateLikeCnt ==================================");
//		
//		System.out.println("commentNo : " + commentNo);
//		System.out.println("id : " + checkId);
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		map.put("id",checkId);
//		map.put("searchNo",commentNo);
//		map.put("searchType","comment");
//		map.put("boardCode",boardCode);
//		
//		int result = interestService.getInterestCheck(map);
//		
//		return result;
//	}
//	
	@RequestMapping( value="rest/getReplyList/{replyNo}/{currentPage}", method=RequestMethod.POST)
	public Map<String, Object> getReplyList(@PathVariable("replyNo") int replyNo, @ModelAttribute("search") Search search, @PathVariable("currentPage") int currentPage) throws Exception {
		
		System.out.println(" ============================== rest listComment ==================================");
		
		if ( search.getCurrentPage() == 0 ) {
			search.setCurrentPage(1);
		}
		
		search.setPageSize(5);
		
		Map<String, Object> map = new HashMap<String, Object>();

		System.out.println("replyNo :" + replyNo);
		
		
		Map<String, Object> replyMap = communityService.getReplyList(replyNo);
	
		map.put("list", replyMap.get("list"));
		map.put("totalCount", map.get("totalCount"));
		map.put("search",search);
		
		return map;
	}
}
