package com.tget.web.transaction;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tget.common.domain.Search;
import com.tget.service.alarm.AlarmService;
import com.tget.service.alarm.domain.Alarm;
import com.tget.service.event.EventService;
import com.tget.service.rnp.RNPService;
import com.tget.service.rnp.domain.PointHistory;
import com.tget.service.ticket.TicketService;
import com.tget.service.ticket.domain.Ticket;
import com.tget.service.transaction.TranService;
import com.tget.service.transaction.domain.Transaction;
import com.tget.service.user.UserService;
import com.tget.service.user.domain.User;

@Controller
@RequestMapping("/tran/*")
public class TranController {
	
	@Qualifier("userServiceImpl")
	@Autowired
	private UserService userService;
	@Qualifier("ticketServiceImpl")
	@Autowired
	private TicketService ticketService;
	@Qualifier("eventServiceImpl")
	@Autowired
	private EventService eventService;	
	@Qualifier("tranServiceImpl")
	@Autowired
	private TranService tranService;
	@Qualifier("alarmServiceImpl")
	@Autowired
	private AlarmService alarmService;
	@Qualifier("rNPServiceImpl")
	@Autowired
	private RNPService rNPService;
	
	
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
	public String addTran(@ModelAttribute("transaction") Transaction transaction, Model model, HttpSession session) throws Exception {
		
		System.out.println("addTran : POST // transaction = "+transaction);		
		
		int selectKey = tranService.addTran(transaction);
		
		Ticket ticket = ticketService.getTicket(transaction.getTicket().getTicketNo());
		ticket.setAmount(ticket.getAmount()-transaction.getOrderAmount());
		ticketService.updateTicketAmount(ticket);
		System.out.println("payOption/////////////"+transaction.getPaymentOption());
		
		User user = (User) session.getAttribute("user");
		user.setPoint(user.getPoint()-transaction.getUsePoint());		
		rNPService.updatePoint(user);
		
		session.setAttribute("user", user);
		
		PointHistory pointHistory = new PointHistory();
		pointHistory.setPointUpdateCode("1");
		pointHistory.setUserId(user.getUserId());
		pointHistory.setTranNo(selectKey);
		pointHistory.setTotalPoint(user.getPoint());
		pointHistory.setUpdatePoint(transaction.getUsePoint());
		rNPService.addPoint(pointHistory);
		
		Alarm alarm = new Alarm();
		alarm.setAlarmCode(0);
		alarm.setAlarmKeyword(Integer.toString(transaction.getTicket().getTicketNo()));
		alarm.setUserId(ticket.getSeller().getUserId());
		alarmService.addAlarm(alarm);
		
		return "forward:/tran/addTranResult.jsp";
	}
	
	@RequestMapping(value = "getTranList")	
	public String getTranList(@ModelAttribute("search") Search search,
								HttpSession session, Model model) throws Exception {
		
		System.out.println("getTranList  ?search= "+search);
		
		User user = (User) session.getAttribute("user");
		
		String result = "";
		
		if(search.getMenu().equals("user")){
			search.setSearchCondition("1");	
			search.setSearchKeyword(user.getUserId());
			result = "forward:/tran/listTran.jsp";
		}else if(search.getMenu().equals("check")){
			result = "forward:/ticket/adminMenu.jsp";
		}
		
		Map<String, Object> map = tranService.getTranList(search);

		model.addAttribute("list", map.get("list"));
		model.addAttribute("totalCount", map.get("totalCount"));
		
		return result;
	}	
	
	@RequestMapping(value = "addDelivery", method = RequestMethod.POST)	
	public String addDelivery(@ModelAttribute("transaction") Transaction transaction) throws Exception {
		
		System.out.println("addDelivery : POST // transaction = "+transaction);		
		
		tranService.addDelivery(transaction);
				
		return "forward:/tran/getTranList?menu=user";
	}
	
	@RequestMapping(value = "goChat" ,method = RequestMethod.GET)
	public String goChat(@RequestParam("userId") String userId,
							@RequestParam("opponentId") String opponentId,
							@RequestParam("re") String re, Model model) throws Exception {
		
		System.out.println("goChat/"+userId+"/"+opponentId+"/"+re);
		
		if(re.equals("res")) {
			
		}else {
			Alarm alarm = new Alarm();
			alarm.setAlarmCode(9);
			alarm.setAlarmKeyword(userId);
			alarm.setUserId(opponentId);
			alarmService.addAlarm(alarm);
		}
		
		model.addAttribute("chatUser",userService.getUser(userId));
		model.addAttribute("chatOpponent",userService.getUser(opponentId));
		model.addAttribute("re", re);		
				
		return "forward:/tran/chat.jsp";
	}
}
