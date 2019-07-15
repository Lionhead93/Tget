package com.tget.service.event.impl;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.tget.common.domain.Search;
import com.tget.service.event.domain.Category;
import com.tget.service.event.domain.Event;
import com.tget.service.event.domain.RecommEvent;
import com.tget.service.event.domain.StubhubEvent;
import com.tget.service.event.domain.StubhubSearchList;
import com.tget.service.event.domain.YoutubeVideo;
import com.tget.service.event.domain.YoutubeVideoList;
import com.tget.service.user.domain.User;
import com.tget.service.event.EventDao;

@Repository("eventDaoImpl")
public class EventDaoImpl implements EventDao {
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public EventDaoImpl(){
		System.out.println(this.getClass());
	}


	///M
	public void insertEvent(StubhubEvent event) throws Exception{
		sqlSession.insert("EventMapper.insertEvent", event);
	}
	
	
	public Event selectEvent(String eventId) throws Exception{
//		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("eventId", eventId);
//		map.put("searchKeyword", "eventId");
		return sqlSession.selectOne("EventMapper.selectEventById", eventId);
	}
	
	
	public List<Event> selectListEvent(String eventName) throws Exception{
//		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("eventName", eventName);
//		map.put("searchKeyword", "eventName");
//		//return sqlSession.selectList("EventMapper.selectListEvent", map);
		return sqlSession.selectList("EventMapper.selectEventByName", eventName);
	}
	
	
	public void updateEvent(Search search,String eventName) throws Exception{ 
		//searchCondition는 0이면 viewCount, 1이면 imageName;
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("search", search);
		map.put("eventName", eventName);
		sqlSession.update("EventMapper.updateEvent", map);
	}
	
	
	public List<Event> selectListInterestedEvent(String userId) throws Exception{
		return sqlSession.selectList("EventMapper.selectListInterestedEvent", userId);
	}
	
	
	public void insertInterestedEvent(String eventId, String userId) throws Exception{
		Event event = this.selectEvent(eventId);
		event.setUserId(userId);
		
		sqlSession.insert("EventMapper.insertInterestedEvent", event);
	}
	
	
	public void deleteInterestedEvent(String eventId, String userId) throws Exception{
		Event event = new Event();
		event.setUserId(userId);
		event.setEventId(eventId);
		sqlSession.delete("EventMapper.deleteInterestedEvent", event);
	}
	
	
	public void insertYoutubeVideo(String youtubeId, String eventName) throws Exception{ 
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("youtubeId",youtubeId);
		map.put("eventName", eventName);
		sqlSession.insert("EventMapper.insertYoutubeVideo", map);
	}
	
	
	public void deleteYoutubeVideo(int youtubeNo) throws Exception{
		sqlSession.delete("EventMapper.deleteYoutubeVideo",youtubeNo);
	}
	
	
	public List<String> selectListYoutubeId(String eventName) throws Exception{
		return sqlSession.selectList("EventMapper.selectListYoutubeId",eventName);
	}
	
	
	public List<Event> selectListPopularEvent() throws Exception{ 
		return sqlSession.selectList("EventMapper.selectListPopularEvent");
	}
	
	
	public List<RecommEvent> selectListRecommendedEvent() throws Exception{ 
		Search search = new Search();
		search.setSearchCondition("0");
		return sqlSession.selectList("EventMapper.selectRecommendedEvent",search);
	}
	
	
	public RecommEvent selectRecommendedEvent(int recommEventNo) throws Exception{
		Search search = new Search();
		search.setSearchCondition("1");
		search.setSearchKeyno(recommEventNo);
		return sqlSession.selectOne("EventMapper.selectRecommendedEvent", search);
	}
	
	
	public void insertRecommendedEvent(RecommEvent recommEvent) throws Exception{ 
		sqlSession.insert("EventMapper.insertRecommendedEvent", recommEvent);
	}
	
	
	public void updateRecommendedEvent(RecommEvent recommEvent) throws Exception{
		sqlSession.update("EventMapper.updateRecommendedEvent", recommEvent);
	}
	
	
	public void deleteRecommendedEvent(int recommEventNo) throws Exception{ 
		sqlSession.delete("EventMapper.deleteRecommendedEvent",recommEventNo);
	}
	
	
	public void insertCategoryTwo(Category category) throws Exception{ 
		sqlSession.insert("EventMapper.insertCategoryTwo",category);
	}
	
	
	public void updateCategoryTwo(Category category) throws Exception{ 
		sqlSession.update("EventMapper.updateCategoryTwo",category);
	}
	
	
	public List<Category> selectListCategory() throws Exception{
		return sqlSession.selectList("EventMapper.selectCategory");
	}
	
	
	public Category selectCategory(String categoryTwoEng) throws Exception{
//		Map<String,Object> map = new HashMap<String,Object>();
//		map.put("categoryTwoEng",categoryTwoEng);
		return sqlSession.selectOne("EventMapper.selectCategory", categoryTwoEng);
	}
	
	
	public void deleteCategoryTwo(String categoryTwoEng) throws Exception{
		sqlSession.delete("EventMapper.deleteCategoryTwo",categoryTwoEng);
	}
	
	
	public List<User> selectInterestedByUser(Search search) throws Exception{
		//searchCondition = 0이면  InterestedCategory, searchCondition = 1이면 InterestedEvent
		return sqlSession.selectList("EventMapper.selectInterestedByUser",search);
	}
	
	
	public void insertInterestedCategory(String categoryTwoEng, String userId) throws Exception{
		Event event = new Event();
		event.setCategoryTwoEng(categoryTwoEng);
		event.setUserId(userId);
		
		sqlSession.insert("EventMapper.insertInterestedEvent", event);
	}
	
	
	public int getEventListTotalCount(Search search, String requestPageToken, String apiKey) throws Exception{
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String url= 	"https://api.stubhub.com/sellers/search/events/v3?country=KR";
		
		if (search.getSearchCondition().equals("0")) {
			if (search.getSearchKeyword()!=null && search.getSearchKeyword()!="") {
				url+="&categoryName="+search.getSearchKeyword();
			}
		}else if(search.getSearchCondition().equals("1")) {
			if (search.getSearchKeyword()!=null && search.getSearchKeyword()!="") {
//				url+="&q="+search.getSearchKeyword();
				url+="&q="+search.getSearchKeyword().replace(" ", "%20");
			}
		}else if(search.getSearchCondition().equals("2")) {
			if (search.getSearchKeyword()!=null && search.getSearchKeyword()!="") {
				//url+="&name="+search.getSearchKeyword();
				url+="&q="+search.getSearchKeyword().replace(" ", "%20");
			}
		}
		url+="&start=0";
		
		System.out.println("getEventList URL - "+url+"\n");

		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Authorization","Bearer "+apiKey);
//		httpGet.setHeader("Authorization","Bearer tiY4GRmhcjvBYdRHhr8YmCrXOuSN");
		httpGet.setHeader("Referer","https://developer.stubhub.com/searchevent/apis/get/search/events/v3");
		
		HttpResponse httpResponse = httpClient.execute(httpGet);
//		System.out.println(httpResponse+"\n");

		HttpEntity httpEntity = httpResponse.getEntity();
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		ObjectMapper objectMapper = new ObjectMapper();
		StubhubSearchList stubhubSearchList = objectMapper.readValue(jsonobj.toString(), StubhubSearchList.class);

		return stubhubSearchList.getNumFound();
	}
	 
	
	public Map<String,Object> getEventList(Search search, String requestPageToken, String apiKey) throws Exception{
		
		int totalEventCount = this.getEventListTotalCount(search, requestPageToken, apiKey);		
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String url= 	"https://api.stubhub.com/sellers/search/events/v3?";
		
		if (totalEventCount > 500) {
			url += "rows="+500;
		}else {
			url += "rows="+totalEventCount;
		}
		
		if (search.getSearchCondition().equals("0")) {
			if (search.getSearchKeyword()!=null && search.getSearchKeyword()!="") {
				url+="&categoryName="+search.getSearchKeyword();
			}
		}else if(search.getSearchCondition().equals("1")) {
			if (search.getSearchKeyword()!=null && search.getSearchKeyword()!="") {
				url+="&q="+search.getSearchKeyword().replace(" ", "%20");
			}
		}else if(search.getSearchCondition().equals("2")) {
			if (search.getSearchKeyword()!=null && search.getSearchKeyword()!="") {
//				url+="&name="+search.getSearchKeyword();
				url+="&q="+search.getSearchKeyword().replace(" ", "%20");
			}
		}
		
		if (requestPageToken !=null && requestPageToken !="") {
			url+="&start="+requestPageToken;
		}
		
		url+="&country=KR";
		System.out.println("#####getEventList URL - "+url+"\n");

		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Authorization","Bearer "+apiKey);
//		httpGet.setHeader("Authorization","Bearer tiY4GRmhcjvBYdRHhr8YmCrXOuSN");
		httpGet.setHeader("Referer","https://developer.stubhub.com/searchevent/apis/get/search/events/v3");
		
		HttpResponse httpResponse = httpClient.execute(httpGet);
//		System.out.println(httpResponse+"\n");

		HttpEntity httpEntity = httpResponse.getEntity();
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		ObjectMapper objectMapper = new ObjectMapper();
		StubhubSearchList stubhubSearchList = objectMapper.readValue(jsonobj.toString(), StubhubSearchList.class);
		
		List<StubhubEvent> list = stubhubSearchList.getEvents();
//		List<StubhubEvent> returnList = new ArrayList<StubhubEvent>();
//		나중에 중복제거
	  

//		System.out.println("returnList : " +returnList);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("eventList", list);
		map.put("totalResults", list.size());
		
		return map;
	}
	
	
	public Map<String,Object> getYoutubeList(Search search, String requestPageToken, String apiKey) throws Exception{
		
		HttpClient httpClient = new DefaultHttpClient();
		String url= 	"https://www.googleapis.com/youtube/v3/search?"
				+ "part=snippet&type=video&key="+apiKey;		
//		String url= 	"https://www.googleapis.com/youtube/v3/search?"
//				+ "part=snippet&type=video&key=AIzaSyD64J615aLBGn7BP1BurRuewagN43Q0j8A";
		
		if (search.getSearchKeyword()!=null) {
			url += "&q="+search.getSearchKeyword();
		}		
		if (requestPageToken != null && requestPageToken !="") {
			url += "&pageToken="+requestPageToken;
		}

		System.out.println("#####getYoutubeList URL - "+url+"\n");

		// HttpGet : Http Protocol 의 GET 방식 Request
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");
		
		HttpResponse httpResponse = httpClient.execute(httpGet);
		
		System.out.println(httpResponse);
		System.out.println();

		HttpEntity httpEntity = httpResponse.getEntity();
		
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
	
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		System.out.println(jsonobj);
	
		ObjectMapper objectMapper = new ObjectMapper();

		YoutubeVideoList youtubeVideoList = objectMapper.readValue(jsonobj.toString(), YoutubeVideoList.class);
		System.out.println("youtubeVideoList : "+youtubeVideoList);
		
		List<YoutubeVideo> youtubeList = youtubeVideoList.getItems();
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("youtubeList", youtubeList);
		map.put("nextPageToken", youtubeVideoList.getNextPageToken());
		map.put("prevPageToken", youtubeVideoList.getPrevPageToken());
		map.put("totalResults", youtubeVideoList.getTotalResults());
		
		return map;
	}
	
	
}