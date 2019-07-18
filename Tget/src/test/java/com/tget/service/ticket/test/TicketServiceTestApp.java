package com.tget.service.ticket.test;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tget.common.domain.Search;
import com.tget.service.alarm.AlarmService;
import com.tget.service.alarm.domain.Alarm;
import com.tget.service.event.domain.Event;
import com.tget.service.ticket.TicketService;
import com.tget.service.ticket.domain.Ticket;
import com.tget.service.transaction.TranService;
import com.tget.service.transaction.domain.Transaction;
import com.tget.service.user.domain.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })
public class TicketServiceTestApp {
	
	@Autowired
	@Qualifier("ticketServiceImpl")
	private TicketService ticketService;
	
	@Autowired
	@Qualifier("tranServiceImpl")
	private TranService tranService;
	
	@Autowired
	@Qualifier("alarmServiceImpl")
	private AlarmService alarmService;
	
	//@Test
	public void searchDelivery() throws Exception {
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String url= 	"http://info.sweettracker.co.kr?t_key=CbHyQ5hk2Mf9jPrkBc5Gcg";		
		
		url+="&t_code=08";
		url+="&t_invoice=231863361166";
		
		System.out.println(url);

		HttpGet httpGet = new HttpGet(url);
		HttpResponse httpResponse = httpClient.execute(httpGet);
		System.out.println(httpResponse+"\n");

		HttpEntity httpEntity = httpResponse.getEntity();
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);
		System.out.println(jsonobj);
	}
	
	//@Test	
	public void addTicket() throws Exception {
		
		Ticket ticket = new Ticket();
		Event event = new Event();
		User user = new User();
		
		event.setEventId("104175822");
		user.setUserId("seller");
		
		ticket.setEvent(event);
		ticket.setSeller(user);
		
		ticket.setAmount(10);
		ticket.setPrice(200000);
		ticket.setType("0");
		ticket.setSeat("c열34");
		ticket.setOptions("애완동물출입금지");
		ticket.setTicketImage("ccc.jpg");
		
		ticketService.addTicket(ticket);
		
	}
	
	//@Test
	public void updateTicketCode() throws Exception {
		
		Ticket ticket = new Ticket();
		ticket.setTicketNo(10002);
		ticket.setCode("1");
		
		ticketService.updateTicketCode(ticket);
	}
	
	//@Test
	public void selectListTicket() throws Exception {
		
		Search search = new Search();
		search.setSearchCondition("0");
		search.setSearchKeyword("testId");
		
		ticketService.getTicketList(search);
		
	}
	
	//@Test
	public void insertTran() throws Exception {
		
		Transaction transaction = new Transaction();
		Ticket ticket = new Ticket();	
		Event event = new Event();
		User seller = new User();
		User buyer = new User();
		
		ticket.setTicketNo(10002);
		event.setEventId("testId");
		event.setEventName("EXO");
		seller.setUserId("seller");
		seller.setNickName("판매자얌");
		buyer.setUserId("buyer");
		buyer.setNickName("구매자얌");
		
		transaction.setTicket(ticket);
		transaction.setEvent(event);
		transaction.setSeller(seller);
		transaction.setBuyer(buyer);
		transaction.setOrderAmount(2);
		transaction.setTotalPrice(600000);
		transaction.setPaymentNo("30303154542");
		transaction.setPaymentOption("2");
		transaction.setTranCode("1");
		transaction.setDeliveryAddr("서울시마포구");
		
		tranService.addTran(transaction);
		
	}
	
	//@Test
	public void updateDeliveryInfo() throws Exception {
		
		Transaction transaction = new Transaction();
		transaction.setTranNo(10002);
		transaction.setDeliveryCompany("CJ");
		transaction.setDeliveryNo("100054222222111");
		
		tranService.addDelivery(transaction);
		
	}
	
	//@Test
	public void selectTran() throws Exception {
		
		tranService.getTran(10002);
		
	}
	
	//@Test
	public void selectListTran() throws Exception {
			
		Search search = new Search();
		search.setSearchCondition("0");
		search.setSearchKeyword("1");
			
		tranService.getTranList(search);
		
	}
	
	
	@Test
	public void addAlarm() throws Exception{
		
		Alarm alarm = new Alarm();
		
		alarm.setAlarmCode(4);
		alarm.setAlarmKeyword("10001");
		alarm.setUserId("admin");
		
		alarmService.addAlarm(alarm);
		
	}
	
	//@Test
	public void updateAlarmRead() throws Exception{
		
		alarmService.updateAlarmRead(10003);
		
	}
	
	//@Test
	public void deleteAlarm() throws Exception{
			
		alarmService.deleteAlarm(10000);
			
	}
	
	//@Test
	public void selectListAlarm() throws Exception {
				
		Search search = new Search();
		search.setSearchKeyword("admin");
				
		alarmService.getAlarmList(search);
	}
	
	//@Test
	public void selectNoReadAlarmCount() throws Exception {
					
		alarmService.getNoReadAlarmCount("admin");
	}
	
}
