package com.tget.service.event.impl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
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
import com.tget.service.ticket.domain.Ticket;
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
		return sqlSession.selectOne("EventMapper.selectEventById", eventId);
	}
	
	
	public List<Event> selectListEvent(String eventName) throws Exception{
		return sqlSession.selectList("EventMapper.selectEventByName", eventName);
	}
	
	public void updateEvent(Search search,String eventName) throws Exception{ 
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
	
	public void deleteYoutubeVideo(Map<String,Object>  map) throws Exception{
		sqlSession.delete("EventMapper.deleteYoutubeVideo",map);
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
		List<RecommEvent> list = sqlSession.selectList("EventMapper.selectRecommendedEvent",search);
		List<RecommEvent> returnList = new ArrayList<RecommEvent>();
		
		if (list != null && list.size() !=0) {
			for (RecommEvent event : list) {
				if (returnList.size()==0) {
					returnList.add(event);
				}else {
					for (int i = 0; i < returnList.size(); i++) {
						if (returnList.get(i).getKoName().equals(event.getKoName())) {
							break;
						} else if ((i==returnList.size()-1) &&( ! returnList.get(i).getKoName().equals(event.getKoName()))) {
							returnList.add(event);
						}
					}
				}
			}
		}
		return returnList;
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
		return sqlSession.selectOne("EventMapper.selectCategory", categoryTwoEng);
	}
	
	public Category selectCategory(int categoryTwoNo) throws Exception{
		return sqlSession.selectOne("EventMapper.selectCategoryByNo", categoryTwoNo);
	}
	
	public void deleteCategoryTwo(String categoryTwoEng) throws Exception{
		sqlSession.delete("EventMapper.deleteCategoryTwo",categoryTwoEng);
	}	
	
	public List<String> selectInterestedByUser(Search search) throws Exception{
		return sqlSession.selectList("EventMapper.selectInterestedByUser",search);
	}
	
	public int selectInterestedByUserCount(Search search) throws Exception{
		return sqlSession.selectOne("EventMapper.selectInterestedByUserCount",search);
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
				url+="&categoryName="+search.getSearchKeyword().replace(" ", "%20");
			}
		}else if(search.getSearchCondition().equals("1")) {
			if (search.getSearchKeyword()!=null && search.getSearchKeyword()!="") {
				url+="&q="+search.getSearchKeyword().replace(" ", "%20");
			}
		}else if(search.getSearchCondition().equals("2")) {
			if (search.getSearchKeyword()!=null && search.getSearchKeyword()!="") {
				url+="&name="+search.getSearchKeyword().replace(" ", "%20");
			}
		}
		url+="&start=0";
		
		System.out.println("getEventListTotalCount URL - "+url+"\n");

		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Authorization","Bearer "+apiKey);
		httpGet.setHeader("Referer","https://developer.stubhub.com/searchevent/apis/get/search/events/v3");
		
		HttpResponse httpResponse = httpClient.execute(httpGet);

		HttpEntity httpEntity = httpResponse.getEntity();
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		ObjectMapper objectMapper = new ObjectMapper();
		StubhubSearchList stubhubSearchList = objectMapper.readValue(jsonobj.toString(), StubhubSearchList.class);

		if (stubhubSearchList != null) {
			return stubhubSearchList.getNumFound();
		}
		return 0;
	}
	 
	
	public Map<String,Object> getEventList(Search search, String requestPageToken, String apiKey) throws Exception{
		
		int totalEventCount = this.getEventListTotalCount(search, requestPageToken, apiKey);		
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String url= 	"https://api.stubhub.com/sellers/search/events/v3?sort=title%20desc";

		url+="&rows="+10;
		
		if (search.getSearchCondition().equals("0")) {
			if (search.getSearchKeyword()!=null && search.getSearchKeyword()!="") {
				url+="&categoryName="+search.getSearchKeyword().replace(" ", "%20");
			}
		}else if(search.getSearchCondition().equals("1")) {
			if (search.getSearchKeyword()!=null && search.getSearchKeyword()!="") {
				url+="&q="+search.getSearchKeyword().replace(" ", "%20");
			}
		}else if(search.getSearchCondition().equals("2")) {
			if (search.getSearchKeyword()!=null && search.getSearchKeyword()!="") {
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
		httpGet.setHeader("Referer","https://developer.stubhub.com/searchevent/apis/get/search/events/v3");
		
		HttpResponse httpResponse = httpClient.execute(httpGet);

		HttpEntity httpEntity = httpResponse.getEntity();
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		ObjectMapper objectMapper = new ObjectMapper();
		StubhubSearchList stubhubSearchList = objectMapper.readValue(jsonobj.toString(), StubhubSearchList.class);
		
		List<StubhubEvent> list = stubhubSearchList.getEvents();
		List<StubhubEvent> returnList = new ArrayList<StubhubEvent>();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("isTheLast", "false");
		if(requestPageToken!=null&&(!requestPageToken.equals(""))) {
			if (Integer.parseInt(requestPageToken)*10>=totalEventCount) {
				map.put("isTheLast", "true");
			}			
		}
		
		//중복제거
		for (StubhubEvent event : list) {
			if (returnList.size()==0) {
				returnList.add(event);
			}else {
				for (int i = 0; i < returnList.size(); i++) {
					if (returnList.get(i).getName().equals(event.getName())) {
						break;
					} else if((i==returnList.size()-1) &&( ! returnList.get(i).getName().equals(event.getName()))){
						returnList.add(event);
					}
				}
			}
		}

		map.put("eventList", returnList);
		map.put("totalResults", list.size());
		
		return map;
	}
	
	
	public Map<String,Object> getEvent(Search search, String requestPageToken, String apiKey) throws Exception{
		
		int totalEventCount = this.getEventListTotalCount(search, requestPageToken, apiKey);		
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String url= 	"https://api.stubhub.com/sellers/search/events/v3?sort=title";
		
		url+="&rows="+10;
		
		if (search.getSearchCondition().equals("0")) {
			if (search.getSearchKeyword()!=null && search.getSearchKeyword()!="") {
				url+="&categoryName="+search.getSearchKeyword().replace(" ", "%20");
			}
		}else if(search.getSearchCondition().equals("1")) {
			if (search.getSearchKeyword()!=null && search.getSearchKeyword()!="") {
				url+="&q="+search.getSearchKeyword().replace(" ", "%20");
			}
		}else if(search.getSearchCondition().equals("2")) {
			if (search.getSearchKeyword()!=null && search.getSearchKeyword()!="") {
				url+="&q="+search.getSearchKeyword().replace(" ", "%20");
			}
		}
		
		if (requestPageToken !=null && requestPageToken !="") {
			url+="&start="+requestPageToken;
		}
		
		url+="&country=KR";
		System.out.println("#####getEvent URL - "+url+"\n");

		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Authorization","Bearer "+apiKey);
		httpGet.setHeader("Referer","https://developer.stubhub.com/searchevent/apis/get/search/events/v3");
		
		HttpResponse httpResponse = httpClient.execute(httpGet);

		HttpEntity httpEntity = httpResponse.getEntity();
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		ObjectMapper objectMapper = new ObjectMapper();
		StubhubSearchList stubhubSearchList = objectMapper.readValue(jsonobj.toString(), StubhubSearchList.class);
		
		List<StubhubEvent> list = stubhubSearchList.getEvents();
//		System.out.println("returnList : " +returnList);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("eventList", list);
//		map.put("eventList", list);
//		map.put("totalResults", returnList.size());
//		map.put("totalResults", totalEventCount);
		map.put("totalResults", list.size());
		
		return map;
	}
	
	
	public Map<String,Object> getYoutubeList(Search search, String requestPageToken, String apiKey) throws Exception{
		
		HttpClient httpClient = new DefaultHttpClient();
		String url= 	"https://www.googleapis.com/youtube/v3/search?"
				+ "part=snippet&type=video&key="+apiKey;		
		
		if (search.getSearchKeyword() != null) {
			url += "&q="+search.getSearchKeyword().replaceAll(" ", "%20");
		}		
		if (requestPageToken != null && requestPageToken !="") {
			url += "&pageToken="+requestPageToken;
		}

		System.out.println("#####getYoutubeList URL - "+url+"\n");
		
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
	
	public void deleteInterestedEventAll(String userId) throws Exception{
		sqlSession.delete("EventMapper.deleteInterestedEventAll",userId);
	}	
	
	public String translate(String sourceLang, String targetLang,String queryText) throws Exception{
		System.out.println("==============translate(source,target,query)===============");
		
		Map<String, Object> map =  new HashMap<String, Object>();
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "https://translation.googleapis.com/language/translate/v2?key=AIzaSyBWmO_H-zGbKdEyVBLz_XiM21FbUDsWFKY";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Content-Type", "application/json");
		
		JSONObject json = new JSONObject();
		json.put("source", sourceLang); //en
		json.put("target", targetLang); //ko
		json.put("format", "text");
		json.put("q", queryText);
		
		HttpEntity httpEntity01 = new StringEntity(json.toString(),"utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
			
		HttpEntity httpEntity = httpResponse.getEntity();
		
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		JSONObject data = (JSONObject) jsonobj.get("data");
		JSONArray tran = (JSONArray) data.get("translations");
		JSONObject tranText = (JSONObject) tran.get(0);
		String result = (String) tranText.get("translatedText");
		System.out.println("result///////////////////////////"+result);
		
		return result;
	}
	
	
	public Map<String, Object> translate(String sourceLang, String targetLang, List<Event> list) throws Exception{
		System.out.println("==============translate(source,target,eventList)===============");
		Map<String, Object> map =  new HashMap<String, Object>();
		
		Event event = null; 
		String str = "";
		if (list != null && list.size() != 0) {
			for (int i=0; i<list.size(); i++) {
				event = list.get(i);
				event.setEventName(translate(sourceLang, targetLang, event.getEventName()));
				str = event.getEventLocation();
				event.setEventLocation(translate(sourceLang, targetLang, str));
				list.set(i, event);
			}
		}	
		map.put("result", list);
		return map;
	}
	
	public Map<String, Object> translate(String sourceLang, String targetLang,String queryText,List<StubhubEvent> list) throws Exception{
		System.out.println("==============translate(source,target,query,stubhubList)===============");
		Map<String, Object> map =  new HashMap<String, Object>();
		
		StubhubEvent stubhubEvent = null; 
		String str = "";
		if (queryText != null && queryText != "") {
			str = translate(sourceLang, targetLang, queryText);
			map.put("result", str);
		}else if (list != null && list.size() != 0) {
			for (int i=0; i<list.size(); i++) {
				stubhubEvent = (StubhubEvent)list.get(i);
				stubhubEvent.setKoName(translate(sourceLang, targetLang, stubhubEvent.getName()));
				if (stubhubEvent.getVenueName() != null) {
					stubhubEvent.setKoLocation(translate(sourceLang, targetLang, stubhubEvent.getVenueName()));
				}
					if (stubhubEvent.getPerformersName() != null) {
					stubhubEvent.setPerformersName(translate(sourceLang, targetLang, stubhubEvent.getPerformersName()));
				}				
				list.set(i, stubhubEvent);
			}
			map.put("result", list);
		}		
		
		return map;
	}
	
	public List<Event> selectAllLocation() throws Exception{
		List<Event> list = sqlSession.selectList("EventMapper.selectAllLocation");
		List<Event> returnList = new ArrayList<Event>();
		
		for (Event event : list) {
			if (returnList.size()==0) {
				returnList.add(event);
			}else {
				for (int i = 0; i < returnList.size(); i++) {
					if (returnList.get(i).getKoLocation().equals(event.getKoLocation())) {
						break;
					} else if((i==returnList.size()-1) &&( ! returnList.get(i).getKoLocation().equals(event.getKoLocation()))){
						returnList.add(event);
					}
				}
			}
		}		
		return returnList;
	}
	
	public String selectEventName(String koName) throws Exception{
		List<String> list = sqlSession.selectList("EventMapper.selectEventName",koName);
		if (list != null && list.size() !=0) {
			return list.get(0);
		}else {
			return null;
		}
	}
	
}