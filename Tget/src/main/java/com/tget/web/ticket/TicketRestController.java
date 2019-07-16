package com.tget.web.ticket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tget.common.domain.Search;
import com.tget.service.event.EventService;
import com.tget.service.ticket.TicketService;
import com.tget.service.ticket.domain.SellProb;

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
	
	
}
