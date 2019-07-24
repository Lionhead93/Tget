package com.tget.service.event;

import java.util.List;
import java.util.Map;

import com.tget.service.event.domain.Category;
import com.tget.service.event.domain.Event;
import com.tget.service.event.domain.RecommEvent;
import com.tget.service.event.domain.StubhubEvent;
import com.tget.service.user.domain.User;
import com.tget.common.domain.Search;



//==> 회원관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface EventDao {

	public void insertEvent(StubhubEvent event) throws Exception;
	public Event selectEvent(String eventId) throws Exception;
	public List<Event> selectListEvent(String eventName) throws Exception;
	public void updateEvent(Search search,String eventName) throws Exception;
	public List<Event> selectListInterestedEvent(String userId) throws Exception;
	public void insertInterestedEvent(String eventId, String userId) throws Exception;
	public void deleteInterestedEvent(String eventId, String userId) throws Exception;
	public void insertYoutubeVideo(String youtubeId, String eventName) throws Exception;
	public void deleteYoutubeVideo(int youtubeNo) throws Exception;
	public List<String> selectListYoutubeId(String eventName) throws Exception;
	public List<Event> selectListPopularEvent() throws Exception;
	public List<RecommEvent> selectListRecommendedEvent() throws Exception;
	public RecommEvent selectRecommendedEvent(int recommEventNo) throws Exception;
	public void insertRecommendedEvent(RecommEvent recommEvent) throws Exception;
	public void updateRecommendedEvent(RecommEvent recommEvent) throws Exception;
	public void deleteRecommendedEvent(int recommEventNo) throws Exception;
	public List<Category> selectListCategory() throws Exception;
	public void insertCategoryTwo(Category category) throws Exception;
	public void updateCategoryTwo(Category category) throws Exception;
	public Category selectCategory(String categoryTwoEng) throws Exception;
	public void deleteCategoryTwo(String categoryTwoEng) throws Exception;
	public List<User> selectInterestedByUser(Search search) throws Exception;
	public void insertInterestedCategory(String categoryTwoEng, String userId) throws Exception;
	public Map<String,Object> getEventList(Search search, String requestPageToken, String apiKey) throws Exception;
	public Map<String,Object> getYoutubeList(Search search, String requestPageToken, String apiKey) throws Exception;
	public void deleteInterestedEventAll(String userId) throws Exception;
	public Map<String, Object> translate(String sourceLang, String targetLang,String queryText,List<StubhubEvent> list) throws Exception;
	public Map<String, Object> translate(String sourceLang, String targetLang, List<Event> list) throws Exception;
	public List<String> selectAllLocation() throws Exception;
	
}