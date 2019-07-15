package com.tget.web.transaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tget.service.event.EventService;
import com.tget.service.ticket.TicketService;
import com.tget.service.ticket.domain.Ticket;
import com.tget.service.transaction.TranService;
import com.tget.service.transaction.domain.Transaction;

@Controller
@RequestMapping("/tran/*")
public class TranController {
	
	@Qualifier("ticketServiceImpl")
	@Autowired
	private TicketService ticketService;
	@Qualifier("eventServiceImpl")
	@Autowired
	private EventService eventService;	
	@Qualifier("tranServiceImpl")
	@Autowired
	private TranService tranService;
	
	
	public TranController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "addTran", method = RequestMethod.GET)	
	public String addTran(@RequestParam("ticketNo") int ticketNo, Model model) throws Exception {
		
		System.out.println("addTran : GET // ticketNo = "+ticketNo);
		
		Ticket ticket = ticketService.getTicket(ticketNo);
		
		model.addAttribute("ticket",ticket);
		
		return "forward:/tran/addTran.jsp";
	}
	
	@RequestMapping(value = "addTran", method = RequestMethod.POST)	
	public String addTran(@ModelAttribute("transaction") Transaction transaction, Model model) throws Exception {
		
		System.out.println("addTran : POST // transaction = "+transaction);
		
		tranService.addTran(transaction);
		
		return "forward:/tran/addTranResult.jsp";
	}

}
