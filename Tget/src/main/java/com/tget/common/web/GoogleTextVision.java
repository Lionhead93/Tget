package com.tget.common.web;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.tomcat.util.codec.binary.Base64;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Value;

public class GoogleTextVision {
	
	public static String getBase64(File imagefile) throws Exception{
		
		FileInputStream inputStream = null;
        ByteArrayOutputStream byteOutStream = null;
		
		inputStream = new FileInputStream( imagefile );
        byteOutStream = new ByteArrayOutputStream();

        int len = 0;
        byte[] buf = new byte[1024];
        
        while( (len = inputStream.read( buf )) != -1 ) {
             byteOutStream.write(buf, 0, len);
        }

        byte[] fileArray = byteOutStream.toByteArray();
        
        String imageData = new String( Base64.encodeBase64( fileArray ) );
        
        return imageData;		
	}
	
	public static JSONObject getVisionRequest(String imageBase64) throws Exception{
		
		File file = new File("C:\\Users\\user\\git\\Tget\\Tget\\src\\main\\resources\\config\\textvision.json");		
		FileInputStream fis = new FileInputStream(file);		
		BufferedReader br = new BufferedReader(new InputStreamReader(fis,"UTF-8"));
		
		JSONObject jsonob = (JSONObject) JSONValue.parse(br);
		System.out.println(jsonob);
		
		JSONArray request1 = (JSONArray) jsonob.get("requests");
		JSONObject request2 = (JSONObject) request1.get(0);
		JSONObject image = (JSONObject) request2.get("image");
		image.put("content", imageBase64);
				
		return jsonob;		
	}
	
	public static String getText(JSONObject requestBody) throws Exception {
		// TODO Auto-generated method stub
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "https://vision.googleapis.com/v1/images:annotate?key=AIzaSyBWmO_H-zGbKdEyVBLz_XiM21FbUDsWFKY";
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Content-Type", "application/json");
		
		
		HttpEntity httpEntity01 = new StringEntity(requestBody.toString(),"utf-8");

		httpPost.setEntity(httpEntity01);
		HttpResponse httpResponse = httpClient.execute(httpPost);
			
		HttpEntity httpEntity = httpResponse.getEntity();
			
		InputStream is = httpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		//description Á¢±Ù
		JSONObject jsonobj = (JSONObject)JSONValue.parse(br);	
		JSONArray jarray = (JSONArray) jsonobj.get("responses");
		JSONObject responses = (JSONObject) jarray.get(0);		
		JSONArray textanno = (JSONArray) responses.get("textAnnotations");
		JSONObject textobj = (JSONObject) textanno.get(0);				
		
		String description = (String) textobj.get("description");		
		
		return description;		
	}
	
	public static String getDeliveryNo(String description) throws Exception {
		
		String[] sa = description.split("\n");
		
		String result = "";
		
		for(String aa : sa) {
			
			if(aa.split("-").length>2) {
				
				String[] bb = aa.split(" ");
				
				for(String cc : bb) {
					
					if(cc.contains("-")) {
						
						result = cc.replaceAll("-", "");
						break;
					}
				}
			}			
		}
			
		return result;
	}
	
	public static String getTranWhat(String description) throws Exception {
		
		File file = new File("C:\\Users\\user\\git\\Tget\\Tget\\src\\main\\resources\\config\\trancompa.json");		
		FileInputStream fis = new FileInputStream(file);		
		BufferedReader br = new BufferedReader(new InputStreamReader(fis,"UTF-8"));				
		JSONObject jsoncom = (JSONObject) JSONValue.parse(br);
				
		String company = (String) jsoncom.get("company");
		String[] companyList = company.split(",");
		System.out.println(company);
		String result = null;
		
		for(String tmp : companyList) {
			
			if(description.contains(tmp)) {
				result = tmp;
			}			
		}
			
		return result;
	}
	

}
