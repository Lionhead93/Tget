package com.tget.web.user;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tget.common.domain.Page;
import com.tget.common.domain.Search;
import com.tget.service.user.Config;
import com.tget.service.user.KakaoUserInfo;
import com.tget.service.user.UserService;
import com.tget.service.user.kakao_restapi;
import com.tget.service.user.naverUserInfo;
import com.tget.service.user.naver_restapi;
import com.tget.service.user.domain.User;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	///Field
	User user = new User();
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
		
	public UserController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="finduserId", method=RequestMethod.GET )
	public String finduserId() throws Exception{
	
		System.out.println("/user/finduserId : GET");
		
		return "redirect:/user/finduserId.jsp";
	}
	
	@RequestMapping( value="findPassword", method=RequestMethod.GET )
	public String findPassword() throws Exception{
	
		System.out.println("/user/findPassword : GET");
		
		return "redirect:/user/findPassword.jsp";
	}
	
	
	@RequestMapping( value="addUser", method=RequestMethod.GET )
	public String addUser() throws Exception{
	
		System.out.println("/user/addUser : GET");
		
		return "redirect:/user/addUserView.jsp";
	}
	
	@RequestMapping( value="addUser", method=RequestMethod.POST )
	public String addUser( @ModelAttribute("user") User user , HttpServletRequest request , HttpSession session) throws Exception {

		System.out.println("/user/addUser : POST");
		//Business Logic

		if(session.getAttribute("kakaoId")!=null) {
			System.out.println("카카오 계정 회원가입 들옴");
		user.setKakaoId((String) session.getAttribute("kakaoId"));
		}
		if(session.getAttribute("naverId")!=null) {
			System.out.println("네이버 계정 회원가입 들옴");
		user.setNaverId((String) session.getAttribute("naverId"));
		}
		
		
		userService.addUser(user);
		
		session.setAttribute("user", user);
	
		return "redirect:/";
		
	}
	


	
	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model 占쏙옙 View 占쏙옙占쏙옙
		model.addAttribute("user", user);
		
		return "forward:/user/getUser.jsp";
	}
	
	@RequestMapping( value="myPage", method=RequestMethod.GET )
	public String myPage( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model 占쏙옙 View 占쏙옙占쏙옙
		model.addAttribute("user", user);
		
		return "forward:/user/myPage.jsp";
	}
	
	
	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public String updateUser( @RequestParam("userId") String userId , Model model ) throws Exception{

		System.out.println("/user/updateUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model 占쏙옙 View 占쏙옙占쏙옙
		model.addAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
	}

	@RequestMapping( value="updateUser", method=RequestMethod.POST )
	public String updateUser( @ModelAttribute("user") User user , Model model , HttpSession session) throws Exception{

		System.out.println("/user/updateUser : POST");
		//Business Logic
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}
		
		return "redirect:/user/getUser?userId="+user.getUserId();
	}
	
	@RequestMapping( value="updatePassword", method=RequestMethod.GET )
	public String updatePassword(@RequestParam("userId") String userId , @RequestParam("password") String password, Model model ) throws Exception{

		System.out.println("updatePassword 컨트롤러시작");
	
		User user = userService.getUser(userId);
		
		user.setPassword(password);
		
		userService.updatePassword(user);
		
		model.addAttribute("user", user);
		
		
		
		return "redirect:/";
	}
	
	
	
	
	@RequestMapping( value="addblacklist", method=RequestMethod.POST )
	public String addBlacklist( @RequestParam("userId") String userId , HttpServletRequest request) throws Exception {

		System.out.println("/user/addblacklist : GET");
		
		User user = userService.getUser(userId);
		
		System.out.println(user.getUserId());
		System.out.println(user+";;'");
		userService.addBlacklist(user);

		return "redirect:/user/listUser.jsp";
		
	}
	
	@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/user/logon : GET");

		return "redirect:/user/loginView.jsp";
	}
	@RequestMapping( value="login", method=RequestMethod.POST )
	public String login(@ModelAttribute("user") User user , HttpSession session) throws Exception{
		
		System.out.println("/user/login : POST");
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		
		if(user.getUserId()!=null) {                                                                     
		
			if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
				}
			
		}

		return "redirect:/";
	}

	@RequestMapping( value="logout", method=RequestMethod.GET )
	public String logout(HttpSession session ) throws Exception{
		
		System.out.println("/user/logout : POST");
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping( value="listUser" )
	public String listUser( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/user/listUser : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map=userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/user/listUser.jsp";
	}
	
	
	
	
	
	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	/*@ResponseBody
	@RequestMapping(value = "/nickNameCheck", method = RequestMethod.POST)
	public int postIdCheck(HttpServletRequest req) throws Exception {
	 System.out.println("post nickNameCheck");
	 
	 String nickName = req.getParameter("nickName");
	 User idCheck =  userService.checknickNameDuplication(nickName);
	 
	 int result = 0;
	 
	 if(idCheck != null) {
	  result = 1;
	 } 
	 
	 return result;
	}*/
	
	
	/*@ResponseBody
	@RequestMapping(value = "sendSms", method = RequestMethod.POST) 
	public String sendSms(String receiver) { 
	
		System.out.println("들어왔니?");
		int rand = (int) (Math.random() * 899999) + 100000; 
		
		     user.setCode(String.valueOf(rand));
		
		
		String hostname = "api.bluehouselab.com";
	        String url = "https://"+hostname+"/smscenter/v1.0/sendsms";
	        
	        CredentialsProvider credsProvider = new BasicCredentialsProvider();
	        credsProvider.setCredentials(
	            new AuthScope(hostname, 443, AuthScope.ANY_REALM),
	            new UsernamePasswordCredentials(Config.appid, Config.apikey)
	        );

	        // Create AuthCache instance
	        AuthCache authCache = new BasicAuthCache();
	        authCache.put(new HttpHost(hostname, 443, "https"), new BasicScheme());

	        // Add AuthCache to the execution context
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
	                    System.out.println(line);
	                inputStream.close();
	            }
	        } catch (Exception e) {
	            System.err.println("Error: "+e.getLocalizedMessage());
	        } finally {
	            client.getConnectionManager().shutdown();
	        }
	        return "true";
	}*/
	
/*@RequestMapping( value="finduserId", method=RequestMethod.GET )
public String finduserId( @RequestParam("phone") String phone , Model model ) throws Exception {
	
	System.out.println("/user/finduserId : GET");
	//Business Logic
	User user = userService.finduserId(phone);
	// Model 占쏙옙 View 占쏙옙占쏙옙
	model.addAttribute("user", user);
	
	return "forward:/user/finduserId.jsp";
}	
*/

@RequestMapping(value = "oauth")
public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) throws Exception {
	
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
    
    JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(node.get("access_token"));
    
    JsonNode kakao_account = userInfo.path("kakao_account");
    
    String kakaoId = userInfo.path("id").asText();
    
    String token = node.path("access_token").asText();
    
    String email = null;
    
    email = kakao_account.path("email").asText();

    System.out.println("토큰 나와라 얍"+token);
    
    String userId = userInfo.path("kakao_account").asText();
    
    System.out.println("id : " + kakaoId);

    System.out.println("userId"+ userId+""+email+"이메일ㅇ느?");
    
    User user = userService.getKakao(kakaoId);
    
    		if(user != null) {


    	user = userService.getUser(user.getUserId());
    	
    	System.out.println("기존 카카오 계정이네"+user);
    	
    		user.setKakaoToken(token);
    	
			session.setAttribute("user", user);
		
				
		return "forward:/user/kakaoResult.jsp";
	}

    	
    	
    else {
    	
    	session.setAttribute("kakaoId", kakaoId);
    	
    	System.out.println("신규 카카오 계정이네 회원가입으로 보내자");
    	
    	return "forward:/user/kakaoResult.jsp";
    }
    }
    
  @RequestMapping(value = "callback")
  public String naverLogin(@RequestParam("code") String code , Model model,ServletRequest request, HttpSession session) throws Exception {
	   
	    System.out.println("코드 값 주냐? 안주지?시벌ㄹ?"+code);

	    naver_restapi kr = new  naver_restapi();
	    //결과값을 node에 담아줌
	    JsonNode node = kr.getAccessToken(code);
	    //결과값 출력
	    System.out.println("코드있냐?"+code);
	    
	    System.out.println("노드들감?"+node);
	    
	    JsonNode userInfo = naverUserInfo.getNaverUserInfo(node.get("access_token"));
	    
	    String naver = userInfo.toString();
	    
	    String naverId =userInfo.path("response").path("id").asText();
	    
	    
	    
	    String token = node.path("access_token").asText();

	    System.out.println("토큰 나와라 얍"+token);
	    
	    System.out.println("뭐 담겺냐?"+naver);
	    
	    System.out.println("id : " + naverId);

	    User user = userService.getNaver(naverId);
	    
	    System.out.println(user+"네이버 유저정보");
	    
		if(user != null) {


	user = userService.getUser(user.getUserId());
	
	System.out.println("기존 네이버 계정이네"+user);
		
		session.setAttribute("user", user);
	
			
	return "forward:/user/kakaoResult.jsp";
}

	
	
else {
	
	session.setAttribute("naverId", naverId);
	
	System.out.println("신규 네이버 계정이네 회원가입으로~!");
	
	return "forward:/user/kakaoResult.jsp";
}
}
	    
  }

