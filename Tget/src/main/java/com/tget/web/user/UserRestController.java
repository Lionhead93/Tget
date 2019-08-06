package com.tget.web.user;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.AuthCache;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.auth.BasicScheme;
import org.apache.http.impl.client.BasicAuthCache;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tget.service.user.Config;
import com.tget.service.user.UserService;
import com.tget.service.user.domain.User;



//==> 회원관리 RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}
	
	
	
	@RequestMapping(value= "json/sendSms", method=RequestMethod.POST ) 
	public Map<String,Object> sendSms(String receiver)throws Exception { 
	
		Map<String,Object> map = new HashMap<String,Object>();
		
		System.out.println("뜨냐?");
		
		System.out.println(receiver+"번호 뭐 들왔냐?");
		
		int rand = (int) (Math.random() * 899999) + 100000; 
		System.out.println(rand+"랜덤번호 머냐");
		  String hostname = "api.bluehouselab.com";
	        String url = "https://"+hostname+"/smscenter/v1.0/sendsms";

	        CredentialsProvider credsProvider = new BasicCredentialsProvider();
	        credsProvider.setCredentials(
	            new AuthScope(hostname, 443, AuthScope.ANY_REALM),
	            new UsernamePasswordCredentials(Config.appid, Config.apikey));
	        
	        // Create AuthCache instance
	        AuthCache authCache = new BasicAuthCache();
	        authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

	        // Add AuthCache to the exe.put(new Hecution context
	        HttpClientContext context = HttpClientContext.create();
	        context.setCredentialsProvider(credsProvider);
	        context.setAuthCache(authCache);
	    
	        DefaultHttpClient client = new DefaultHttpClient();

	        try {
	            HttpPost httpPost = new HttpPost(url);
	            httpPost.setHeader("Content-type", "application/json; charset=EUC-KR");
	            String json = "{\"sender\":\""+Config.sender+"\",\"receivers\":[\""+receiver+"\"],\"content\":\""+rand+"\"}";
	            
	            StringEntity se = new StringEntity(json, "EUC-KR");
	            httpPost.setEntity(se);
	       
	            HttpResponse httpResponse = client.execute(httpPost, context);
	         
	            System.out.println(httpResponse.getStatusLine().getStatusCode());
	       
	            InputStream inputStream = httpResponse.getEntity().getContent();
	            if(inputStream != null) {
	                BufferedReader bufferedReader = new BufferedReader( new InputStreamReader(inputStream));
	                String line = "";
	                while((line = bufferedReader.readLine()) != null)
	                inputStream.close();
	            }
	        } catch (Exception e) {
	            System.err.println("Error: "+e.getLocalizedMessage());
	        } finally {
	            client.getConnectionManager().shutdown();
	        }
	        
	        map.put("rand", String.valueOf(rand));
	        
	        return map;
	}  
	
	@RequestMapping( value="json/finduserId" , method=RequestMethod.POST)
	public Map<String, Object> finduserId (String userName, String phone)throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		User user = userService.finduserId(phone);
		
		String checkName =user.getUserName();
		
		String Id = user.getUserId();
		
		System.out.println(userName+"뭐 쳤냐");
		
		System.out.println( checkName+"내가 뭘 잘못했는지?");
		
		if (checkName.equals(userName)){
			
			map.put("msg","yes");
			map.put("Id", Id);
		}
		
		
		else {
			
			map.put("msg","no");
			
			return map;
		}
		return map;
	}      
	
	@RequestMapping( value="json/findPassword" , method=RequestMethod.POST)
	public String findPassword (String userId, String phone)throws Exception{
		
		System.out.println("들어왔니"); 
		
		User user = userService.finduserId(phone);
		
		System.out.println("user는 뭘깡"+user);
		System.out.println(userId+"아이디 뭐썼냐");
		
		if (user==null){
			return "no";
		}else {
		return "yes";
		}
	}    
	

	@RequestMapping(value = "json/checknickNameDuplication", method=RequestMethod.POST)
	public boolean checknickNameDuplication(@RequestBody User user)throws Exception{
		
		System.out.println("/cafe/json/checknickNameDuplication : POST");
		
		boolean result = userService.checknickNameDuplication(user.getNickName());

		System.out.println("될까?"+result);
		
		return result;
		
	}
	
	@RequestMapping(value = "json/checkuserIdDuplication", method=RequestMethod.POST)
	public boolean checkuserIdDuplication(@RequestBody User user)throws Exception{
		
		System.out.println("/cafe/json/checknickNameDuplication : POST");
		
		boolean result = userService.checkuserIdDuplication(user.getUserId());

		System.out.println("될까?"+result);
		
		return result;
		
	}
	
	@RequestMapping(value = "json/checkcodeDuplication", method=RequestMethod.POST)
	public boolean checkcodeDuplication(@RequestBody User user)throws Exception{
		
		System.out.println("/user/json/checkcodeDuplication : POST");
		
		boolean result = userService.checkcodeDuplication(user.getCode());

		System.out.println("될까?"+result);
		
		return result;
		
	}
	@RequestMapping( value="json/login")
	public Map<String,Object> login(String userId, Model model) throws Exception{
		
		System.out.println("/user/json/login : POST");
		//Business Logic
		Map<String,Object> map = new HashMap<String,Object>();
		User user = userService.getUser(userId);
		
		
		System.out.println("ㅁㄷ"+user);
		if (user==null){
			map.put("msg",  "no");
			return map;
		}
		
		System.out.println("뭐가 들어왔니?"+user);
		
		Date today = new Date ();
		Date end = user.getBlacklistEndDate();
		
		System.out.println("오늘은"+today);
		System.out.println("유저 블랙리스트오니"+end);
	
	
		
		if( end != null  &&
				today.getTime() <= end.getTime() ) {
			
//			model.addAttribute("user", user);
			map.put("msg", "true");
			map.put("nickName", user.getNickName()+"님은 블랙리스트입니다.");
			map.put("startDate", user.getBlacklistStartDate().toLocaleString());
			map.put("endDate", user.getBlacklistEndDate().toLocaleString());
	
			System.out.println("으으응?"+user.getBlacklistEndDate());
			System.out.println(user);
				System.out.println("이새키 블랙이다");
				
				return map;
		}
		else {
			map.put("msg", "false");
			return map;
		}

	}
	@RequestMapping(value = "rest/mailSender")
	public Map<String,Object> mailSender(String Email , String emailcode, HttpServletRequest request, ModelMap mo, HttpSession session2) throws Exception {
	
		
		System.out.println("이메일 인증 들어왔다"+Email);
		Map<String,Object> map = new HashMap<String,Object>();
		User user = new User();
		
		 user = userService.getUser(Email);
		
		 System.out.println(user+"유저 뭐찍힘?");
		
		 if(user !=null) {
				map.put("msg", "bad");
				return map;
			}
		 
		String host = "smtp.gmail.com"; 
		
		final String username = "gogo1705";
		final String password = "qkqhsl135!"; 
	
		int port=465; //포트번호 
		
		StringBuffer buffer = new StringBuffer();
		for ( int i = 0; i<= 6; i++) {
			int n = (int) (Math.random() * 10);
			buffer.append(n);
		}
		buffer.toString();
		String check = buffer.toString();
		// 메일 내용 
		String recipient = Email;
		//받는 사람의 메일주소를 입력해주세요. 
		String subject = "T-GET 인증번호 확인 메일입니다."; //메일 제목 입력해주세요. 
		String body = "T-GET 이메일 인증번호 ["+check+"]"; //메일 내용 입력해주세요. 
		Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성
		// SMTP 서버 정보 설정 
		props.put("mail.smtp.host", host); 
		props.put("mail.smtp.port", port); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host); 
		//Session 생성 
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un=username; 
			String pw=password; 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw); } }); 
		session.setDebug(true); 
		//for debug 
		Message mimeMessage = new MimeMessage(session);
		//MimeMessage 생성 
		mimeMessage.setFrom(new InternetAddress("XXXXXXXX@naver.com")); 
		//발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요. 
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		//수신자셋팅  //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 
		mimeMessage.setSubject(subject);//제목셋팅 
		mimeMessage.setText(body);//내용셋팅
		Transport.send(mimeMessage); //javax.mail.Transport.send() 이용 }
	
		System.out.println("받은거"+check);
	
		
		
	
		map.put("check", check);
		
		return map;
	}
		
	}
