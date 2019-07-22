package com.tget.web.alarm;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tget.common.domain.Search;
import com.tget.service.alarm.AlarmService;
import com.tget.service.event.EventService;
import com.tget.service.ticket.TicketService;

@RestController
@RequestMapping("/alarm/*")
public class AlarmRestController {

	@Qualifier("ticketServiceImpl")
	@Autowired
	private TicketService ticketService;
	@Qualifier("eventServiceImpl")
	@Autowired
	private EventService eventService;
	@Qualifier("alarmServiceImpl")
	@Autowired
	private AlarmService alarmService;
	
	public AlarmRestController() {
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value = "rest/getAlarmList/{userId}", method = RequestMethod.GET)
	public Map<String, Object> getAlarmList( @PathVariable("userId") String userId ) throws Exception{
		
		System.out.println("rest/getAlarmList/"+userId);
		
		Search search = new Search();
		search.setSearchKeyword(userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.get("list");
		
		return alarmService.getAlarmList(search);		
	}
	
	@RequestMapping(value = "rest/getNoReadAlarm/{userId}", method = RequestMethod.GET)
	public Map<String, Object> getNoReadAlarm( @PathVariable("userId") String userId ) throws Exception{
		
		System.out.println("rest/getNoReadAlarm/"+userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("NoReadAlarmCount", alarmService.getNoReadAlarmCount(userId));
		
		return map;
	}
	
	@RequestMapping(value = "rest/deleteAlarm/{alarmNo}", method = RequestMethod.GET)
	public Map<String, Object> deleteAlarm( @PathVariable("alarmNo") int alarmNo ) throws Exception{
		
		System.out.println("rest/deleteAlarm/"+alarmNo);
		
		alarmService.deleteAlarm(alarmNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "good");
		
		return map;
	}
}
