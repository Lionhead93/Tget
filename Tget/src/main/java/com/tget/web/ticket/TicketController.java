package com.tget.web.ticket;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tget.common.domain.Search;
import com.tget.service.event.EventService;
import com.tget.service.event.domain.Event;
import com.tget.service.ticket.TicketService;
import com.tget.service.ticket.domain.SellProb;
import com.tget.service.ticket.domain.Ticket;
import com.tget.service.user.UserService;
import com.tget.service.user.domain.User;

@Controller
@RequestMapping("/ticket/*")
public class TicketController {
	
	@Qualifier("ticketServiceImpl")
	@Autowired
	private TicketService ticketService;
	@Qualifier("eventServiceImpl")
	@Autowired
	private EventService eventService;
	@Qualifier("userServiceImpl")
	@Autowired
	private UserService userService;
	
	public TicketController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['swuploadPath']}")
	String uploadPath;
	
	@RequestMapping(value = "addTicketInfo", method = RequestMethod.GET)	
	public String addTicketInfo( @RequestParam("eventId") String eventId, Model model ) throws Exception{
		
		System.out.println("addTicketInfo : GET // eventId = "+eventId);
		
		Event event = eventService.getEvent(eventId);
		
		model.addAttribute(event);
		
		return "forward:/ticket/addTicketInfo.jsp";
	}
	
	@RequestMapping(value = "addTicketInfo", method = RequestMethod.POST)	
	public String addTicketInfo(@ModelAttribute Ticket ticket, Model model , 
								HttpSession session) throws Exception {
		
		System.out.println("addTicketInfo : POST  ");
		System.out.println(ticket);
				
		session.setAttribute("sellticketInfo", ticket);
		
		SellProb sellProb = ticketService.getTicketPrice(ticket.getEvent().getEventId());
		model.addAttribute(sellProb);
		
		return "forward:/ticket/addTicketPrice.jsp";
	}	
	
	@RequestMapping(value = "addTicketPrice", method = RequestMethod.POST)	
	public String addTicketPrice(@RequestParam("price") int price, Model model , 
								HttpSession session) throws Exception {
		
		System.out.println("addTicketPrice : POST ?price= "+price);
		
		Ticket ticket = (Ticket) session.getAttribute("sellticketInfo");		
		ticket.setPrice(price);
		
		session.setAttribute("sellticketInfo", ticket);
		
		return "forward:/ticket/addTicketImage.jsp";
	}
	
	@RequestMapping(value = "addTicketImage", method = RequestMethod.POST)	
	public String addTicketImage(@RequestParam("file") MultipartFile file , Model model ,
								 HttpSession session) throws Exception {
		
		System.out.println("addTicketImage : POST ?file= "+file.getOriginalFilename());
		
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");		
		String formatTime = format.format(System.currentTimeMillis());
		
		String fileName = formatTime+"_"+file.getOriginalFilename();
		File saveFile = new File(uploadPath, fileName);
		file.transferTo(saveFile);
		
		Ticket ticket = (Ticket) session.getAttribute("sellticketInfo");
		ticket.setTicketImage(fileName);
		
		model.addAttribute("ticket", ticket);
		session.removeAttribute("sellticketInfo");
		
		ticketService.addTicket(ticket);
		
		return "forward:/ticket/addTicketResult.jsp";
	}
	
	@RequestMapping(value = "getTicket", method = RequestMethod.GET)	
	public String getTicket(@RequestParam("ticketNo") int ticketNo, Model model) throws Exception {
		
		System.out.println("getTicket : GET ?ticketNo= "+ticketNo);
		
		Ticket ticket = ticketService.getTicket(ticketNo);
		
		model.addAttribute("ticket",ticket);
		
		return "forward:/ticket/getTicket.jsp";
	}
	
	@RequestMapping(value = "getTicketList")	
	public String getTicketList(@ModelAttribute("search") Search search,
								HttpSession session, Model model) throws Exception {
		
		System.out.println("getTicketList  ?search= "+search);
		
		User user = (User) session.getAttribute("user");
		
		if(user==null) {
			return "redirect:/user/login";
		}
		
		String result = "";
		
		if(search.getMenu().equals("seller")){
			search.setSearchCondition("1");	
			search.setSearchKeyword(user.getUserId());
			result = "forward:/ticket/listTicketBySeller.jsp";
		}else if(search.getMenu().equals("check")){
			search.setSearchCondition("2");
			result = "forward:/ticket/listTicketCheck.jsp";
		}
		
		Map<String, Object> map = ticketService.getTicketList(search);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("sellProb", map.get("sellProb"));
		
		return result;
	}	
	
	@RequestMapping(value = "addSeller", method = RequestMethod.GET)	
	public String addSeller() throws Exception {
		
		System.out.println("addSeller : GET");
//		sellerCode
		return "forward:/ticket/addSeller.jsp";
	}
	
	@RequestMapping(value = "addSeller", method = RequestMethod.POST)	
	public String addSeller(@ModelAttribute("user") User user, HttpSession session) throws Exception {
		
		System.out.println("addSeller : POST user="+user);
		user.setSellerCode("0");
		user.setRole("1");
		userService.updateSeller(user);
		
		User updateUser = userService.getUser(user.getUserId());
		
		session.setAttribute("user", updateUser);
		
		return "forward:/ticket/addSellerResult.jsp";
	}
}
