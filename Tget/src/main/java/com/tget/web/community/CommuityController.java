package com.tget.web.community;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tget.common.domain.Page;
import com.tget.common.domain.Search;
import com.tget.service.community.CommunityService;
import com.tget.service.community.domain.Content;
import com.tget.service.community.domain.Reply;
import com.tget.service.community.domain.Report;
import com.tget.service.transaction.TranService;
import com.tget.service.user.UserService;
import com.tget.service.user.domain.User;

@Controller
@RequestMapping("/community/*")
public class CommuityController {

		///Field
		@Autowired
		@Qualifier("communityServiceImpl")
		private CommunityService communityService;
		private UserService userService;
		private TranService tranService;
			
		public CommuityController(){
			System.out.println(this.getClass());
		}
		
		@Value("#{commonProperties['pageUnit']}")
		//@Value("#{commonProperties['pageUnit'] ?: 3}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		//@Value("#{commonProperties['pageSize'] ?: 2}")
		int pageSize;
		
		//@Value("#{commonProperties['fileroot']}")
		//String fileroot;
		
		
		
		@RequestMapping(value="addContent", method=RequestMethod.GET)
		public String addContent() throws Exception {

			System.out.println("content/addContent: GET");
			
			return "forward:/community/addContent.jsp";
		}
		
		@RequestMapping(value="addContent", method=RequestMethod.POST)
		public String addContent( @ModelAttribute("content") Content content) throws Exception {
			//, @RequestParam("file") MultipartFile file
			System.out.println("content/addContent: POST");
			//Business Logic
			//String fileName = file.getOriginalFilename();
			
			//File f = new File(fileroot, fileName);
			//String originFileName =  file.getOriginalFilename();
					
			//String uploadFile = System.currentTimeMillis()+ originFileName;
//			String safeFile = fileroot + uploadFile;
//			
//			try {
//				file.transferTo(new File(fileroot , uploadFile ));
//				
//			} catch(IOException e) {
//				e.printStackTrace();
//			}
//			
//			content.setFileName(uploadFile);
			communityService.addContent(content);
			
			return "forward:/community/getContentList";
		}
		
		@RequestMapping(value="addReport", method=RequestMethod.GET)
		public String addReport(@RequestParam("contentNo") int contentNo, @ModelAttribute("content") Content content, Model model) throws Exception {

			System.out.println("community/addReport: GET");
			
			Content content1 = communityService.getContent(contentNo);
			
			model.addAttribute("content", content1);
			
			return "forward:/community/addReport.jsp";
		}
		
		@RequestMapping(value="addReport", method=RequestMethod.POST)
		public String addReport(@ModelAttribute("report") Report report) throws Exception {

			System.out.println("community/addContent: POST");
			//User user = userService.getUser("userId");
			
			communityService.addReport(report);
			//report.getBlackId();
			//userService.addBlacklist();
			
			return "forward:/community/getReportList";
		}

		@RequestMapping(value="getContent" , method= RequestMethod.GET)// View의 요청 경로 지정 
		public String getContent( @RequestParam("contentNo") int contentNo , Model model) throws Exception {
			
			System.out.println("/community/getContent: GET");
			
			Content content = communityService.getContent(contentNo);

			//Model객체를 이용해서 View로 데이터 전달
			model.addAttribute("content", content);
			//System.out.println("menu : "+menu);
			
			return "forward:/community/getContent.jsp";
		}
	
		@RequestMapping(value="updateContent" , method= RequestMethod.GET)
		public String updateContent( @RequestParam("contentNo") int contentNo , Model model) throws Exception{

			System.out.println("/community/updateContent: GET");
			//Business Logic			
			
			model.addAttribute("content", communityService.getContent(contentNo));
			
			return "forward:/community/updateContent.jsp";
		}
		
		@RequestMapping(value="updateContent" , method= RequestMethod.POST)
		public String updateContent( @ModelAttribute("content") Content content) throws Exception{

			System.out.println("/community/updateContent: POST");
			//Business Logic			
			communityService.updateContent(content);
			
			return "forward:/community/getContent";
		}
		
		
		
//		@RequestMapping(value="updateContent")
//		public String updateContent( @RequestParam("contentNo") int contentNo , Model model ) throws Exception{
//
//			System.out.println("/prdouct/updateContent: GET");
//			//Business Logic
//			Content content = communityService.getContent(contentNo);
//			
//			model.addAttribute("content", content);
//			
//			return "forward:/product/updateContent.jsp";
//		}
		
	
		@RequestMapping(value="getContentList")
		public String getContentList( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
			
			System.out.println("/community/getContentList: GET/ POST");
			
			if(search.getCurrentPage() ==0 ){
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			// Business logic
			Map<String , Object> map=communityService.getContentList(search);
			
			// Model and View 
			model.addAttribute("list", map.get("list"));
			model.addAttribute("totalCount", map.get("totalCount"));
			model.addAttribute("search", search);
			
			return "forward:/community/getContentList.jsp";
		}
		
		@RequestMapping(value="getReportList")
		public String getReportList( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
			
			System.out.println("/community/getReportList: GET/ POST");
			
			if(search.getCurrentPage() ==0 ){
				search.setCurrentPage(1);
			}
			search.setPageSize(pageSize);
			
			// Business logic
			Map<String , Object> map=communityService.getReportList(search);
			/////수정필요....
			//Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
			//System.out.println(resultPage);
			System.out.println( map.get("list"));
			// Model and View 
			model.addAttribute("list", map.get("list"));
			//model.addAttribute("resultPage", resultPage);
			model.addAttribute("search", search);
			
			return "forward:/community/getReportList.jsp";
		}
	}