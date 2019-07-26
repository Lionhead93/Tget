package com.tget.web.user;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
import org.codehaus.jackson.JsonNode;
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
import com.tget.service.user.Config;
import com.tget.service.user.UserService;
import com.tget.service.user.kakao_restapi;
import com.tget.service.user.domain.User;



//==> 회원관리 RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	User user = new User();

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
	
	


/*	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(	@RequestBody User user,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return dbUser;
	}*/
	
	@RequestMapping(value= "json/sendSms", produces="application/json" , method=RequestMethod.POST ) 
	public String sendSms(String receiver) { 
	System.out.println("뜨냐?");
		
		int rand = (int) (Math.random() * 899999) + 100000; 
		
	     user.setCode(String.valueOf(rand));
		
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
	            String json = "{\"sender\":\""+Config.sender+"\",\"receivers\":[\""+receiver+"\",],\"content\":\""+Config.content+"\"}";
	       
	            StringEntity se = new StringEntity(json, "EUC-KR");
	            httpPost.setEntity(se);
	            System.out.println("뜨냐?6.55");
	            HttpResponse httpResponse = client.execute(httpPost, context);
	            System.out.println("뜨냐?6.66");
	            System.out.println(httpResponse.getStatusLine().getStatusCode());
	            System.out.println("뜨냐?7");
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
	        return "true";

	         
	        
	}  
	
	@RequestMapping( value="json/finduserId" , method=RequestMethod.POST)
	public String finduserId (String phone )throws Exception{
		
		User user = userService.finduserId(phone);
		
		if (user==null){
			return "no";
		}
		
		
		String check = user.getUserId();
		
		System.out.println(check);
		
		return check;
		
	}      
	
	@RequestMapping( value="json/findPassword" , method=RequestMethod.POST)
	public String findPassword (String userId)throws Exception{
		
		System.out.println("들어왔니"); 
		
		User user = userService.getUser(userId);
		System.out.println(user);
		
		if (user==null){
			return "no";
		}
		
		return "yes";
		
	}      

	@RequestMapping(value = "json/smsCheck", produces="application/json" , method=RequestMethod.POST) 
	public String smsCheck(String code){ 
	
		
		
		System.out.println("받은거"+user.getCode());
		System.out.println("쓴거"+code);
		
		if(code.equals(user.getCode())) {
			System.out.println("일치");
			return "true";
			}else { 
				System.out.println("불일치");
				return "false"; 
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
			map.put("nickName", user.getNickName()+"님은 블랙리스트 상태입니다.");
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
	
	/* @RequestMapping(value = "oauth", produces = "application/json")
	    public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) {
	        System.out.println("로그인 할때 임시 코드값");
	        //카카오 홈페이지에서 받은 결과 코드
	        System.out.println(code);
	        System.out.println("로그인 후 결과값");
	        
	        //카카오 rest api 객체 선언
	        kakao_restapi kr = new kakao_restapi();
	        //결과값을 node에 담아줌
	        JsonNode node = kr.getAccessToken(code);
	        //결과값 출력
	        System.out.println(node);
	        //노드 안에 있는 access_token값을 꺼내 문자열로 변환
	        String token = node.get("access_token").toString();
	        //세션에 담아준다.
	        session.setAttribute("token", token);
	        
	        return "forward:/user/logininfo.jsp";
	    }*/


	
	
}