package com.tget.web.ticket;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tget.common.domain.Search;
import com.tget.service.event.EventService;
import com.tget.service.ticket.TicketService;
import com.tget.service.ticket.domain.SellProb;
import com.tget.service.ticket.domain.Ticket;
import com.tget.service.user.domain.User;

@RestController
@RequestMapping("/ticket/*")
public class TicketRestController {
	
	@Qualifier("ticketServiceImpl")
	@Autowired
	private TicketService ticketService;
	@Qualifier("eventServiceImpl")
	@Autowired
	private EventService eventService;
	
	public TicketRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "rest/getTicketSellProb/{price}/{eventId}", method = RequestMethod.GET)
	public SellProb getTicketSellProb( @PathVariable("price") int price,
									   @PathVariable("eventId") String eventId) throws Exception{
		
		System.out.println("rest/getTicketSellProb/{price}/{eventId}");
		Search search = new Search();
		search.setSearchCondition("0");
		search.setSearchKeyword(eventId);
		
		return ticketService.getTicketSellProb(search, price);		
	}	
	
	@RequestMapping(value = "rest/getTicketList/{condition}/{keyword}", method = RequestMethod.GET)	
	public Map<String, Object> getTicketList(@PathVariable("condition") String condition,
			   					@PathVariable("keyword") String keyword) throws Exception {
		
		System.out.println("rest/getTicketList/"+condition+"/"+keyword);
		
		Search search = new Search();
		
		search.setSearchCondition(condition);
		search.setSearchKeyword(keyword);
		
		Map<String, Object> map = ticketService.getTicketList(search);
		
		return map;
	}	
	@RequestMapping(value = "rest/getTicket/{ticketNo}", method = RequestMethod.GET)	
	public Ticket getTicket(@PathVariable("ticketNo") int ticketNo) throws Exception {
		
		System.out.println("rest/getTicket/"+ticketNo);
		
		
		return ticketService.getTicket(ticketNo);
	}
	
	@RequestMapping(value = "rest/checkTicket/{ticketNo}", method = RequestMethod.GET)	
	public Map<String, Object> checkTicket(@PathVariable("ticketNo") int ticketNo) throws Exception {
		
		System.out.println("rest/checkTicket/"+ticketNo);
		
		Ticket ticket = ticketService.getTicket(ticketNo);
		ticket.setCode("1");
		
		ticketService.updateTicketCode(ticket);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ticket", ticket);
		map.put("message", "검증 성공");
		
		return map;
	}
	
}
