package com.tget.web.user;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Map;

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

		if(session!=null) {
			System.out.println("Ä«Ä«¿À °èÁ¤ È¸¿ø°¡ÀÔ µé¿È");
		user.setKakaoId((String) session.getAttribute("kakaoId"));
		}
		
		userService.addUser(user);
		
	
		return "redirect:/user/loginView.jsp";
		
	}
	


	
	@RequestMapping( value="getUser", method=RequestMethod.GET )
	public String getUser( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model ï¿½ï¿½ View ï¿½ï¿½ï¿½ï¿½
		model.addAttribute("user", user);
		
		return "forward:/user/getUser.jsp";
	}
	
	@RequestMapping( value="myPage", method=RequestMethod.GET )
	public String myPage( @RequestParam("userId") String userId , Model model ) throws Exception {
		
		System.out.println("/user/getUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model ï¿½ï¿½ View ï¿½ï¿½ï¿½ï¿½
		model.addAttribute("user", user);
		
		return "forward:/user/myPage.jsp";
	}
	
	
	@RequestMapping( value="updateUser", method=RequestMethod.GET )
	public String updateUser( @RequestParam("userId") String userId , Model model ) throws Exception{

		System.out.println("/user/updateUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model ï¿½ï¿½ View ï¿½ï¿½ï¿½ï¿½
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

		System.out.println("updatePassword ÄÁÆ®·Ñ·¯½ÃÀÛ");
	
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
	
/*	@RequestMapping( value="snslogin", method=RequestMethod.GET )
	public String snslogin(@ModelAttribute("user") User user , HttpSession session) throws Exception{
		
		System.out.println("/user/snslogin : POST");
		//Business Logic
		User dbUser=userService.getUser(user.getUserId());
		
		if(user.getUserId()!=null) {
			
			session.setAttribute("user", dbUser);
		}

		return "redirect:/";
	}*/
	

	
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
	
	
	@ResponseBody
	@RequestMapping(value = "sendSms", method = RequestMethod.POST) 
	public String sendSms(String receiver) { 
	
		System.out.println("µé¾î¿Ô´Ï?");
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
	}

@RequestMapping(value = "smsCheck", method = RequestMethod.POST) 
public String smsCheck(String code){ 
	
	
	
	
	System.out.println("¹ÞÀº°Å"+user.getCode());
	System.out.println("¾´°Å"+code);
	
	if(code.equals(user.getCode())) {
		System.out.println("ÀÏÄ¡");
		return "true";
		}else { 
			System.out.println("ºÒÀÏÄ¡");
			return "false"; 
			} 
}
	
/*@RequestMapping( value="finduserId", method=RequestMethod.GET )
public String finduserId( @RequestParam("phone") String phone , Model model ) throws Exception {
	
	System.out.println("/user/finduserId : GET");
	//Business Logic
	User user = userService.finduserId(phone);
	// Model ï¿½ï¿½ View ï¿½ï¿½ï¿½ï¿½
	model.addAttribute("user", user);
	
	return "forward:/user/finduserId.jsp";
}	
*/

@RequestMapping(value = "oauth")
public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) throws Exception {
    System.out.println("·Î±×ÀÎ ÇÒ¶§ ÀÓ½Ã ÄÚµå°ª");
    //Ä«Ä«¿À È¨ÆäÀÌÁö¿¡¼­ ¹ÞÀº °á°ú ÄÚµå
    System.out.println(code);
    System.out.println("·Î±×ÀÎ ÈÄ °á°ú°ª");
    
    //Ä«Ä«¿À rest api °´Ã¼ ¼±¾ð
    kakao_restapi kr = new kakao_restapi();
    //°á°ú°ªÀ» node¿¡ ´ã¾ÆÁÜ
    JsonNode node = kr.getAccessToken(code);
    //°á°ú°ª Ãâ·Â
    System.out.println(node);
    
    JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(node.get("access_token"));
    
    JsonNode kakao_account = userInfo.path("kakao_account");
    
    String kakaoId = userInfo.path("id").asText();
    
    String token = node.path("access_token").asText();
    
    String email = null;
    
    email = kakao_account.path("email").asText();

    System.out.println("ÅäÅ« ³ª¿Í¶ó ¾å"+token);
    
    String userId = userInfo.path("kakao_account").asText();
    
    System.out.println("id : " + kakaoId);

    System.out.println("userId"+ userId+""+email+"ÀÌ¸ÞÀÏ¤·´À?");
    
    User user = userService.getKakao(kakaoId);
    
    		if(user != null) {


    	user = userService.getUser(user.getUserId());
    	
    	System.out.println("±âÁ¸ Ä«Ä«¿À °èÁ¤ÀÌ³×"+user);
    	
    		user.setKakaoToken(token);
    	
			session.setAttribute("user", user);
		
				
		return "forward:/user/kakaoResult.jsp";
	}

    	
    	
    else {
    	
    	session.setAttribute("kakaoId", kakaoId);
    	
    	System.out.println("½Å±Ô Ä«Ä«¿À °èÁ¤ÀÌ³× È¸¿ø°¡ÀÔÀ¸·Î º¸³»ÀÚ");
    	
    	return "forward:/user/kakaoResult.jsp";
    }
    }
    
    //³ëµå ¾È¿¡ ÀÖ´Â access_token°ªÀ» ²¨³» ¹®ÀÚ¿­·Î º¯È¯
    //    String token = node.get("access_token").toString();
    //¼¼¼Ç¿¡ ´ã¾ÆÁØ´Ù.
    //    session.setAttribute("token", token);
    		

    


		}







