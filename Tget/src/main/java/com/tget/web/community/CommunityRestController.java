package com.tget.web.community;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tget.service.community.CommunityService;
import com.tget.service.community.domain.Content;

@RestController
@RequestMapping("/community/*")
public class CommunityRestController {
	
	///Field
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	//setter Method 구현 않음
		
	public CommunityRestController(){
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	@RequestMapping( value="json/getContent/{contentNo}", method=RequestMethod.GET ) //GET방식은 {prodNo}처럼 명시를 해줘야하지만
	public Map getContent( @PathVariable int contentNo ) throws Exception{//       POST방식의 경우 Body로 바로 가므로 명시하지않고 바로 접근이 가능
		
		System.out.println("/community/json/getContent : GET");
		
		Content content = communityService.getContent(contentNo);
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("content", content);
		
		return map;
	}
}