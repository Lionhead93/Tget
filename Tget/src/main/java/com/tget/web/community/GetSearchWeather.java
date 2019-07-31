package com.tget.web.community;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;

import com.tget.service.community.domain.Weather;

public class GetSearchWeather {

	public static Weather getSearchweather(Weather weather)throws Exception{
		
		//List<String> lon = new ArrayList<String>();
		
		String lon = "127.027567";  //경도 , 
        String lat = "37.497985";	//37.498424 126.867240
		//HttpClient httpClient = new DefaultHttpClient();
		//weather.getLat() weather.getLon()
		String urlstr = "http://api.openweathermap.org/data/2.5/weather?"
                + "lat="+lat+"&lon="+lon
                +"&appid=84ac436b251ba211b816950cd0b486d8";
		
		//HttpGet httpGet = new HttpGet(urlstr);
		
		//httpGet.setHeader("Accept", "application/json");
		//httpGet.setHeader("Content-Type" , "application/json");
		
        try{
            //고척 스타디움 위도와 경도
               //위도 
            //HttpResponse httpResponse = httpClient.execute(httpGet);
            //HttpEntity httpEntity = httpResponse.getEntity();
            //OpenAPI URL
            
            URL url = new URL(urlstr);
            BufferedReader bf;
            String line;
            String result="";

            //날씨 정보를 받아온다
            //InputStream is = httpEntity.getContent();
            bf = new BufferedReader(new InputStreamReader(url.openStream()));

            //버퍼에 있는 정보를 문자열로 변환한다
            while((line=bf.readLine())!=null){
                result=result.concat(line);
                //System.out.println(line);
            }

            //문자열을 JSON으로 파싱
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObj = (JSONObject) jsonParser.parse(result);

            //지역 출력
            System.out.println("지역 : " + jsonObj.get("name"));
            
            //날씨 출력
            JSONArray weatherArray = (JSONArray) jsonObj.get("weather");
            JSONObject obj = (JSONObject) weatherArray.get(0);
            System.out.println("날씨 : "+obj.get("main"));

            //온도 출력(절대온도라서 변환 필요)
            JSONObject mainArray = (JSONObject) jsonObj.get("main");
            double ktemp = Double.parseDouble(mainArray.get("temp").toString());
            double temp = ktemp-273.15;
            System.out.printf("온도 : %.2f\n",temp);
            
            //풍속 출력
            JSONObject speedArray = (JSONObject) jsonObj.get("wind");
            double wind = Double.parseDouble(speedArray.get("speed").toString());
            System.out.println("풍속 : "+ wind);
            
            
            //흐림 %
            JSONObject cloudArray = (JSONObject) jsonObj.get("clouds");
            double cloud = Double.parseDouble(cloudArray.get("all").toString());
            System.out.println("흐림 : "+ cloud+" %");
            
            weather.setLat(lat);
            weather.setLon(lon);
            weather.setWeather((String)obj.get("main"));
            weather.setTemp(String.format("%.2f\n", temp));
            weather.setWind(String.format("%.2f\n", wind));
            weather.setClouds(String.format("%.2f\n", cloud));
            
            bf.close();

            
//            //지난 3시간 동안 비의 양, mm
//            JSONObject rainArray = (JSONObject) jsonObj.get("rain");
//            System.out.println(rainArray);
//            double rain = Double.parseDouble(rainArray.get("3h").toString());
//            System.out.println("지난 3시간 동안 비의 양"+ rain+"mm");
//            
//            //지난 3시간 동안 눈의 양, mm
//            JSONObject snowArray = (JSONObject) jsonObj.get("snow");
//            System.out.println(snowArray);
//            double snow = Double.parseDouble(snowArray.get("3h").toString());
//            System.out.println("지난 3시간 동안 눈의 양"+ snow+"mm");
            
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return weather;
    }
	
	
}