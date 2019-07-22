package com.tget.service.event.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.tget.common.domain.Search;
import com.tget.service.event.domain.Category;
import com.tget.service.event.domain.Event;
import com.tget.service.event.domain.RecommEvent;
import com.tget.service.event.domain.StubhubEvent;
import com.tget.service.user.domain.User;
import com.tget.service.event.EventDao;
import com.tget.service.event.EventService;


@Service("eventServiceImpl")
public class EventServiceImpl implements EventService{
	///F
	@Autowired
	@Qualifier("eventDaoImpl")
	private EventDao eventDao;
	

	public void addEvent(StubhubEvent event) throws Exception{
		eventDao.insertEvent(event);
	}
	
	
	public Event getEvent(String eventId) throws Exception{ 
		return eventDao.selectEvent(eventId);
		//return event도메인; Event
	}
	
	
	public  List<Event> getEventByName(String eventName) throws Exception{ 
		return eventDao.selectListEvent(eventName);
		//return event도메인 리스트;List<Event> 
	}
	
	
	public void updateEventViewCount(int viewCount,String eventName) throws Exception{
		Search search = new Search();
		search.setSearchCondition("0");
		search.setSearchKeyno(viewCount);
		eventDao.updateEvent(search,eventName);
	}
	
	
	public void updateEventImage(String imageName,String eventName) throws Exception{
		Search search = new Search();
		search.setSearchCondition("1");
		search.setSearchKeyword(imageName);
		eventDao.updateEvent(search,eventName);
	}
	
	
	public void addEventImage(String imageName,String eventName) throws Exception{
		this.updateEventImage(imageName, eventName);
	}
	
	
	public void deleteEventImage(String eventName) throws Exception{
		Search search = new Search();
		search.setSearchCondition("1");
		search.setSearchKeyword(null);
		eventDao.updateEvent(search,eventName);
	}
	
	
	public List<Event> getInterestedEventList(String userId) throws Exception{
		return eventDao.selectListInterestedEvent(userId);
	}
	
	
	public void addInterestedEvent(String eventId, String userId) throws Exception{
		eventDao.insertInterestedEvent(eventId,userId);
	}
	
	
	public void deleteInterestedEvent(String eventId, String userId) throws Exception{
		eventDao.deleteInterestedEvent(eventId,userId);
	}
	
	
	public List<String> getYoutubeIdList(String eventName) throws Exception{ 
		return eventDao.selectListYoutubeId(eventName);
	}
	
	
	public void addYoutubeVideo(String youtubeId, String eventName) throws Exception{ 
		eventDao.insertYoutubeVideo(youtubeId, eventName);
	}
	
	
	public List<Event> getPopularEventList() throws Exception{ 
		return eventDao.selectListPopularEvent();
	}
	
	
	public List<RecommEvent> getRecommendedEventList() throws Exception{ 
		return eventDao.selectListRecommendedEvent();
	}
	
	
	public RecommEvent getRecommendedEvent(int recommEventNo) throws Exception{
		return eventDao.selectRecommendedEvent(recommEventNo);
	}
	
	
	public void addRecommendedEvent(RecommEvent recommEvent) throws Exception{
		eventDao.insertRecommendedEvent(recommEvent);
	}
	
	
	public void updateRecommendedEvent(RecommEvent recommEvent) throws Exception{
		eventDao.updateRecommendedEvent(recommEvent);
	}
	
	
	public void deleteRecommendedEvent(int recommEventNo) throws Exception{ 
		eventDao.deleteRecommendedEvent(recommEventNo);
	}
	
	
	public List<Category> getCategoryList() throws Exception{ 
		return eventDao.selectListCategory();
	}
	
	
	public void addCategoryTwo(Category category) throws Exception{
		eventDao.insertCategoryTwo(category);
	}
	
	
	public void updateCategoryTwo(Category category) throws Exception{
		eventDao.updateCategoryTwo(category);
	}
	
	
	public Category getCategory(String categoryTwoEng) throws Exception{
		return eventDao.selectCategory(categoryTwoEng);
	}
	
	
	public void deleteCategoryTwo(String categoryTwoEng) throws Exception{
		eventDao.deleteCategoryTwo(categoryTwoEng);
	}
	
	
	public List<User> getInterestedByUser(Search search) throws Exception{
		return eventDao.selectInterestedByUser(search);
	}
	
	
	public void addInterestedCategory(String categoryTwoEng, String userId) throws Exception{
		eventDao.insertInterestedCategory(categoryTwoEng, userId);
	}
	
	
	public Map<String,Object> getEventList(Search search, String requestPageToken, String apiKey) throws Exception{ 
		return eventDao.getEventList(search,requestPageToken,apiKey);
	}
	
	
	public Map<String,Object> getYoutubeList(Search search, String requestPageToken, String apiKey) throws Exception{
		return eventDao.getYoutubeList(search,requestPageToken,apiKey);
	}
	
	public void deleteInterestedEventAll(String userId) throws Exception{
		eventDao.deleteInterestedEventAll(userId);
	}
	
	
}