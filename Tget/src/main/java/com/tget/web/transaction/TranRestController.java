package com.tget.web.transaction;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.tget.common.web.GoogleTextVision;
import com.tget.service.alarm.AlarmService;
import com.tget.service.alarm.domain.Alarm;
import com.tget.service.event.EventService;
import com.tget.service.ticket.TicketService;
import com.tget.service.ticket.domain.Ticket;
import com.tget.service.transaction.TranService;

@RestController
@RequestMapping("/tran/*")
public class TranRestController {
	
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
	
	
	public TranRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value = "rest/Kakaopay/{ticketNo}/{totalPrice}" ,method = RequestMethod.GET)
	public String Kakaopay(@PathVariable("ticketNo") int ticketNo ,
						@PathVariable("totalPrice") int totalPrice, HttpSession session) throws Exception {
		
		System.out.println("rest/Kakaopay/"+ticketNo+"/"+totalPrice);
		
		Ticket ticket = ticketService.getTicket(ticketNo);
		
        String daumOpenAPIURL = "https://kapi.kakao.com/v1/payment/ready";
    	
        // java API 를 이용 HttpRequest
        URL url = new URL(daumOpenAPIURL);
        HttpURLConnection con = (HttpURLConnection)url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Authorization", "KakaoAK 593d683e10b73b905dfb5f56dbd9782d");
        con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        
        con.setDoOutput(true);
        
        String jsonInputString = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name="+ticket.getEvent().getEventName()
        		+"&quantity=1&total_amount="+totalPrice+"&tax_free_amount=0&approval_url=http://192.168.0.82:8080/tran/kakaoAppro.jsp&fail_url=http://192.168.0.82:8080/tran/kakaoFail.jsp"
        		+"&cancel_url=http://192.168.0.82:8080/tran/kakaoFail.jsp";
       
        System.out.println("String : "+jsonInputString);
        
        byte[] input = jsonInputString.getBytes("utf-8");
        
        con.getOutputStream().write(input); // POST 호출
        
        int responseCode = con.getResponseCode();
        
        BufferedReader br = null;
        
        if(responseCode==200) { 
            br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
        }
        
        
        //JSON Data 읽기
        String jsonData = "";
        StringBuffer response = new StringBuffer();
        
        while ((jsonData = br.readLine()) != null) {
            response.append(jsonData);
        }
        
        br.close();
        
        // Console 확인
        System.out.println("code : "+responseCode);
        System.out.println(response.toString());
		
        if(responseCode==200) {
        	
        	session.setAttribute("kakaoTicket", ticket);
        	
		}
        
		return response.toString();
	}
	
	@RequestMapping(value = "rest/getDeliveryInfo" ,method = RequestMethod.POST)
	public Map<String, Object> getDeliveryInfo(@RequestParam("file") MultipartFile imagefile) throws Exception {
		
		System.out.println("rest/getDeliveryInfo");
		
		File convertFile = new File( imagefile.getOriginalFilename()+System.currentTimeMillis() );
		imagefile.transferTo(convertFile);
		
		String base64 = GoogleTextVision.getBase64(convertFile);		
		
		String result = GoogleTextVision.getText(GoogleTextVision.getVisionRequest(base64));
		String deilveryNo = GoogleTextVision.getDeliveryNo(result);
		String deliveryCompany = GoogleTextVision.getTranWhat(result);
		
		System.out.println(deilveryNo);
		System.out.println(deliveryCompany);
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("deliveryCompany", deliveryCompany);
		map.put("deilveryNo", deilveryNo);
		
		return map;
	}	
	
}
