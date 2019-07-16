package com.tget.web.user;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@RequestMapping( value="json/login", method=RequestMethod.POST )
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
	}
	
	@RequestMapping(value= "json/sendSms", method=RequestMethod.POST ) 
	public String sendSms(String receiver) { 
	System.out.println("뜨냐?");
		
		int rand = (int) (Math.random() * 899999) + 100000; 
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
	        return "true";

	}  
	@RequestMapping("json/smsCheck") 
	public String smsCheck(String code){ 
		
		String saveCode = code;//데이터베이스에 저장된 코드 불러오기 
				if(code==saveCode) { 
					return "ok"; 
				}else { 
					return "no";
					}
				}
	
	
}