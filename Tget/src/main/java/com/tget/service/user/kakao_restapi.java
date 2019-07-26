package com.tget.service.user;

	import java.io.IOException;
	import java.io.UnsupportedEncodingException;
	import java.util.ArrayList;
	import java.util.List;
	 
	import org.apache.http.HttpResponse;
	import org.apache.http.NameValuePair;
	import org.apache.http.client.ClientProtocolException;
	import org.apache.http.client.HttpClient;
	import org.apache.http.client.entity.UrlEncodedFormEntity;
	import org.apache.http.client.methods.HttpPost;
	import org.apache.http.impl.client.HttpClientBuilder;
	import org.apache.http.message.BasicNameValuePair;
	import org.codehaus.jackson.JsonNode;
	import org.codehaus.jackson.map.ObjectMapper;
	 
	public class kakao_restapi {
		
		
		public JsonNode getAccessToken(String autorize_code) {
			 
	        final String RequestUrl = "https://kauth.kakao.com/oauth/token";
	 
	        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
	 
	        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
	 
	        postParams.add(new BasicNameValuePair("client_id", "ea9f389c17a2bd4b4fd122a0c9184bc2"));
	 
	        postParams.add(new BasicNameValuePair("redirect_uri", "http://192.168.0.16:8080/user/oauth"));
	 
	        postParams.add(new BasicNameValuePair("code", autorize_code));
	 
	        final HttpClient client = HttpClientBuilder.create().build();
	 
	        final HttpPost post = new HttpPost(RequestUrl);
	 
	        JsonNode returnNode = null;
	 
	        try {
	 
	            post.setEntity(new UrlEncodedFormEntity(postParams));
	 
	            final HttpResponse response = client.execute(post);
	 
	            ObjectMapper mapper = new ObjectMapper();
	 
	            returnNode = mapper.readTree(response.getEntity().getContent());
	 
	        } catch (UnsupportedEncodingException e) {
	 
	            e.printStackTrace();
	 
	        } catch (ClientProtocolException e) {
	 
	            e.printStackTrace();
	 
	        } catch (IOException e) {
	 
	            e.printStackTrace();
	 
	        } finally {
	 
	        }
	 
	        return returnNode;
	 
	    }
	}
