package com.tget.web.ticket;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.tget.common.domain.Search;
import com.tget.service.alarm.AlarmService;
import com.tget.service.alarm.domain.Alarm;
import com.tget.service.event.EventService;
import com.tget.service.ticket.TicketService;
import com.tget.service.ticket.domain.SellProb;
import com.tget.service.ticket.domain.Ticket;
import com.tget.service.user.UserService;
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
	@Qualifier("userServiceImpl")
	@Autowired
	private UserService userService;
	@Qualifier("alarmServiceImpl")
	@Autowired
	private AlarmService alarmService;
	
	
	public TicketRestController() {
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping(value = "rest/addTicketPrice/{price}", method = RequestMethod.GET)	
	public Map<String, Object> addTicketPrice(@PathVariable("price") int price, 
								HttpSession session) throws Exception {
		
		System.out.println("rest/addTicketPrice/"+price);
		
		Ticket ticket = (Ticket) session.getAttribute("sellticketInfo");		
		ticket.setPrice(price);
		
		session.setAttribute("sellticketInfo", ticket);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "ok");
				
		return map;
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
	
	@RequestMapping(value = "rest/getSellList/{eventId}", method = RequestMethod.GET)	
	public Map<String, Object> getSellList(@PathVariable("eventId") String eventId) throws Exception {
		
		System.out.println("rest/getSellList/"+eventId);
		
		Search search = new Search();
		search.setSearchCondition("0");
		search.setSearchKeyword(eventId);
		
		Map<String, Object> map = ticketService.getTicketList(search);
		
		List<Ticket> list = (List<Ticket>) map.get("list");		
		int a = 0;
		int b = 0;
		int c = 0;
		int d = 0;
		int e = 0;
		int f = 0;		
		for( Ticket ticket : list) {			
			if(ticket.getPrice()<=50000) {
				a += ticket.getAmount();
			}else if( ticket.getPrice()>50000 && ticket.getPrice()<=100000) {
				b += ticket.getAmount();
			}else if( ticket.getPrice()>100000 && ticket.getPrice()<=200000) {
				c += ticket.getAmount();
			}else if( ticket.getPrice()>200000 && ticket.getPrice()<=300000) {
				d += ticket.getAmount();
			}else if( ticket.getPrice()>300000 && ticket.getPrice()<=400000) {
				e += ticket.getAmount();
			}else if( ticket.getPrice()>400000) {
				f += ticket.getAmount();
			}
		}		
		map.put("a", a);
		map.put("b", b);
		map.put("c", c);
		map.put("d", d);
		map.put("e", e);
		map.put("f", f);
		return map;
	}
	
	@RequestMapping(value = "rest/addSeller", method = RequestMethod.POST)	
	public User addSeller(@RequestBody User user, HttpSession session) throws Exception {
		
		System.out.println("addSeller : POST user="+user);
		
		user.setSellerCode("0");
		user.setRole("1");
		userService.updateSeller(user);
		
		User updateUser = userService.getUser(user.getUserId());
		
		session.setAttribute("user", updateUser);
		
		return updateUser;
	}
}
