package com.tget.service.event.test;

import java.sql.Date;

import com.tget.service.event.EventDao;
import com.tget.service.event.domain.Event;
import com.tget.service.event.impl.EventDaoImpl;

public class EventDaoTest {

	public static EventDao eventDao = new EventDaoImpl();
	
	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub

		Event event = new Event();
		event.setEventId("testId2");
//		event.setCategoryTwoNo(10000);
		event.setEventDate(new Date(2012-1900,04-1,8));
		event.setEventLocation("¼­¿ï");
		event.setEventName("EXO");
		event.setEventTime(1248);
		event.setViewCount(1);
		System.out.println(event);
		
//		eventDao.insertEvent(event);
		
		//System.out.println(eventDao.selectEvent(event.getEventId()));
		
	}

}
